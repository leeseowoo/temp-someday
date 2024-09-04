import 'package:flutter/material.dart';
import 'package:someday/common/components/default_layout.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      title: '공지사항',
      child: Center(
        child: Text('공지사항 페이지'),
      ),
    );
  }
}
