import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Function()? onTap;
  final String imagePath;
  final String textTitle;

  const AuthButton({
    super.key,
    required this.onTap,
    required this.textTitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(244, 228, 230, 231),
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 20,
            ),
            const SizedBox(width: 5),
            Text(
              textTitle,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 102, 101, 101)),
            ),
          ],
        ),
      ),
    );
  }
}
