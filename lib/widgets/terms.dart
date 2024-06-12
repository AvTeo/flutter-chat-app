import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: const Text(
        'Terms and conditions of use',
        style: TextStyle(
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }
}
