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
            TextFormField(controller: controller.logInEditingController),
            const SizedBox(height: 50,),
            TextFormField(controller: controller.passwordEditingController,),
            const SizedBox(height: 60,),
            ElevatedButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: controller.logInEditingController.text,
                      password: controller.passwordEditingController.text,
                    );
                  User? user = userCredential.user;
                  if (user != null) {
                    controller.CheckLogInValues();
                    // String uid = user.uid;
                  }

                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided.');
                    }
                    // Handle other authentication errors
                  }
                },
                child: const Text('Log In')
            )
          ]),),
      ),
    );
  }

}