// ignore_for_file: must_be_immutable, unused_local_variable, use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker_app/views/home_view.dart';
import 'package:habit_tracker_app/views/sign_up_view.dart';
import 'package:habit_tracker_app/widgets/custom_button.dart';
import 'package:habit_tracker_app/widgets/custom_form_field.dart';
import 'package:habit_tracker_app/widgets/custom_remember.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(210, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.only(top: 65, right: 25, left: 25),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
                    child: const Row(
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 25,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //email
              CustomFormField(
                textInput: TextInputType.emailAddress,
                text: 'Email',
                onChanged: (data) {
                  email = data;
                },
              ),
              //password
              CustomFormField(
                textInput: TextInputType.visiblePassword,
                text: "Password",
                onChanged: (data) {
                  password = data;
                },
              ),
              const CustomRemember(),
              //custom button

              CustomButton(
                title: 'Log In',
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Success"),
                        ),
                      );
                    } on FirebaseAuthException catch (e) {
                      print(e);
                    }
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
