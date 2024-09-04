import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/common/components/big_button.dart';
import 'package:someday/common/components/default_layout.dart';
import 'package:someday/common/const/colors.dart';
import 'package:someday/core/router/go_router.dart';
import 'package:someday/login/presentation/view_model/group_code_input_view_model.dart';

class GroupCodeInputScreen extends ConsumerStatefulWidget {
  final String _nickname;

  const GroupCodeInputScreen({
    required String nickname,
    super.key,
  }) : _nickname = nickname;

  @override
  ConsumerState<GroupCodeInputScreen> createState() =>
      _GroupCreationScreenState();
}

class _GroupCreationScreenState extends ConsumerState<GroupCodeInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Someday',
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            const Text(
              '초대 코드를 입력해 주세요.',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: 390,
                    height: 80,
                    child: TextFormField(
                      controller: _controller,
                      focusNode: _focusNode,
                      decoration: const InputDecoration(
                        labelText: '초대 코드 입력',
                        labelStyle: TextStyle(
                          color: BODY_TEXT_COLOR,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: BODY_TEXT_COLOR,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BigButton(
                    label: '그룹에 참여하기 버튼',
                    buttonText: '참여하기',
                    backgroundColor: PRIMARY_COLOR,
                    callback: _joinGroup,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _joinGroup() async {
    bool joined = await ref.read(groupCodeInputViewModelProvider).joinGroup(
          groupCode: _controller.text,
          nickname: widget._nickname,
        );
    if (!context.mounted) return;
    if (joined) {
      router.go('/calenderHome');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('유효하지 않은 코드입니다. 다시 시도해 주세요.'),
        ),
      );
    }
  }
}
