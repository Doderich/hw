// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:hw/models/student.dart';
import 'package:hw/urls.dart';
import 'dart:convert';
import 'cust_drop_down_button.dart';
import 'list_student_elm.dart';

class MainScreen extends StatefulWidget {
  final Client client = Client();
  List<Student> students = [];

  MainScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> selectedStudents = [];
  final List<int> items = List<int>.generate(30, (index) => 0);
  List<String> _classes = ['Klasse 1', 'Klasse 3', 'Klasse 6'];
  List<String> _subjects = [];

  //var classesid;

  List<String> choices = [
    'Hinzufügen einer Klasse',
    'Einstellungen',
    'Statistik'
  ];

  @override
  void initState() {
    //print(widget.docid);
    //getclasses(widget.docid);
    getStudents();
    super.initState();
  }

  getClasses() {}

  void getStudents() async {
    widget.students = [];
    print('ah yes i will retrive');
    List response = json.decode((await widget.client.get(retriveURL)).body);
    print('HM thats some tastey data');
    response.forEach((element) {
      widget.students.add(Student.fromMap(element));
    });
    print(widget.students);
    setState(() {});
  }

  void choiceAction(String choice) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: ((context) {
              return choices.map(
                (String choice) {
                  return PopupMenuItem(
                    value: choice,
                    child: Text(
                      choice,
                    ),
                  );
                },
              ).toList();
            })),
        title: Text(
          "Home Work Forgotten",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          Icon(Icons.navigation),
          GestureDetector(
            onTap: (() {}),
            child: Icon(Icons.logout),
          )
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 200.0, maxHeight: 200.0),
            child: FutureBuilder(
                future: getClasses(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Text('Pls wait');
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustDropDownButton(_classes, _classes[0]),
                        CustDropDownButton(
                            ['Fach 1', 'ADGFASD', 'ASDASD'], 'Fach 1'),
                        ButtonTheme(
                          minWidth: double.infinity,
                          height: 100.0,
                          child: MaterialButton(
                              visualDensity: VisualDensity.comfortable,
                              child: const Text('Hello'),
                              onPressed: () {
                                print('Button Pressed');
                              }),
                        ),
                      ],
                    );
                  }
                }),
          ),
          Container(
            //decoration: const BoxDecoration(color: Colors.amber),
            constraints: const BoxConstraints(
              maxWidth: 300,
              maxHeight: 200,
            ),
            child: ListView.builder(
              itemCount: widget.students.length,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              itemBuilder: (context, index) => ListStudentElm(
                student: widget.students[index],
              ),
            ),
          ),
          /*
          Container(
            //decoration: const BoxDecoration(color: Colors.amber),
            constraints: const BoxConstraints(
              maxWidth: 300,
              maxHeight: 200,
            ),
            child: ListView.builder(
              itemCount: selectedStudents.length,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              itemBuilder: (context, index) =>
                  ListStudentElm(index, 'Student Name', 1),
            ),
          ),
          */
          Center(
            child: ButtonTheme(
              minWidth: 200.0,
              height: 100.0,
              child: MaterialButton(
                  visualDensity: VisualDensity.comfortable,
                  child: Text('Hello'),
                  onPressed: () {
                    print('Button Pressed');
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
