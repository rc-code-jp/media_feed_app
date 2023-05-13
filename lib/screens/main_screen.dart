import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/screens/change_screen.dart';
import 'package:media_feed_app/screens/feed_screen.dart';
import 'package:media_feed_app/screens/my_page_screen.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/styles/utils.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainScreen> {
  // ナビゲーションの画面
  final List<Widget> _screens = [
    const ChangeScreen(),
    const FeedScreen(),
    const MyPageScreen(),
  ];

  // ナビゲーションバーのアイテム
  final _navbarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.info_outline),
      activeIcon: Icon(Icons.info),
      label: '交換',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.play_circle_outline),
      activeIcon: Icon(Icons.play_circle),
      label: 'フィード',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_outlined),
      activeIcon: Icon(Icons.account_circle),
      label: 'マイページ',
    ),
  ];

  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

// ナビ移動
  void _onTapNavigation(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: UtilStyles.decorationGradient,
        height: double.infinity,
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTapNavigation,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.black,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.grey,
        iconSize: 18,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: _navbarItems,
      ),
    );
  }
}
