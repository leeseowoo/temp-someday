import 'package:flutter/material.dart';
import 'package:someday/common/const/colors.dart';
import 'package:someday/common/style/text_style.dart';

class UserInfoCard extends StatefulWidget {
  final String name;
  final String loginInfo;
  final VoidCallback onTap;

  const UserInfoCard({
    super.key,
    required this.name,
    required this.loginInfo,
    required this.onTap,
  });

  @override
  State<UserInfoCard> createState() => _UserInfoCardState();
}

class _UserInfoCardState extends State<UserInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Container(
          width: 120,
          height: 120,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: PRIMARY_COLOR, borderRadius: BorderRadius.circular(100)),
          child: SizedBox(
            width: 70,
            height: 70,
            child: Image.asset('asset/icons/calendar_temp.png'),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 48,
            ),
            Text(
              '닉네임 : ${widget.name}',
              style: PARAGRAPH_TEXT.copyWith(fontSize: 18),
            ),
            Transform.translate(
              offset: const Offset(-5, 0),
              child: IconButton(
                onPressed: widget.onTap,
                icon: Image.asset(
                  'asset/icons/edit.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          '로그인 정보 : ${widget.loginInfo}',
          style: PARAGRAPH_TEXT.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
