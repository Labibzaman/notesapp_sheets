import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  final String text;
  MyBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.yellow[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
