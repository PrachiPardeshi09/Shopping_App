import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tech_verito_assignment/routes_and_pages/routes_pages.dart';

class LogInScreenController extends GetxController{
  TextEditingController logInEditingController=TextEditingController();
  TextEditingController passwordEditingController=TextEditingController();



  void CheckLogInValues(){
    if(logInEditingController.text.isNotEmpty && passwordEditingController.text.isNotEmpty){
      Get.toNamed(ProductRoutesPaths.productHome);
    }
  }
}