
import 'package:flutter/material.dart';

class ContentColumn extends StatelessWidget {
  final String title;
  final String description;

  const ContentColumn({
    super.key,
    required this.description,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Text(title),
          Text(description)
        ],
      ),
    );
  }
}