import 'package:flutter/material.dart';


class BasicBlueButton extends StatefulWidget {
  final Function()? onPressed;
  const BasicBlueButton({super.key, this.onPressed});

  @override
  State<BasicBlueButton> createState() => _BasicBlueButtonState();
}

class _BasicBlueButtonState extends State<BasicBlueButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, // Background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25), // Border radius
        ),
      ),
      child: Text('Elevated Button'),
    );
  }
}