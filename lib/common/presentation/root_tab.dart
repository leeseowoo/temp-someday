import 'package:flutter/material.dart';
import 'package:someday/common/components/default_layout.dart';
import 'package:someday/common/const/colors.dart';
import 'package:someday/home/presentation/screen/calender_home_screen.dart';
import 'package:someday/my_page/presentation/screen/my_page_screen.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      _index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
          )
        ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
          child: BottomNavigationBar(
            selectedItemColor: PRIMARY_COLOR,
            unselectedItemColor: BODY_TEXT_COLOR,
            backgroundColor: Colors.white,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              controller.animateTo(index);
            },
            currentIndex: _index,
            items: [
              BottomNavigationBarItem(
                activeIcon: SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset('asset/icons/home_active.png'),
                ),
                icon: SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset('asset/icons/home.png'),
                ),
                label: '일정',
              ),
              BottomNavigationBarItem(
                activeIcon: SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset('asset/icons/list_active.png'),
                ),
                icon: SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset('asset/icons/list.png'),
                ),
                label: '모아보기',
              ),
              BottomNavigationBarItem(
                activeIcon: SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset('asset/icons/add_square_active.png'),
                ),
                icon: SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset('asset/icons/add_square.png'),
                ),
                label: '일정등록',
              ),
              BottomNavigationBarItem(
                activeIcon: SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset('asset/icons/user_active.png'),
                ),
                icon: SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset('asset/icons/user.png'),
                ),
                label: '마이페이지',
              ),
            ],
          ),
        ),
      ),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          CalenderHomeScreen(),
          Center(
            child: Text('모아보기'),
          ),
          Center(
            child: Text('일정등록'),
          ),
          MyPageScreen(),
        ],
      ),
    );
  }
}
