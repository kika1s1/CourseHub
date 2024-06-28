// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:course_hub/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:course_hub/components/my_button.dart';
import 'package:course_hub/components/my_text_field.dart';
import 'package:course_hub/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;

  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // login method
  void login() async {
    // print("hh");
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    // Send login request to backend
    const String baseUrl = '$baseURL/users/login';
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Login successful, store the token securely
      final token = jsonDecode(response.body)['token'];
      await _storage.write(key: 'token', value: token);

      print('Login successful. Token: $token');

      // Navigate to home screen or perform other actions
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // Login failed, show error message
      print('Login failed. Status code: ${response.statusCode}');
      // Show error message to the user
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content: const Text('Invalid credentials. Please try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              const Icon(
                Icons.menu_book,
                size: 100,
                color: Colors.blue
              ),
              const SizedBox(
                height: 25,
              ),
              // app slogan
              Text(
                "Course Hub",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 20,
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
              // signin
              const SizedBox(
                height: 10,
              ),
              MyButton(onTap: login, text: "Sign In"),
              // not a member
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
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
                      "Register now",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
