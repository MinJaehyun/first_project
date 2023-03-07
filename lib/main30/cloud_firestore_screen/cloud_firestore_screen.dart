import 'package:flutter/material.dart';
import 'package:first_project/main30/screen/product_crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFirestoreScreen extends StatefulWidget {
  const CloudFirestoreScreen({Key? key}) : super(key: key);

  @override
  State<CloudFirestoreScreen> createState() => _CloudFirestoreScreenState();
}

class _CloudFirestoreScreenState extends State<CloudFirestoreScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Firestore'),
        actions: [
          IconButton(
            onPressed: () {
              // note: DB 저장하기 위해 팝업창 구현
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('title'),
                              TextField(
                                controller: titleController,
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('subTitle'),
                              TextField(
                                controller: subTitleController,
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          ElevatedButton(
                            onPressed: () async {
                              var title = titleController.text;
                              var subTitle = subTitleController.text;
                              await FirebaseFirestore.instance.collection('posts').add({ 'title': title, 'body': subTitle, 'timeStamp': Timestamp.now() });
                              titleController.text = '';
                              subTitleController.text = '';
                              if (!mounted) return;
                              Navigator.of(context).pop();
                            },
                            child: const Text('Create'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              // note: 로그아웃
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      // note: 전체 목록
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').orderBy('timeStamp', descending: true).snapshots(),
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
        },
      ),
    );
  }
}
