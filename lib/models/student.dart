import 'package:flutter/material.dart';

import 'course.dart';
import 'grade.dart';

class Student {
  int studentID;
  String firstName;
  String lastName;
  String email;
  //List<Course> courses;
  //Grade grade;

  Student(this.studentID, this.firstName, this.lastName, this.email);

  int getStudentID() {
    return studentID;
  }
}
