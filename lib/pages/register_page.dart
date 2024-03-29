// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/mytext_fild.dart';
import 'package:chat_app/survices/auth/auth_survice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasscontroller = TextEditingController();

  //sing up user
  void signUp() async {
    if (passwordcontroller.text != confirmpasscontroller.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password do not match!"),
        ),
      );
      return;
    }

    //get auth survice
    final authSurvice = Provider.of<AuthSurvice>(context, listen: false);

    try {
      await authSurvice.signupWithEmailandPassword(
          emailcontroller.text, passwordcontroller.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  //logo
                  Icon(
                    Icons.message_rounded,
                    size: 100,
                    color: Colors.grey[800],
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  //create account message
                  const Text(
                    "Let's start exploring",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //email textfild
                  MyTextField(
                      controller: emailcontroller,
                      hintText: 'Email',
                      obscureText: false),

                  const SizedBox(
                    height: 10,
                  ),

                  //password textfild
                  MyTextField(
                    controller: passwordcontroller,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //confirm password textfild
                  MyTextField(
                    controller: confirmpasscontroller,
                    hintText: 'Confirm password',
                    obscureText: true,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //sign up button
                  MyButton(onTap: signUp, text: "sign up"),

                  const SizedBox(
                    height: 25,
                  ),

                  //signo in button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already a member?"),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Login now",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
