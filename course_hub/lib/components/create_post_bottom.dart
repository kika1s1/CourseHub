// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Import flutter_secure_storage
// import 'package:provider/provider.dart';
// import 'package:course_hub/providers/post_provider.dart';

// class CreatePostButton extends StatefulWidget {
//   const CreatePostButton({super.key});

//   @override
//   _CreatePostButtonState createState() => _CreatePostButtonState();
// }

// class _CreatePostButtonState extends State<CreatePostButton> {
//   bool _isExpanded = false;
//   final TextEditingController _textEditingController = TextEditingController();
//   final FlutterSecureStorage _storage = const FlutterSecureStorage(); // Initialize FlutterSecureStorage instance

//   Future<void> _createPost() async {
//     final String content = _textEditingController.text.trim();
//     if (content.isEmpty) return;

//     // Retrieve token from secure storage
//     String? token = await _storage.read(key: 'token');

//     if (token == null) {
//       // Handle case where token is not available (e.g., user not authenticated)
//       print('User not authenticated');
//       return;
//     }

//     final postProvider = Provider.of<PostProvider>(context, listen: false);
//     await postProvider.addPost(content, token);
//     _textEditingController.clear();
//     setState(() {
//       _isExpanded = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               _isExpanded = !_isExpanded;
//             });
//           },
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeInOut,
//             width: double.infinity,
//             height: _isExpanded ? 100 : 50, // Adjust height as needed
//             decoration: BoxDecoration(
//               color: Theme.of(context).colorScheme.surface,
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(
//                 color: Theme.of(context).colorScheme.primary,
//                 width: 2,
//               ),
//             ),
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             child: _isExpanded
//                 ? TextField(
//                     controller: _textEditingController,
//                     onChanged: (value) {
//                       if (value.isEmpty) {
//                         setState(() {
//                           _isExpanded = false;
//                         });
//                       }
//                     },
//                     maxLines: null,
//                     decoration: const InputDecoration(
//                       hintText: 'What\'s on your mind?',
//                       border: InputBorder.none,
//                     ),
//                   )
//                 : Center(
//                     child: Text(
//                       'What is your question?',
//                       style: TextStyle(
//                           color: Theme.of(context).colorScheme.primary),
//                     ),
//                   ),
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             onPressed: _createPost,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Theme.of(context).colorScheme.secondary,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10), // Set border radius here
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16.0),
//               child: Text(
//                 "Post",
//                 style: TextStyle(color: Theme.of(context).colorScheme.primary),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
