import 'package:flutter/material.dart';
import 'package:someday/common/components/default_layout.dart';

class UsageScreen extends StatelessWidget {
  const UsageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      title: '사용 설명',
      child: Center(
        child: Text('사용 설명 페이지'),
      ),
    );
  }
}
