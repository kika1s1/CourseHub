// ignore_for_file: use_build_context_synchronously
import 'package:course_hub/components/my_drawer_tile.dart';
import 'package:course_hub/data/courses_data.dart';
import 'package:course_hub/screens/about_screen.dart';
import 'package:course_hub/screens/cgpa_calculator_screen.dart';
import 'package:course_hub/screens/clubs_screen.dart';
import 'package:course_hub/screens/courses_screen.dart';
import 'package:course_hub/screens/discover_screen.dart';
import 'package:course_hub/screens/landing_screen.dart';
import 'package:course_hub/screens/my_profile_screen.dart';
// import 'package:course_hub/screens/profile_screen.dart';
import 'package:course_hub/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const FlutterSecureStorage storage = FlutterSecureStorage();

    void logout() async {
      await storage.delete(key: 'token'); // Clear the token
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LandingScreen()),
        (Route<dynamic> route) => false, // This clears all previous routes
      );
    }

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // app logo
          const Column(
            children: [
               Padding(
                padding:  EdgeInsets.only(top: 100.0),
                child:  Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // home
          MyDrawerTile(
            onTap: () {
              Navigator.pop(context);
            },
            text: "H O M E",
            icon: Icons.home,
          ),

          // profile
          MyDrawerTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyProfileScreen(),
                ),
              );
            },
            text: "P R O F I L E",
            icon: Icons.person,
          ),

          // setting
          MyDrawerTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingScreen(),
                ),
              );
            },
            text: "S E T T I N G S",
            icon: Icons.settings,
          ),

          // calculate
          MyDrawerTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GradeCalculatorScreen(),
                ),
              );
            },
            text: "G P A  /  CGPA ",
            icon: Icons.calculate,
          ),

          // club
          MyDrawerTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ClubsScreen(),
                ),
              );
            },
            text: "C L U B S ",
            icon: Icons.rotate_90_degrees_ccw,
          ),

          // courses
          MyDrawerTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CoursesScreen(
                    courses: courses,
                  ),
                ),
              );
            },
            text: "C O U R S E S",
            icon: Icons.book,
          ),

          // explore
          MyDrawerTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DiscoverScreen(),
                ),
              );
            },
            text: "E X P L O R E",
            icon: Icons.calculate,
          ),

          // about
          MyDrawerTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutScreen(),
                ),
              );
            },
            text: "A B O U T",
            icon: Icons.calculate,
          ),

          const Spacer(),

          // logout
          MyDrawerTile(
            onTap: logout,
            text: "L O G O U T",
            icon: Icons.logout,
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
