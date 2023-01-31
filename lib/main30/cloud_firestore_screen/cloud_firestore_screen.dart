import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/main30/screen/product_edit.dart';
import 'package:flutter/material.dart';

class CloudFirestoreScreen extends StatefulWidget {
  const CloudFirestoreScreen({Key? key}) : super(key: key);

  @override
  State<CloudFirestoreScreen> createState() => _CloudFirestoreScreenState();
}

class _CloudFirestoreScreenState extends State<CloudFirestoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Firestore'),
      ),
      // note: 전체 목록
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var documentSnapshot = snapshot.data!.docs[index];
                  return ProductEdit(documentSnapshot: documentSnapshot);
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
