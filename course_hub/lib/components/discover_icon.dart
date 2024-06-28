import 'package:flutter/material.dart';

class DiscoverIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const DiscoverIcon({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style:  TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
