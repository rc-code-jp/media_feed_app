import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/app_router.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/styles/utils.dart';

@RoutePage()
class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsRouter(
      routes: const [
        ChangeRoute(),
        FeedRoute(),
        MyPageRoute(),
      ],
      builder: (BuildContext context, child) {
        final tabsRouter = context.tabsRouter;
        return Scaffold(
          body: Container(
            decoration: UtilStyles.decorationGradient,
            width: double.infinity,
            height: double.infinity,
            child: child,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.black,
            selectedItemColor: AppColors.white,
            unselectedItemColor: AppColors.grey,
            iconSize: 20,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.info_outline),
                activeIcon: Icon(Icons.info),
                label: '交換',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_outline),
                activeIcon: Icon(Icons.play_circle),
                label: 'フィード',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                activeIcon: Icon(Icons.account_circle),
                label: 'マイページ',
              ),
            ],
            onTap: tabsRouter.setActiveIndex,
          ),
        );
      },
    );
  }
}
