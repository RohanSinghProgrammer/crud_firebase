import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.snapshot, required this.index});

  final dynamic snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Card(
          child: Padding(
        padding: EdgeInsets.all(14),
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
                onPressed: () {},
                icon: const Icon(Icons.delete, color: Colors.orange)),
          ])
        ]),
      )),
    );
    ;
  }
}
