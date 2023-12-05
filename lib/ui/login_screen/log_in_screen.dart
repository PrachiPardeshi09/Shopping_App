import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_verito_assignment/ui/login_screen/login_screen_controller.dart';
import 'package:tech_verito_assignment/utils/constants.dart';

class LogInScreen extends GetView<LogInScreenController>{
  static const routeName='/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Constants.logInScreenTitle)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(color: Colors.white,
          child:Column(children: [
            TextField(
              controller: controller.logInEditingController,
              decoration: InputDecoration(labelText: 'Enter phone number'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 50,),
            TextFormField(controller: controller.passwordEditingController,),
            const SizedBox(height: 60,),
            ElevatedButton(
                onPressed: () async {
                  controller.verifyPhoneNumber();
                },
                child: const Text('Log In')
            )
          ]),),
      ),
    );
  }

}