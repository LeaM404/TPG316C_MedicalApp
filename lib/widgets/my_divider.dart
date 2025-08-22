import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  final String dividerText;

  const MyDivider({
    super.key,
    required this.dividerText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              dividerText,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          const Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
