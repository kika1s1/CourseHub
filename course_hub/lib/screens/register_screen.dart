import 'package:course_hub/components/my_button.dart';
import 'package:course_hub/components/my_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final void Function()? onTap;
  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  // register
  void register() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.menu_book,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 25,
            ),
            // app slogan
            Text(
              "Let's create an account for you!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 16,
              ),
            ),
            // email
            const SizedBox(
              height: 25,
            ),

            MyTextField(
              controller: emailController,
              hintText: "Email",
              obsecureText: false,
            ),

            // password
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obsecureText: true,
            ),
            // confirm password
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              controller: confirmPasswordController,
              hintText: "Confirm password",
              obsecureText: true,
            ),

            // Sign up
            const SizedBox(
              height: 10,
            ),
            MyButton(onTap: () {}, text: "Sign Up"),

            // already have an account? login here
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Log In now",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
