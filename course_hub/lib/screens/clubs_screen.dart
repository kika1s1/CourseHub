// lib/screens/clubs.dart

import 'package:course_hub/components/rounded_club.dart';
import 'package:course_hub/data/clubs_data.dart';
import 'package:flutter/material.dart';

class ClubsScreen extends StatelessWidget {
  static String id = 'clubs';
  const ClubsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("C L U B S"),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25.0), // Adjust the radius as needed
          ),
        ),
        backgroundColor: Theme.of(context)
            .colorScheme
            .surface, // Set your desired background color
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: clubs.map((club) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: RoundedClub(
                        title: club['name']!,
                        description: club['description']!,
                        image: club['image']!,
                        onpress: () {
                          Navigator.pushNamed(
                            context,
                            '/club',
                            arguments: club,
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
