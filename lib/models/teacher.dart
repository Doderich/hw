import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hw/models/course.dart';

class Teacher {
  String teacherID;
  List<DocumentReference> classes;
  String email;
  String firstName;
  String lastName;
  Teacher(
    this.teacherID,
    this.firstName,
    this.lastName,
    this.email,
    this.classes,
  );
}
