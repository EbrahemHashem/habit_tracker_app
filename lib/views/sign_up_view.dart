import 'package:flutter/material.dart';
import 'package:habit_tracker_app/views/sign_in_view.dart';
import 'package:habit_tracker_app/widgets/custom_button.dart';
import 'package:habit_tracker_app/widgets/custom_form_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignIn(),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Text(
                        "Login In",
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
            //name
            CustomFormField(textInput: TextInputType.name, text: 'Name'),
            //email
            CustomFormField(textInput: TextInputType.emailAddress, text: 'Email'),
            //password
            CustomFormField(textInput: TextInputType.visiblePassword, text: "Password"),
            //password confirm
            CustomFormField(textInput: TextInputType.visiblePassword, text: 'Password Confirmation'),
            CustomButton(() {}, Title: 'Sign Up'),
          ],
        ),
      ),
    );
  }
}
