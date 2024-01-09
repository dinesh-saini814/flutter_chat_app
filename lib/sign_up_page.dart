import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/mytext_fild.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                  hintText: 'confirm password',
                  obscureText: true,
                ),

                const SizedBox(
                  height: 25,
                ),

                //sign up button
                MyButton(onTap: () {}, text: "sign up"),

                const SizedBox(
                  height: 25,
                ),

                //signo in button
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already a member?"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Login now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
