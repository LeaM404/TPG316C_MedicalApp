import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  final String title;
  final String image;
  final String description;

  const OnboardingItem({
    required this.title,
    required this.image,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 500,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 50),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
