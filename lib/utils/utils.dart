import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils{
  static void showToastMessage({String? title, String? message, Color color = Colors.red, SnackPosition snackPosition = SnackPosition.TOP}) {
    Get.showSnackbar(GetSnackBar(
      borderRadius: 10,
      snackPosition: snackPosition,
      title: title,
      message: message,
      backgroundColor: color,
      duration: const Duration(
          milliseconds: 1500
      ),
    ));
  }

}