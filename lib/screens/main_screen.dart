import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/screens/account_screen.dart';
import 'package:media_feed_app/screens/home_screen.dart';
import 'package:media_feed_app/screens/news_screen.dart';
import 'package:media_feed_app/styles/colors.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainScreen> {
  // ナビゲーションの画面
  final List<Widget> _screens = [
    const NewsScreen(),
    const HomeScreen(),
    const AccountScreen(),
  ];

  // ナビゲーションバーのアイテム
  final _navbarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.info_outline),
      activeIcon: Icon(Icons.info),
      label: 'お知らせ',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'ホーム',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_outlined),
      activeIcon: Icon(Icons.account_circle),
      label: 'アカウント',
    ),
  ];

  int _selectedIndex = 1; // HomeScreenを初期表示

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
      body: _screens[_selectedIndex],
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
