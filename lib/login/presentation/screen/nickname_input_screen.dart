import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/common/components/big_button.dart';
import 'package:someday/common/components/default_layout.dart';
import 'package:someday/common/const/colors.dart';
import 'package:someday/core/router/go_router.dart';
import 'package:someday/login/presentation/screen/group_entry_screen.dart';

class NicknameInputScreen extends ConsumerStatefulWidget {
  final ButtonType _buttonType;

  const NicknameInputScreen({
    required ButtonType buttonType,
    super.key,
  }) : _buttonType = buttonType;

  @override
  ConsumerState<NicknameInputScreen> createState() =>
      _NicknameInputScreenState();
}

class _NicknameInputScreenState extends ConsumerState<NicknameInputScreen> {
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
              '그룹에서 사용할 닉네임을\n입력해 주세요.',
              style: TextStyle(
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
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
                      maxLength: 11,
                      decoration: const InputDecoration(
                        labelText: '닉네임 입력',
                        labelStyle: TextStyle(
                          color: BODY_TEXT_COLOR,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: BODY_TEXT_COLOR,
                          ),
                        ),
                      ),
                      validator: validateNickname,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BigButton(
                    label: '다음 페이지 이동 버튼',
                    buttonText: '다음',
                    backgroundColor: PRIMARY_COLOR,
                    callback: _submitNickname,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitNickname() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              '닉네임 확인',
            ),
            content: Text(
              '\'${_controller.text}\' 닉네임을 사용하시겠어요?',
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  '취소',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text(
                  '확인',
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        '이전 화면으로 돌아가면 닉네임을 변경할 수 있어요.',
                      ),
                    ),
                  );
                  if (widget._buttonType == ButtonType.createGroup) {
                    router.push(
                      '/groupCreation',
                      extra: _controller.text,
                    );
                  } else if (widget._buttonType == ButtonType.joinGroup) {
                    router.push(
                      '/groupCodeInput',
                      extra: _controller.text,
                    );
                  }
                },
              ),
            ],
          );
        },
      );
    }
  }

  String? validateNickname(String? value) {
    if (value == null || value.isEmpty) {
      return '닉네임을 입력해 주세요.';
    } else if (value.length > 11) {
      return '닉네임은 11자를 초과할 수 없습니다.';
    }
    return null;
  }
}
