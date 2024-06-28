import 'package:course_hub/providers/post_provider.dart';
import 'package:course_hub/screens/club_screen.dart';
import 'package:course_hub/screens/clubs_screen.dart';
import 'package:course_hub/screens/landing_screen.dart';
import 'package:course_hub/theme/dark_mode.dart';
import 'package:course_hub/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostProvider()),
        ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
      ],
      child: const MyApp(),
    ),
    // Theme provider
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: lightMode,
      darkTheme: darkMode,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routes: {
        '/clubs': (context) => const ClubsScreen(),
        '/club': (context) =>
            const ClubScreen(), // Add the route for the club screen
      },
      home: const LandingScreen(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
