import 'package:course_hub/auth/login_or_register.dart';
import 'package:course_hub/theme/dark_mode.dart';
import 'package:course_hub/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutterfire_ui/flutterfire_ui.dart';
void main() {
  runApp(
    MultiProvider(providers: [
    // Theme provider
    ChangeNotifierProvider(create: (context)=>ThemeProvider()),
    
    ],
    child: const MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // theme: lightMode,
      darkTheme: darkMode,
      themeMode: ThemeMode.system, 
      debugShowCheckedModeBanner: false,
      //home create 
      home:  const LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
