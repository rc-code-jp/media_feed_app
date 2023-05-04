import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_feed_app/screens/main_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Media Feed App',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      routes: {
        '/': (_) => const MainScreen(),
      },
    );
  }
}
