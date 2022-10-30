import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hw/screens/student_select/main_screen.dart';
import 'login_page/auth_page.dart';

final usersRef = FirebaseFirestore.instance.collection('Users');
final user = FirebaseAuth.instance.currentUser;
String getUser() {
  usersRef.get().then((QuerySnapshot snapshot) {
    for (var doc in snapshot.docs) {
      var data = doc.data() as Map;
      if (data['email'] == user!.email) {
        print(doc.id);
        return doc.id;
      }
    }
  });
  return '';
}

class PageSelect extends StatelessWidget {
  const PageSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainScreen(getUser());
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
