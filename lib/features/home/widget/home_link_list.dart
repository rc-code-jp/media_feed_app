import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/styles/utils.dart';

class HomeLinkList extends ConsumerWidget {
  const HomeLinkList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsetsDirectional.zero,
        children: [
          _listTile(
            titleText: 'アカウント設定',
            onTap: () {
              // Navigator.pushNamed(context, '/fixme');
            },
          ),
          _listTile(
            titleText: 'ポイント詳細',
            onTap: () {
              Navigator.pushNamed(context, '/point');
            },
          ),
          _listTile(
            titleText: '再生履歴',
            onTap: () {
              Navigator.pushNamed(context, '/play-history');
            },
          ),
          _listTile(
            titleText: 'お知らせ',
            onTap: () {
              Navigator.pushNamed(context, '/news');
            },
          ),
          _listTile(
            titleText: 'よくある質問',
            onTap: () {
              // Navigator.pushNamed(context, '/fixme');
            },
          ),
          _listTile(
            titleText: 'お問い合わせ',
            onTap: () {
              // Navigator.pushNamed(context, '/fixme');
            },
          ),
        ],
      ),
    );
  }

  Widget _listTile({
    required String titleText,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 10),
      decoration: UtilStyles.decorationGlass,
      child: ListTile(
        textColor: AppColors.white,
        iconColor: AppColors.white,
        dense: true,
        title: Text(
          titleText,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        onTap: onTap,
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
      ),
    );
  }
}
