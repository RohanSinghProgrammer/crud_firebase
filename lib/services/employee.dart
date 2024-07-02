import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeServices {
  // create instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // GET
  Stream<QuerySnapshot<Map<String, dynamic>>> getEmployee() {
    return _firestore.collection('Employee').snapshots();
  }

  // ADD
  Future addEmployee(Map<String, dynamic> employeeInfo, String id) async {
    try {
      return await _firestore.collection('Employee').doc(id).set(employeeInfo);
    } catch (e) {
      return 'Error while adding employee: $e';
    }
  }

  // UPDATE
  Future updateEmployee(Map<String, dynamic> employeeInfo, String id) async {
    try {
      return await _firestore
          .collection('Employee')
          .doc(id)
          .update(employeeInfo);
    } catch (e) {
      return 'Error while adding employee: $e';
    }
  }

  // DELETE
    Future deleteEmployee(String id) async {
    try {
      return await _firestore.collection('Employee').doc(id).delete();
    } catch (e) {
      return 'Error while adding employee: $e';
    }
  }
}
