import 'package:flutter/material.dart';
import 'package:habit_tracker_app/views/sign_up_view.dart';
import 'package:habit_tracker_app/widgets/custom_button.dart';
import 'package:habit_tracker_app/widgets/custom_form_field.dart';
import 'package:habit_tracker_app/widgets/custom_remember.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(210, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.only(top: 65, right: 25, left: 25),
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
                        builder: (context) => const SignUp(),
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
            CustomFormField(textInput: TextInputType.emailAddress, text: 'Email'),
            //password
            CustomFormField(textInput: TextInputType.visiblePassword, text: "Password"),
            const CustomRemember(),

            CustomButton(() {}, Title: 'Log In'),
          ],
        ),
      ),
    );
  }
}
