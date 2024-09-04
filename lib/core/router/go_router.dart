import 'package:go_router/go_router.dart';
import 'package:someday/common/presentation/root_tab.dart';
import 'package:someday/common/presentation/splash_screen.dart';
import 'package:someday/home/presentation/screen/calender_home_screen.dart';
import 'package:someday/login/presentation/screen/group_code_input_screen.dart';
import 'package:someday/login/presentation/screen/group_creation_screen.dart';
import 'package:someday/login/presentation/screen/group_entry_screen.dart';
import 'package:someday/login/presentation/screen/login_screen.dart';
import 'package:someday/login/presentation/screen/nickname_input_screen.dart';
import 'package:someday/my_page/presentation/screen/faq_screen.dart';
import 'package:someday/my_page/presentation/screen/group_info_screen.dart';
import 'package:someday/my_page/presentation/screen/nick_change_screen.dart';
import 'package:someday/my_page/presentation/screen/notice_screen.dart';
import 'package:someday/my_page/presentation/screen/usage_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/rootTab',
      builder: (context, state) {
        return const RootTab();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/nickNameChange',
      builder: (context, state) {
        final String userId = state.extra as String;
        return NickChangeScreen(userId: userId);
      },
    ),
    GoRoute(
      path: '/usage',
      builder: (context, state) {
        return const UsageScreen();
      },
    ),
    GoRoute(
      path: '/notice',
      builder: (context, state) {
        return const NoticeScreen();
      },
    ),
    GoRoute(
      path: '/faq',
      builder: (context, state) {
        return const FaqScreen();
      },
    ),
    GoRoute(
      path: '/group_info',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return GroupInfoScreen(isLeader: data['isLeader'], groupId: data['groupId']);
      },
    ),

    GoRoute(
      path: '/groupEntry',
      builder: (context, state) {
        return const GroupEntryScreen();
      },
    ),
    GoRoute(
      path: '/calenderHome',
      builder: (context, state) {
        return const CalenderHomeScreen();
      },
    ),
    GoRoute(
      path: '/nicknameInput',
      builder: (context, state) {
        final ButtonType buttonType = state.extra as ButtonType;
        return NicknameInputScreen(buttonType: buttonType);
      },
    ),
    GoRoute(
      path: '/groupCodeInput',
      builder: (context, state) {
        final String nickname = state.extra as String;
        return GroupCodeInputScreen(nickname: nickname);
      },
    ),
    GoRoute(
      path: '/groupCreation',
      builder: (context, state) {
        final String nickname = state.extra as String;
        return GroupCreationScreen(nickname: nickname);
      },
    ),
  ],
);
