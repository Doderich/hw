import 'package:flutter/material.dart';
import 'package:hw/screens/login_page/login_page.dart';
import 'package:hw/screens/student_select/main_screen.dart';
import 'login_page/auth_page.dart';

class PageSelect extends StatelessWidget {
  PageSelect({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPage(
        showRegisterPage: () {},
      ),
    );
  }
}
