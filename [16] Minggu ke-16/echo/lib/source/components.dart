import 'package:flutter/material.dart';

// Primary Button
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
        height: 48,
        child: ElevatedButton(
          style: _buttonStyle(),
          onPressed: onPressed ?? () {},
          child: Text(
            text,
            style: _textStyle(),
          ),
        ),
      ),
    );
  }

  // Button Style
  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Set border radius
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 0,
      ), // Set padding
    );
  }

  // Text Style
  TextStyle _textStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const SecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
        height: 48,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Set border radius
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 0,
            ), // Set padding
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 16, // Set font size
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
