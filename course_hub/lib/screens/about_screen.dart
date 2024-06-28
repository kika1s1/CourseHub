import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Course Hub'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Course Hub',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Your Centralized Hub for ASTU Course Management',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const Text(
                'Key Features',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              _buildFeatureItem(Icons.person, 'User Registration: Create an account with personal details.'),
              _buildFeatureItem(Icons.login, 'User Login: Securely log in with your credentials.'),
              _buildFeatureItem(Icons.account_circle, 'User Profile: Edit and update your profile information.'),
              _buildFeatureItem(Icons.forum, 'Course Discussion Forum: Engage in course-related discussions.'),
              _buildFeatureItem(Icons.question_answer, 'Question Posting: Post and answer course-related questions.'),
              _buildFeatureItem(Icons.comment, 'Commenting and Replies: Participate in discussions through comments.'),
              _buildFeatureItem(Icons.thumb_up, 'Upvoting and Downvoting: Prioritize relevant content.'),
              _buildFeatureItem(Icons.notifications, 'Notifications: Stay updated with discussion activities.'),
              _buildFeatureItem(Icons.person_pin, 'Course Instructor Participation: Instructors can join discussions.'),
              _buildFeatureItem(Icons.report, 'Moderation and Report System: Maintain a respectful environment.'),
              _buildFeatureItem(Icons.book, 'Course Information: Detailed course descriptions and prerequisites.'),
              _buildFeatureItem(Icons.calculate, 'Grade Calculator: Calculate GPA and CGPA.'),
              _buildFeatureItem(Icons.contact_phone, 'Contact Details: Important contacts for faculty and staff.'),
              _buildFeatureItem(Icons.map, 'Block Numbers: Locate facilities on campus with an interactive map.'),
              const SizedBox(height: 20),
              const Divider(),
              const Text(
                'Technology Stack',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Front-end Development with Flutter',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '- Cross-Platform Compatibility: Single codebase for Android and iOS.\n'
                '- Fast Development Process: Hot reload for instant UI changes.\n'
                '- Rich UI Framework: Visually appealing interfaces.\n'
                '- Native Performance: High performance and responsiveness.\n'
                '- Extensive Widget Library: Wide range of UI elements and animations.\n'
                '- Reactive Programming Model: Data-driven UIs.\n'
                '- Strong Community Support: Extensive documentation and forums.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Backend Development with Node.js',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '- JavaScript Everywhere: Seamless front-end and backend development.\n'
                '- Asynchronous I/O: Efficient handling of concurrent operations.\n'
                '- Scalability and Performance: Excellent scalability and performance.\n'
                '- NPM Ecosystem: Easy integration of various functionalities.\n'
                '- Express.js Framework: Robust and modular backend APIs.\n'
                '- Community Support: Extensive documentation and resources.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Divider(),
              Center(
                child: Text(
                  'Developed by ASTU Students for ASTU Students',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
