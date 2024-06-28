// grade_calculator_screen.dart

// ignore_for_file: library_private_types_in_public_api

import 'package:course_hub/models/course.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GradeCalculatorScreen extends StatefulWidget {
  const GradeCalculatorScreen({Key? key}) : super(key: key);

  @override
  _GradeCalculatorScreenState createState() => _GradeCalculatorScreenState();
}

class _GradeCalculatorScreenState extends State<GradeCalculatorScreen> {
  final List<String> grades = ['A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'F'];
  List<Course> courses = [];
  int selectedCourseCount = 3; // Default to 3 courses
  final TextEditingController courseCountController = TextEditingController(text: '3');

  // Predefined course names relevant to software engineering
  List<String> predefinedCourseNames = [
    'IntrO to Programming',
    'DSA',
    'Software Principles',
    'Database Systems',
    'Operating Systems',
    'Computer Networks',
    'Web Development',
    'Mobile Application',
  ];

  @override
  void initState() {
    super.initState();
    // Initialize the list of courses with default credits and grade 'A'
    courses = List.generate(
      selectedCourseCount,
      (index) => Course(
        name: predefinedCourseNames[0], // Initialize with the first course name
        grade: 'A',
        credits: 3.0,
      ),
    );
  }

  void calculateGPA() {
    double totalPoints = 0;
    double totalCredits = 0;

    // Calculate total points based on selected courses and their grades
    for (Course course in courses) {
      totalPoints += _gradeToGPA(course.grade) * course.credits;
      totalCredits += course.credits;
    }

    // Calculate GPA
    double gpa = totalPoints / totalCredits;

    // Show GPA as a toast message
    Fluttertoast.showToast(
      msg: 'Your GPA is: ${gpa.toStringAsFixed(2)}',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
    );
  }

  // Function to map grade to GPA value
  double _gradeToGPA(String grade) {
    switch (grade) {
      case 'A':
        return 4.0;
      case 'A-':
        return 3.7;
      case 'B+':
        return 3.3;
      case 'B':
        return 3.0;
      case 'B-':
        return 2.7;
      case 'C+':
        return 2.3;
      case 'C':
        return 2.0;
      case 'C-':
        return 1.7;
      case 'D+':
        return 1.3;
      case 'D':
        return 1.0;
      case 'F':
        return 0.0;
      default:
        return 0.0;
    }
  }

  void _updateCourseCount() {
    int count = int.tryParse(courseCountController.text) ?? 3;
    if (count < 1) {
      count = 1;
      courseCountController.text = '1';
    } else if (count > 10) {
      count = 10;
      courseCountController.text = '10';
    }
    setState(() {
      selectedCourseCount = count;
      courses = List.generate(
        selectedCourseCount,
        (index) => Course(
          name: predefinedCourseNames[index % predefinedCourseNames.length],
          grade: 'A',
          credits: 3.0,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade Calculator'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: courseCountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter number of courses',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _updateCourseCount(),
                  ),
                ),
                const SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: _updateCourseCount,
                  child: const Text('Update Courses'),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: selectedCourseCount,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: DropdownButtonFormField<String>(
                          value: courses[index].name,
                          onChanged: (value) {
                            setState(() {
                              courses[index].name = value!;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Select Course',
                            border: OutlineInputBorder(),
                          ),
                          items: predefinedCourseNames.map((courseName) {
                            return DropdownMenuItem<String>(
                              value: courseName,
                              child: Text(
                                courseName,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 10,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          initialValue: courses[index].credits.toString(),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Credits',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              courses[index].credits = double.tryParse(value) ?? 0.0;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: DropdownButtonFormField<String>(
                          value: courses[index].grade,
                          onChanged: (value) {
                            setState(() {
                              courses[index].grade = value!;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Grade',
                            border: OutlineInputBorder(),
                          ),
                          items: grades.map((grade) {
                            return DropdownMenuItem<String>(
                              value: grade,
                              child: Text(grade),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: calculateGPA,
              child: const Text('Calculate GPA'),
            ),
          ],
        ),
      ),
    );
  }
}
