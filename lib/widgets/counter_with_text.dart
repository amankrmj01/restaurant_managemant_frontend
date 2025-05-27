import 'package:flutter/material.dart';

class CounterWithText extends StatelessWidget {
  final int number;
  final String text;

  const CounterWithText({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Text(text, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
      ],
    );
  }
}
