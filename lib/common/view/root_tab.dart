import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/restaurant/view/restaurant_screen.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class RootTab extends StatefulWidget {
  const RootTab({Key? key}) : super(key: key);

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  // late? "나중에 우리가 이 값을 부를 건데 이미 선언이 되어있을거야."라고 가정해주는 키워드
  late TabController controller;
  // 바텀탭 인덱스
  int bottomTabIndex = 0;

  @override
  void initState() {
    super.initState();
    // vsync 컨트롤러를 설정하는 스테이트를 넣어줘야되고 특정기능을 갖고있어야한다.
    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(tabListener);
  }

  void tabListener() {
    setState(() {
      // 탭이 바뀔때마다 현재탭을 탭상태변수에 넣어준다.
      bottomTabIndex = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '보임',
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: BODY_TEXT_COLOR,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          controller.animateTo(index);
        },
        currentIndex: bottomTabIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_outlined), label: '진단'),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined), label: '청구'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: '설정'),
        ],
      ),
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          RestaurantScreen(),
          Center(
            child: Text('진단'),
          ),
          Center(
            child: Text('청구'),
          ),
          Center(
            child: Text('설정'),
          )
        ],
      ),
    );
  }
}
