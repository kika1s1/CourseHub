// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:course_hub/providers/post_provider.dart';

class CreatePostButton extends StatefulWidget {
  const CreatePostButton({super.key});

  @override
  _CreatePostButtonState createState() => _CreatePostButtonState();
}

class _CreatePostButtonState extends State<CreatePostButton> {
  bool _isExpanded = false;
  final TextEditingController _textEditingController = TextEditingController();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> _createPost() async {
    final String content = _textEditingController.text.trim();
    if (content.isEmpty) return;

    String? token = await _storage.read(key: 'token');

    if (token == null) {
      print('User not authenticated');
      return;
    }
    final postProvider = Provider.of<PostProvider>(context, listen: false);
    // print("calling add post");
    await postProvider.addPost(content, token);
    // await postProvider.fetchPosts();
    // print("post added clearning");
    _textEditingController.clear();

    setState(() {
      _isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: _isExpanded ? 100 : 50,
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
                      controller: _textEditingController,
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
                        'What\'s on your mind?',
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                        ),
                      ),
                    ),
            ),
          ),
        ),
        const SizedBox(width: 10), // Spacer between input and button
        IconButton(
          onPressed: _createPost,
          icon: const Icon(Icons.send, color: Colors.blue), // Icon for posting
          iconSize: 30,
          tooltip: 'Post',
        ),
      ],
    );
  }
}
