import 'package:crud_firebase/services/employee.dart';
import 'package:crud_firebase/services/toast.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  ListItem({super.key, required this.snapshot, required this.index});

  final dynamic snapshot;
  final int index;

  EmployeeServices employee = EmployeeServices();
  CustomToast toast = CustomToast();

  void deleteEmployee(String id) {
    employee
        .deleteEmployee(id)
        .then((value) => toast.success("Employee deleted successfully!"))
        .catchError((err) {
      toast.error(err.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                onPressed: () =>
                    deleteEmployee(snapshot.data!.docs[index]["id"]),
                icon: const Icon(Icons.delete, color: Colors.orange)),
          ])
        ]),
      )),
    );
  }
}
