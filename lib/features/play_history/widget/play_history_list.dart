import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vuuum_app/styles/colors.dart';
import 'package:vuuum_app/styles/utils.dart';
import 'package:vuuum_app/widgets/dialog/detail_modal.dart';

final List items = [
  {
    'title': 'アイドル',
    'artist': 'yoasobi',
  },
  {
    'title': 'アイドル',
    'artist': 'yoasobi',
  },
  {
    'title': 'アイドル',
    'artist': 'yoasobi',
  },
  {
    'title': 'アイドル',
    'artist': 'yoasobi',
  },
  {
    'title': 'アイドル',
    'artist': 'yoasobi',
  },
  {
    'title': 'アイドル',
    'artist': 'yoasobi',
  },
  {
    'title': 'アイドル',
    'artist': 'yoasobi',
  },
  {
    'title': 'アイドル',
    'artist': 'yoasobi',
  },
];

class PlayHistoryList extends ConsumerWidget {
  const PlayHistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: items.map((item) {
        return _listTile(
          titleText: item['artist'],
          subtitleText: item['title'],
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: AppColors.black.withOpacity(0.8),
              builder: (BuildContext context) {
                return DetailModal(
                  artistName: item['artist'],
                  title: item['title'],
                  subTitle: '#アイドル #yoasobi #アーティスト',
                );
              },
            );
          },
        );
      }).toList(),
    );
  }

  Widget _listTile({
    required String titleText,
    required String subtitleText,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 10),
      padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
      decoration: UtilStyles.decorationGlass,
      child: ListTile(
        textColor: AppColors.white,
        iconColor: AppColors.white,
        isThreeLine: true,
        leading: Image.asset('assets/images/artist.png'),
        title: const Text(
          '★★★★★',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              subtitleText,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              titleText,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
