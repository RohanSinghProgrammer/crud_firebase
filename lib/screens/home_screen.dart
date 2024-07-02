import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/screens/employee_screen.dart';
import 'package:crud_firebase/services/employee.dart';
import 'package:crud_firebase/widgets/list_item.dart';
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
                return ListItem(snapshot: snapshot, index: index);
              },
            );
          }),
    );
  }
}
