import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/screens/employee_screen.dart';
import 'package:crud_firebase/services/employee.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EmployeeScreen()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold)),
            Text("Firebase",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: EmployeeServices().getEmployee(),
          builder: (context, snapshot) {
            //! Error State
            if (snapshot.hasError) {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
            // * Loading State
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // * Actual Data
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(16),
                  child: Card(
                      child: Padding(
                    padding: EdgeInsets.all(14),
                    child: Row(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name: ${snapshot.data!.docs[index]["name"]}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            Text(
                              "Age: ${snapshot.data!.docs[index]["age"]}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
                            Text(
                              "Location: ${snapshot.data!.docs[index]["location"]}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ]),
                      const Expanded(child: SizedBox()),
                      Row(children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon:
                                const Icon(Icons.delete, color: Colors.orange)),
                      ])
                    ]),
                  )),
                );
              },
            );
          }),
    );
  }
}
