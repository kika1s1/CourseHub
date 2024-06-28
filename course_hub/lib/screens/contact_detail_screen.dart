// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailScreen extends StatelessWidget {
  static String id = 'phone';
  const ContactDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            AppBar(
              title: Text("Phone"),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  PhoneTile(
                    name: "Ambulance Service",
                    no: "+251940046254",
                  ),
                  Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  PhoneTile(
                    name: "Student Police",
                    no: "+251911223344",
                  ),
                  Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  PhoneTile(
                    name: "Department Head",
                    no: "+251933445566",
                  ),
                  Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  PhoneTile(
                    name: "Dean Secretary",
                    no: "+251933445566",
                  ),
                  Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  PhoneTile(
                    name: "Dormitory",
                    no: "+251933445566",
                  ),
                  Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  PhoneTile(
                    name: "Dean, SoEEC",
                    no: "+25193038966",
                  ),
                  Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  PhoneTile(
                    name: "CSE Head",
                    no: "+25195405566",
                  ),
                  Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  PhoneTile(
                    name: "SOCAE",
                    no: "+25194329026",
                  ),
                  Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  PhoneTile(
                    name: "Associate Dean for Student",
                    no: "+25195445566",
                  ),
                  Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  PhoneTile(
                    name: "Associate Dean for Academic Affairs",
                    no: "+25193738566",
                  ),
                  Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhoneTile extends StatelessWidget {
  final String name;
  final String no;

  const PhoneTile({super.key, required this.name, required this.no});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: ElevatedButton(
        onPressed: () async {
          final url = 'tel:$no';
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Text(no),
      ),
    );
  }
}
