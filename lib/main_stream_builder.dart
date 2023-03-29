// note: streambuilder 내 data 이해하기 위한 테스트
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TestListView());
}

class TestListView extends StatelessWidget {
  const TestListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List<int> numbers = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('user').snapshots(),
        builder: (context, snapshot) {

          // print(documentSnapshot);
          print('snapshot: ${snapshot.data!.docs.runtimeType}');
          if (snapshot.hasData) {
            return ListView.builder(
              // reverse: true,
              // itemCount: numbers.length,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final documentSnapshot = snapshot.data!.docs[index];
                return Text(documentSnapshot['email'],
                    style: TextStyle(fontSize: 25));
              },
            );
          }
          return CircularProgressIndicator();
        }
      ),
    );
  }
}



