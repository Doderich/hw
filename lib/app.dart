import 'package:flutter/material.dart';
import 'package:hw/screens/page_select.dart';
import 'package:hw/screens/student_select/main_screen.dart';
import 'styles.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _theme(),
      home: PageSelect(),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData _theme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        toolbarTextStyle: AppBarTitleStyle,
        titleTextStyle: AppBarTextStyle,
      ),
      textTheme: const TextTheme(
        labelMedium: ButtonTextStyle,
        titleLarge: CaptionTextStyle,
        bodyMedium: BodyMediumTextStyle,
      ),
      primarySwatch: Colors.green,
    );
  }
}
