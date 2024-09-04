import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final VoidCallback? callback;
  final String buttonText;
  final Color backgroundColor;
  final bool? isKeyboardUp;
  final String label;

  const BigButton({
    super.key,
    this.callback,
    required this.buttonText,
    required this.backgroundColor,
    this.isKeyboardUp = false,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isKeyboardUp! ? 0 : 16),
      child: Semantics(
        label: label,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(isKeyboardUp! ? 0 : 16.0),
            ),
            minimumSize: const Size.fromHeight(55),
          ),
          onPressed: callback,
          child: Text(
            buttonText,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
