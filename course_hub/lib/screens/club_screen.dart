import 'package:flutter/material.dart';

class ClubScreen extends StatelessWidget {
  const ClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Extract the club data passed as arguments
    final Map<String, dynamic>? clubData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(clubData?['name'] ?? 'Club'), // Use the club's name as the title
        // Other app bar configurations...
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display club image
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                clubData?['image'] ?? 'assets/default_image.png',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            // Display club details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    clubData?['description'] ?? 'No description available',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  // You can display other club details here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
