import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/common/components/default_layout.dart';
import 'package:someday/core/router/go_router.dart';
import 'package:someday/login/presentation/view_model/login_view_model.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: 'Someday',
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Image.asset('asset/icons/calendar_temp.png'),
            const SizedBox(height: 60),
            const Divider(
              indent: 40,
              endIndent: 40,
            ),
            const SizedBox(height: 16),
            buildLoginButton(
              context,
              ref,
              'asset/icons/login_button_kakao.png',
              ref.read(loginViewModelProvider).loginWithKakao,
            ),
            const SizedBox(height: 10),
            buildLoginButton(
              context,
              ref,
              'asset/icons/login_button_google.png',
              ref.read(loginViewModelProvider).loginWithGoogle,
            ),
            if (Platform.isIOS) ...[
              const SizedBox(height: 10),
              buildLoginButton(
                context,
                ref,
                'asset/icons/login_button_apple.png',
                ref.read(loginViewModelProvider).loginWithApple,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

Widget buildLoginButton(BuildContext context, WidgetRef ref, String imagePath,
    Future<bool> Function() login) {
  return InkWell(
    radius: 100,
    borderRadius: BorderRadius.circular(10),
    onTap: () async {
      final bool isLoginSuccessful = await login();
      if (!context.mounted) return;
      if (isLoginSuccessful) {
        if (await ref.read(loginViewModelProvider).checkUserGroup()) {
          router.go('/calenderHome');
        } else {
          router.go('/groupEntry');
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('로그인에 실패했습니다.'),
          ),
        );
      }
    },
    child: Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.055,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
