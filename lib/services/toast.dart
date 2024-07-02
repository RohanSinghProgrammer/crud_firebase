import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  // success toast
  void success(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  // error toast
  void error(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  // warning toast
  void warning(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.yellow,
        fontSize: 16.0);
  }
}
