import 'package:crud_firebase/services/toast.dart';
import 'package:crud_firebase/services/employee.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key, this.employee});

  final Map<String, dynamic>? employee;

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  // controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    if (widget.employee != null) {
      isEdit = true;
      // setup initial controller values
      _nameController.text = widget.employee!['name'];
      _ageController.text = widget.employee!['age'].toString();
      _locationController.text = widget.employee!['location'];
    }
  }

  // add data function
  void addData() {
    // generate random id
    String id = randomAlphaNumeric(10);
    CustomToast toast = CustomToast();
    // create a map
    Map<String, dynamic> employeeInfo = {
      "id": id,
      "name": _nameController.text,
      "age": _ageController.text,
      "location": _locationController.text,
    };
    // add data to the database
    EmployeeServices().addEmployee(employeeInfo, id).then((value) {
      toast.success("Employee added successfully!");
      Navigator.pop(context);
    });
    // clear controller valuesRohan si
    _nameController.clear();
    _ageController.clear();
    _locationController.clear();
  }

  // edit data function
  void editData() {
    // generate random id
    String id = widget.employee!["id"];
    CustomToast toast = CustomToast();
    // create a map
    Map<String, dynamic> employeeInfo = {
      "id": id,
      "name": _nameController.text,
      "age": _ageController.text,
      "location": _locationController.text,
    };
    // add data to the database
    EmployeeServices().updateEmployee(employeeInfo, id).then((value) {
      toast.success("Employee updated successfully!");
      Navigator.pop(context);
    });
    // clear controller valuesRohan si
    _nameController.clear();
    _ageController.clear();
    _locationController.clear();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: RichText(
            text: const TextSpan(children: [
          TextSpan(
              text: "Employee",
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: "Form",
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold)),
        ])),
        centerTitle: true,
      ),
      body: Container(
          height: screenHeight * 0.5, // 50% of screen height
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
                TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Age',
                  ),
                ),
                TextField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Location',
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: isEdit ? editData : addData,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              isEdit ? "Update Employee" : "Add Employee",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          )),
                    ),
                  ],
                )
              ])),
    );
  }
}
