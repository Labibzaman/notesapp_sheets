import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final text;
  final function;
  MyButton({super.key, this.text, this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
          ),
          onPressed: function,
          child: Text(text),
        ),
      ),
    );
  }
}
