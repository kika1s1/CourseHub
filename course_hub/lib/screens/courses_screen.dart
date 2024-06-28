import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  final List<Map<String, String>> courses;

  const CoursesScreen({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("C O U R S E S"),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return ExpansionTile(
            title: Text(course['title']!),
            children: [
              
              ListTile(
                title: Text('Course ID: ${course['id']}'),
              ),
              ListTile(
                title: Text('Credit Hours: ${course['credithr']}'),
              ),
              ListTile(
                title: Text('Course Name: ${course['name']}'),
              ),
              ListTile(
                title: Text('Prerequisite: ${course['prerequist'] ?? 'None'}'),
              ),
              ListTile(
                title: Text('Description: ${course['description']}'),
              ),
            ],
          );
        },
      ),
    );
  }
}
