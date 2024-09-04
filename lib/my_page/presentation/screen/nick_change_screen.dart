import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/common/components/big_button.dart';
import 'package:someday/common/components/default_layout.dart';
import 'package:someday/common/components/text_input.dart';
import 'package:someday/common/const/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:someday/my_page/presentation/view_model/user_state_notifier.dart';

class NickChangeScreen extends ConsumerStatefulWidget {
  final String _userId;

  const NickChangeScreen({super.key, required String userId})
      : _userId = userId;

  @override
  ConsumerState<NickChangeScreen> createState() => _NickChangeScreenState();
}

class _NickChangeScreenState extends ConsumerState<NickChangeScreen> {
  String _newNickName = '';

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return DefaultLayout(
      title: '닉네임 변경',
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextInput(
                labelText: '닉네임 입력',
                hintText: '닉네임을 입력하세요',
                isAutofocus: true,
                onChanged: (value) {
                  setState(() {
                    _newNickName = value;
                  });
                },
              ),
            ),
            const Spacer(),
            BigButton(
              label: '닉네임 변경 실행 버튼',
              callback: _newNickName.isEmpty
                  ? null
                  : () async {
                      await ref
                          .read(userStateProvider.notifier)
                          .updateUserNickname(
                              userId: widget._userId,
                              newNickname: _newNickName);
                      if (mounted) {
                        context.pop();
                      }
                    },
              isKeyboardUp: bottomInset > 0 ? true : false,
              buttonText: '변경하기',
              backgroundColor: PRIMARY_COLOR,
            )
          ],
        ),
      ),
    );
  }
}
