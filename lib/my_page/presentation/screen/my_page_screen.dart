import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:someday/common/components/default_layout.dart';
import 'package:someday/common/presentation/error_screen.dart';
import 'package:someday/common/style/text_style.dart';
import 'package:someday/my_page/presentation/components/user_info_card.dart';
import 'package:go_router/go_router.dart';
import 'package:someday/my_page/presentation/view_model/user_state_notifier.dart';

class MyPageScreen extends ConsumerStatefulWidget {
  const MyPageScreen({super.key});

  @override
  ConsumerState<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends ConsumerState<MyPageScreen> {
  String? _userId;

  @override
  void initState() {
    super.initState();
    _userId = FirebaseAuth.instance.currentUser?.uid;
    getUserInfo();
  }

  void getUserInfo() {
    if (_userId != null) {
      ref.read(userStateProvider.notifier).getUserInfo(userId: _userId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userStateProvider);
    ref.listen(
      userStateProvider,
      (previous, next) {
        if (!next.isSuccessUpdateNickname) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('닉네임 변경에 실패 하였습니다. 잠시후 다시 시도 해주세요.'),
            ),
          );
        }
      },
    );

    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state.isFetchFailed) {
      return const ErrorScreen(
          errorMsg: '유저의 정보를 가져 오는데 실패 하였습니다. \n 잠시후 다시 시도 해주세요.');
    } else {
      return DefaultLayout(
        title: '마이페이지',
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                UserInfoCard(
                  name: state.nickname,
                  loginInfo: state.providerId,
                  onTap: () {
                    context.push('/nickNameChange', extra: _userId);
                  },
                ),
                const SizedBox(height: 32.0),
                _renderListItem(
                  onTap: () {
                    context.push(
                      '/group_info',
                      extra: {
                        'isLeader': state.isLeader,
                        'groupId': state.groupId
                      },
                    );
                  },
                  title: state.isLeader ? '그룹 관리' : '그룹 정보',
                ),
                _renderListItem(
                  onTap: () {
                    context.push('/usage');
                  },
                  title: '사용설명',
                ),
                _renderListItem(
                  onTap: () {
                    context.push('/notice');
                  },
                  title: '공지사항',
                ),
                _renderListItem(
                  onTap: () {
                    context.push('/faq');
                  },
                  title: 'FAQ',
                ),
                _renderListItem(
                    onTap: () {
                      AppSettings.openAppSettings(
                          type: Platform.isIOS
                              ? AppSettingsType.settings
                              : AppSettingsType.notification);
                    },
                    title: '푸쉬알림 설정'),
                _renderListItem(onTap: () {}, title: '회원탈퇴'),
                _renderListItem(
                    onTap: () async {
                      await ref
                          .read(userStateProvider.notifier)
                          .leaveGroup(userId: _userId!);
                      //TODO: 그룹 탈퇴이후 그룹 생성 & 가입 페이지로 이동
                    },
                    title: '그룹 나가기'),
                _renderListItem(
                  onTap: () async {
                    await _signOut();
                    if (mounted) {
                      context.go('/');
                    }
                  },
                  title: '로그아웃',
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  Semantics _renderListItem(
      {required VoidCallback onTap, required String title}) {
    return Semantics(
      button: true,
      label: '$title 이동(실행) 하기',
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: SUB_TITLE.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
