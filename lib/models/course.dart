import 'package:hw/models/forgotten_hw.dart';
import 'package:hw/models/grade.dart';
import 'package:hw/models/student.dart';

class Course {
  int courseID;
  String name;
  Grade grade;
  List<Student> pupiles;
  List<ForgottenHW> badList;
  Course(this.courseID, this.name, this.grade, this.pupiles, this.badList);
}
