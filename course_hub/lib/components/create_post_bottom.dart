// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CreatePostButton extends StatefulWidget {
  const CreatePostButton({super.key});

  @override
  _CreatePostButtonState createState() => _CreatePostButtonState();
}

class _CreatePostButtonState extends State<CreatePostButton> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: double.infinity,
            height: _isExpanded ? 100 : 50, // Adjust height as needed
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: _isExpanded
                ? TextField(
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          _isExpanded = false;
                        });
                      }
                    },
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: 'What\'s on your mind?',
                      border: InputBorder.none,
                    ),
                  )
                : Center(
                    child: Text(
                      'What is your question? ',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 15,),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isExpanded = false;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // Set border radius here
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0), // Adjust padding as needed
              child: Text(
                "Post",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
        )
      ],
    );
  }
}
