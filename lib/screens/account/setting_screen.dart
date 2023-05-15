import 'package:auto_route/annotations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/libraries/auth_storage.dart';
import 'package:media_feed_app/styles/colors.dart';
import 'package:media_feed_app/styles/utils.dart';
import 'package:media_feed_app/widgets/form/action_button.dart';

@RoutePage()
class SettingScreen extends ConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);

  Future<String> _getFcmToken() async {
    final messaging = FirebaseMessaging.instance;
    final token = await messaging.getToken();
    // クリップボードにコピー
    final data = ClipboardData(text: token ?? '');
    await Clipboard.setData(data);
    return token ?? '';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('アカウント設定'),
        backgroundColor: AppColors.transparent,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: UtilStyles.decorationGradient,
        child: SafeArea(
          child: Column(
            children: [
              ActionButton(
                onPressed: () {
                  AuthStorage().delete();
                  // スタート画面へ遷移
                  Navigator.pushNamed(context, '/start');
                },
                text: 'ログアウト',
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                future: _getFcmToken(),
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) {
                    return const Text('Loading...');
                  }
                  return Text('FCM TOKEN: ${snapshot.data}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
