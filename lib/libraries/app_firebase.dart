// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:vuuum_app/firebase_options_prd.dart' as fb_option_prd;
// import 'package:vuuum_app/firebase_options_stg.dart' as fb_option_stg;
// import 'package:vuuum_app/libraries/logger.dart';

// class AppFirebase {
//   Future<void> initialize() async {
//     // 環境名確認
//     const flavorName = String.fromEnvironment('flavor');
//     logger.info('flavorName: $flavorName');

//     // Firebaseを初期化
//     await Firebase.initializeApp(
//       // 本番環境はprd、それ以外はstg
//       options: flavorName == 'prd'
//           ? fb_option_prd.DefaultFirebaseOptions.currentPlatform
//           : fb_option_stg.DefaultFirebaseOptions.currentPlatform,
//     );
//   }

//   Future<void> requestFcmPermission() async {
//     // // FCM の通知権限リクエスト
//     final messaging = FirebaseMessaging.instance;
//     await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//   }
// }
