import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/styles/utils.dart';

class MyPageLinkList extends ConsumerWidget {
  const MyPageLinkList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _listTile(
          leadingIcon: Icons.person_outline,
          titleText: 'アカウント設定',
          onTap: () {
            Navigator.pushNamed(context, '/my_page/setting');
          },
        ),
        _listTile(
          leadingIcon: Icons.verified_outlined,
          titleText: 'ポイント詳細',
          onTap: () {
            Navigator.pushNamed(context, '/my_page/point');
          },
        ),
        _listTile(
          leadingIcon: Icons.play_lesson_outlined,
          titleText: '再生履歴',
          onTap: () {
            Navigator.pushNamed(context, '/my_page/play-history');
          },
        ),
        _listTile(
          leadingIcon: Icons.notifications_outlined,
          titleText: 'お知らせ',
          onTap: () {
            Navigator.pushNamed(context, '/my_page/news');
          },
        ),
        _listTile(
          leadingIcon: Icons.question_answer_outlined,
          titleText: 'よくある質問',
          onTap: () {
            // Navigator.pushNamed(context, '/fixme');
          },
        ),
        _listTile(
          leadingIcon: Icons.contact_page_outlined,
          titleText: 'お問い合わせ',
          onTap: () {
            // Navigator.pushNamed(context, '/fixme');
          },
        ),
        _listTile(
          leadingIcon: Icons.note_outlined,
          titleText: '利用規約',
          onTap: () {
            // Navigator.pushNamed(context, '/fixme');
          },
        ),
        _listTile(
          leadingIcon: Icons.note_outlined,
          titleText: 'プライバシーポリシー',
          onTap: () {
            // Navigator.pushNamed(context, '/fixme');
          },
        ),
      ],
    );
  }

  Widget _listTile({
    required String titleText,
    required IconData leadingIcon,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 10),
      decoration: UtilStyles.decorationGlass,
      child: ListTile(
        textColor: AppColors.white,
        iconColor: AppColors.white,
        title: Text(
          titleText,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        onTap: onTap,
        leading: Icon(leadingIcon),
        minLeadingWidth: 0,
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
      ),
    );
  }
}
