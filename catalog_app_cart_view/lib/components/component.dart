import 'package:flutter/material.dart';

class Continue extends StatelessWidget {
  const Continue({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Continue",
        style: TextStyle(
            fontSize: 18, color: Colors.amberAccent, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Next extends StatelessWidget {
  const Next({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Next",
        style: TextStyle(
            fontSize: 18, color: Colors.amberAccent, fontWeight: FontWeight.bold),
      ),
    );
  }
}
