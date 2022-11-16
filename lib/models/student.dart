// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Student {
  int id;
  String name;
  String email;
  String grade;
  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.grade,
  });

  Student copyWith({
    int? id,
    String? name,
    String? email,
    String? grade,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      grade: grade ?? this.grade,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'grade': grade,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      grade: map['grade'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Student(id: $id, name: $name, email: $email, grade: $grade)';
  }

  @override
  bool operator ==(covariant Student other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.grade == grade;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ grade.hashCode;
  }
}
