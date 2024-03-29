import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vuuum_app/styles/colors.dart';
import 'package:vuuum_app/styles/utils.dart';

final List items = [
  {
    'createdAt': '2022.01.12 10:31',
    'title': 'ポイント獲得',
  },
  {
    'createdAt': '2022.01.12 10:31',
    'title': 'ポイント獲得',
  },
  {
    'createdAt': '2022.01.12 10:31',
    'title': 'ポイント獲得',
  },
  {
    'createdAt': '2022.01.12 10:31',
    'title': 'ポイント獲得',
  },
  {
    'createdAt': '2022.01.12 10:31',
    'title': 'ポイント獲得',
  },
  {
    'createdAt': '2022.01.12 10:31',
    'title': 'ポイント獲得',
  },
  {
    'createdAt': '2022.01.12 10:31',
    'title': 'ポイント獲得',
  },
  {
    'createdAt': '2022.01.12 10:31',
    'title': 'ポイント獲得',
  },
  {
    'createdAt': '2022.01.12 10:31',
    'title': 'ポイント獲得',
  },
  {
    'createdAt': '2022.01.12 10:31',
    'title': 'ポイント獲得',
  },
];

class PointHistoryList extends ConsumerWidget {
  const PointHistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: items.map((item) {
        return _listTile(
          titleText: item['createdAt'],
          subtitleText: item['title'],
          onTap: () => {},
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
      decoration: UtilStyles.decorationGlass,
      child: ListTile(
        textColor: AppColors.white,
        iconColor: AppColors.white,
        title: Text(
          titleText,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          subtitleText,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '10',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'pt',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
