import 'package:flutter/material.dart';

class RulesAndRegulationsScreen extends StatelessWidget {
  static String id = 'rule';

  const RulesAndRegulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Policies & Procedures'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            RoundedContainer(
              title: "Policies & Procedures",
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 16),
            const PolicyItem(
              title: "Drug and Alcohol Use Policy",
              content:
                  "Use, possession, or distribution of illegal drugs on campus is strictly prohibited. Underage drinking is not allowed, and alcohol consumption for those of legal age is restricted to designated areas. Misuse or sharing of prescription drugs is banned. Public intoxication is forbidden. Any student caught violating these rules will face immediate expulsion from campus.",
            ),
            const PolicyItem(
              title: "Campus Access Policy",
              content:
                  "Unauthorized entry into campus buildings is prohibited. Students must carry ID cards at all times. Access to certain areas is restricted to authorized personnel only. Guests must register and be escorted by a host. Tampering with security systems is forbidden. Violations will result in disciplinary action, including possible expulsion.",
            ),
            const PolicyItem(
              title: "Violence and Harassment Policy",
              content:
                  "Any form of violence, including physical altercations, threats, and intimidation, is strictly prohibited. Harassment, including sexual harassment, bullying, and discrimination, is not tolerated. Verbal, physical, or online harassment is forbidden. Reporting mechanisms are in place for victims. Violations will result in severe disciplinary action, including possible expulsion.",
            ),
            const PolicyItem(
              title: "Theft and Property Damage Policy",
              content:
                  "Stealing, unauthorized possession, or damage to property is strictly prohibited. This includes theft of personal belongings, vandalism, and tampering with equipment. Students are responsible for maintaining the condition of campus property. Those found violating this policy will face disciplinary action, including possible expulsion.",
            ),
            const PolicyItem(
              title: "Time Availability Policy",
              content:
                  "Students must be present and available on campus before 9:00 PM each night. Failure to comply may result in disciplinary action. Exceptions require prior approval from relevant campus authorities.",
            ),
            const PolicyItem(
              title: "Grading Policy",
              content:
                  "Grade appeals are a formal process that allows students to contest a grade they believe was unfairly assigned. The process typically involves submitting a written appeal to the instructor, department chair, or academic dean, and providing evidence or arguments for why the grade should be reconsidered.",
            ),
            const PolicyItem(
              title: "Incomplete Grades",
              content:
                  "An incomplete grade F may be assigned when a student is unable to complete coursework by the end of the term due to extenuating circumstances such as illness or family emergency. The student is given additional time, typically up to one semester, to complete the required work.",
            ),
            const PolicyItem(
              title: "GPA Calculation",
              content:
                  "Grade Point Average (GPA) is calculated by dividing the total grade points earned by the total credit hours attempted. It provides a numerical representation of a student's academic performance over a term or their entire academic career.",
            ),
            const PolicyItem(
              title: "Add/Drop Period",
              content:
                  "The add/drop period is a designated timeframe at the beginning of each term during which students can add new courses or drop existing ones without any academic penalty or financial cost. This period usually lasts one to two weeks.",
            ),
            const PolicyItem(
              title: "Cheating",
              content:
                  "Cheating involves using unauthorized materials, information, or aids in any academic exercise. This can include copying from another student, using unauthorized notes during an exam, or receiving illicit assistance on assignments.",
            ),
            const PolicyItem(
              title: "Late Add/Drop",
              content:
                  "Adding or dropping courses after the official add/drop period typically requires special approval from academic advisors or the department. Late changes may incur additional fees and are often granted only under extenuating circumstances.",
            ),
            const PolicyItem(
              title: "Event Planning and Approval",
              content:
                  "Policies for planning and approving events on campus ensure that activities are safe, inclusive, and align with the institution's values. This process typically involves submitting an event proposal, securing necessary permits, and coordinating with campus services.",
            ),
            const PolicyItem(
              title: "Campus Safety and Security",
              content:
                  "Campus safety and security policies are designed to protect the well-being of students, staff, and visitors. This includes emergency response procedures, crime reporting, building access controls, and safety education programs.",
            ),
            const PolicyItem(
              title: "Student Conduct and Discipline",
              content:
                  "Student conduct and discipline policies outline the behavioral expectations for students and the consequences for violations. This includes a code of conduct, disciplinary procedures, and potential sanctions for misconduct.",
            ),
            const PolicyItem(
              title: "Non-Discrimination and Harassment",
              content:
                  "Non-discrimination and harassment policies ensure a safe and inclusive environment by prohibiting discrimination and harassment based on race, gender, sexual orientation, religion, and other protected characteristics.",
            ),
            const PolicyItem(
              title: "Freedom of Expression and Assembly",
              content:
                  "Policies regarding freedom of expression and assembly protect students' rights to free speech and peaceful assembly while ensuring that such activities do not disrupt campus operations or infringe on the rights of others.",
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedContainer extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const RoundedContainer({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class PolicyItem extends StatelessWidget {
  final String title;
  final String content;

  const PolicyItem({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              content,
              maxLines: 3, // Adjust the number of lines before ellipsis as needed
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
