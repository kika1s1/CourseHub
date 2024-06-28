import 'package:course_hub/components/discover_icon.dart';
// import 'package:course_hub/components/my_drawer.dart';
import 'package:course_hub/constants/constants.dart';
import 'package:course_hub/screens/calendar.dart';
import 'package:course_hub/screens/cgpa_calculator_screen.dart';
import 'package:course_hub/screens/clubs_screen.dart';
import 'package:course_hub/screens/contact_detail_screen.dart';
import 'package:course_hub/screens/rules_and_regulations_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  late final AnimationController controller; // Changed to late final
  Animation? animation;
  String? username;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    controller
        .forward(); // Changed from controller?.forward() to controller.forward()
    controller.addListener(() {
      setState(() {});
    });

    fetchUsername();
  }

  Future<void> fetchUsername() async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');

    if (token == null) {
      // Handle missing token
      return;
    }

    final response = await http.get(
      Uri.parse('$baseURL/users/me'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final userJson = json.decode(response.body);
      setState(() {
        username = userJson['username'];
      });
    } else {
      throw Exception('Failed to load user');
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // drawer: const MyDrawer(),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(15),
                ),
                color: Theme.of(context)
                    .colorScheme
                    .surface, // Change the background color
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Welcome, ${username ?? 'Guest'}',
                      style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Explore Categories",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    DiscoverIcon(
                      title: "Curriculum",
                      icon: Icons.school_rounded,
                      onTap: () {},
                    ),
                    const SizedBox(width: 10),
                    DiscoverIcon(
                      title: "Discover Food",
                      icon: Icons.local_dining,
                      onTap: () {},
                    ),
                    DiscoverIcon(
                      title: "GPA / CGPA",
                      icon: Icons.calculate,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GradeCalculatorScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    DiscoverIcon(
                      title: "Discover Rules",
                      icon: Icons.rule,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const RulesAndRegulationsScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    DiscoverIcon(
                      title: "Calendar",
                      icon: Icons.calendar_today,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Calendar(),
                          ),
                        );
                      },
                    ),
                    DiscoverIcon(
                      title: "Phone Number",
                      icon: Icons.phone,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ContactDetailScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    DiscoverIcon(
                      title: "Place",
                      icon: Icons.place,
                      onTap: () {},
                    ),
                    const SizedBox(width: 10),
                    DiscoverIcon(
                      title: "Clubs",
                      icon: Icons.people_outline,
                      onTap: () {
                        MaterialPageRoute(
                          builder: (context) => const ClubsScreen(),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    DiscoverIcon(
                      title: "Course",
                      icon: Icons.book,
                      onTap: () {},
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
