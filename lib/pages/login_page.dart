import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/mytext_fild.dart';
import 'package:chat_app/survices/auth/auth_survice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  // sign in user
  void signIn() async {
    //get the auth servise
    final authSurvice = Provider.of<AuthSurvice>(context, listen: false);

    try {
      await authSurvice.signInWithEmailandPassword(
        emailcontroller.text,
        passwordcontroller.text,
      );
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

                //walcome back
                const Text(
                  "welcome back",
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
                  height: 25,
                ),

                //signin button
                MyButton(onTap: signIn, text: "sign in"),

                const SizedBox(
                  height: 25,
                ),

                //signoup button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not a member?"),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Register now",
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
    );
  }
}
