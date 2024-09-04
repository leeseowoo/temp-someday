import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/common/components/big_button.dart';
import 'package:someday/common/components/default_layout.dart';
import 'package:someday/common/const/colors.dart';
import 'package:someday/core/router/go_router.dart';
import 'package:someday/login/presentation/view_model/group_creation_view_model.dart';

class GroupCreationScreen extends ConsumerStatefulWidget {
  final String _nickname;

  const GroupCreationScreen({
    required String nickname,
    super.key,
  }) : _nickname = nickname;

  @override
  ConsumerState<GroupCreationScreen> createState() =>
      _GroupCreationScreenState();
}

class _GroupCreationScreenState extends ConsumerState<GroupCreationScreen> {
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
              '그룹 이름을 지어주세요.',
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
                      maxLength: 11,
                      decoration: const InputDecoration(
                        labelText: '그룹 이름 입력',
                        labelStyle: TextStyle(
                          color: BODY_TEXT_COLOR,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: BODY_TEXT_COLOR,
                          ),
                        ),
                      ),
                      validator: validateGroupName,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BigButton(
                    label: '그룹 생성 버튼.',
                    buttonText: '그룹 만들기',
                    backgroundColor: PRIMARY_COLOR,
                    callback: _submitGroupName,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitGroupName() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              '그룹 이름 확인',
            ),
            content: Text(
              '\'${_controller.text}\' 그룹에 \'${widget._nickname}\' 이름으로 참여할까요?',
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
                onPressed: () async {
                  final bool isCreated = await ref
                      .read(groupCreationViewModelProvider)
                      .createGroup(
                        _controller.text,
                        widget._nickname,
                      );
                  if (!context.mounted) return;
                  if (isCreated) {
                    router.go('/calenderHome');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('그룹 생성에 실패했습니다.'),
                      ),
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

  String? validateGroupName(String? value) {
    if (value == null || value.isEmpty) {
      return '그룹 이름을 입력해 주세요.';
    } else if (value.length > 11) {
      return '그룹 이름은 11자를 초과할 수 없습니다.';
    }
    return null;
  }
}
