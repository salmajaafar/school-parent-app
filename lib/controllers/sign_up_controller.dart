

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_app/views/screens/confirmation_lottie.dart';
import 'package:parent_app/views/screens/logIn.dart';
import 'package:parent_app/views/widget/error_bottomsheet.dart';

import 'package:parent_app/routes/routes.dart';
class SignUpController extends GetxController {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final studentNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isLoading = false.obs;

  void createAccount() {

    
    if (passwordController.text != confirmPasswordController.text) {
      ErrorBottomSheet.showErrorBottomSheet(
        title: "Password Error",
        message: "Passwords do not match",
      );
      return;
    }

   
    if (fullNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        studentNumberController.text.isEmpty ||
        passwordController.text.isEmpty) {

      ErrorBottomSheet.showErrorBottomSheet(
        title: "Missing Data",
        message: "All fields are required",
      );
      return;
    }

    
    isLoading.value = true;

  
    Future.delayed(const Duration(seconds: 2), () async {
      isLoading.value = false;

      Get.snackbar(
        "Success",
        "Account Created Successfully",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      
      Get.to(() => const ConfirmationLottie());

    
    await Future.delayed(const Duration(seconds: 3));
    
    
    Get.offAllNamed(AppRoutes.main);
    });
  }

 
  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    studentNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();















  }
}