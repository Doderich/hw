import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'cust_drop_down_button.dart';
import 'list_student_elm.dart';

final usersRef = FirebaseFirestore.instance.collection('Users');
final db = FirebaseFirestore.instance;
final user = FirebaseAuth.instance.currentUser;

class MainScreen extends StatefulWidget {
  @override
  var docid;
  MainScreen(this.docid);
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
    super.initState();
  }

  getclasses() async {
    var docsnap = await usersRef.doc(widget.docid).get();
    Map<String, dynamic>? data = docsnap.data();
    var value = data?['classes'];
    List<String> classesid = [];
    for (int i = 0; i < value.length; i++) {
      DocumentReference<Map<String, dynamic>> tempRef = value[i];
      classesid.add(tempRef.path);
      getClassNameById(tempRef.path);
    }
    print(_classes);
  }

  void getClassNameById(String documentPath) async {
    var docsnap = await db.doc(documentPath).get();
    Map<String, dynamic>? data = docsnap.data();
    print(data?['class']);
    _classes.add(data?['class']);
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
            onTap: (() {
              FirebaseAuth.instance.signOut();
            }),
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
                future: getclasses(),
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
              itemCount: items.length,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              itemBuilder: (context, index) =>
                  ListStudentElm(index, 'Student Name', 1),
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
