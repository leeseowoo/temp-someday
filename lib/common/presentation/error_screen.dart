import 'package:flutter/material.dart';
import 'package:someday/common/style/text_style.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMsg;
  const ErrorScreen({super.key, required this.errorMsg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          errorMsg,
          style: SUB_TITLE,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
