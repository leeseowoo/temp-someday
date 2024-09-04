import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/common/components/big_button.dart';
import 'package:someday/common/components/default_layout.dart';
import 'package:someday/common/const/colors.dart';
import 'package:someday/core/router/go_router.dart';

enum ButtonType {
  createGroup,
  joinGroup,
}

class GroupEntryScreen extends ConsumerWidget {
  const GroupEntryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: 'Someday',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '일정 공유를 위한 그룹을\n만들어 보세요.',
              style: TextStyle(fontSize: 26),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            BigButton(
              callback: () {
                router.push(
                  '/nicknameInput',
                  extra: ButtonType.createGroup,
                );
              },
              label: '그룹생성 페이지 이동 버튼',
              buttonText: '우리만의 그룹 만들기',
              backgroundColor: PRIMARY_COLOR,
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                ),
                Text(
                  '또는',
                  style: TextStyle(fontSize: 16),
                ),
                Expanded(
                  child: Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              '초대 코드를 입력하면\n그룹에 참여할 수 있어요.',
              style: TextStyle(fontSize: 26),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            BigButton(
              callback: () {
                router.push(
                  '/nicknameInput',
                  extra: ButtonType.joinGroup,
                );
              },
              label: '초대 코드 입력 완료 버튼',
              buttonText: '초대 코드 입력하기',
              backgroundColor: PRIMARY_COLOR,
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
