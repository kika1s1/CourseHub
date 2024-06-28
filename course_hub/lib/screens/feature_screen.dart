import 'package:flutter/material.dart';

class FeatureScreen extends StatelessWidget {
  final String image;
  final String about;
  final String description;

  const FeatureScreen({
    super.key,
    required this.image,
    required this.about,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width, // Set width to full width of screen
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(20),
            height: 400,
            width: double.infinity, // Make image take full width
          ),
          Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  about,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Text(
                  description,
                  style: const TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
