import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Labels extends StatelessWidget {
  final String text1;
  final String text2;
  final String routes;

  const Labels(
      {super.key,
      required this.routes,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            text1,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, routes),
          child: Text(
            text2,
            style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
