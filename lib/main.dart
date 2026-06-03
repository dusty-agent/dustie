import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';
import 'theme/dustie_colors.dart';
import 'pages/about_page.dart';

void main() {
  runApp(const DustieApp());
}

class DustieApp extends StatelessWidget {
  const DustieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Dustie',

      theme: ThemeData(
        scaffoldBackgroundColor: dustieColorSet['background'],

        fontFamily: 'Pretendard',

        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontWeight: FontWeight.w500),
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: dustieColorSet['accent'],
          foregroundColor: dustieColorSet['textPrimary'],
          elevation: 0,
        ),
      ),
      routes: {'/about': (context) => const AboutDustiePage()},

      home: const ChatScreen(),
    );
  }
}
