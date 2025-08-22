import 'package:flutter/material.dart';

class MyButtonRow extends StatelessWidget {
  const MyButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Text(''),
        ),
        Expanded(
          child: Text(''),
        ),
        Expanded(
          child: Text(''),
        ),
      ],
    );
  }
}
