import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

/** 기본 구성
 * 1. [x] DB를 통해 데이터 가져와서, 화면에 출력하기
 * 2. [x] card 내 ListTile 형태 만들기
 * */

/** Firebase 를 통한 CRUD 만들기
 * 1. [x] 변경 버튼 클릭 시, 하단 팝업창 띄우기
 * 2. [x] 기존 내용 input 창에 나타내기
 * 3. [x] 변경 후, 변경 버튼 누르면 변경된 내용을 DB 에 저장하고, UI 즉시 업데이트 하기
 * 4. [x] 취소 버튼 만들고, pop() 처리하기
 * */

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  // var title;
  // var subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final documentSnapshot = snapshot.data!.docs[index];

              return Card(
                child: ListTile(
                  leading: Icon(Icons.contact_emergency),
                  title: Text(documentSnapshot['title']),
                  subtitle: Text(documentSnapshot['body']),
                  trailing: Wrap(
                    spacing: 1,
                    children: [
                      IconButton(
                        onPressed: () => showModalBtn(context, documentSnapshot),
                        icon: Icon(Icons.auto_fix_high),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Icon(Icons.delete_sweep),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void showModalBtn(context, documentSnapshot) async {
    titleController.text = documentSnapshot['title'];
    bodyController.text = documentSnapshot['body'];

    await showMaterialModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              top: 5,
              left: 10,
              right: 5,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: [
                Form(
                  child: Column(
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: 'title',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: bodyController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'subTitle',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                // todo: 왜 필요한지 ???
                                // title = titleController.text;
                                // subTitle = bodyController.text;
                              });
                              // note: posts collection 내 documentSnapshot 의 id 에 접근
                              final posts = FirebaseFirestore.instance.collection('posts').doc(documentSnapshot.id).update(
                                { 'title': titleController.text,
                                  'body': bodyController.text
                                }
                              );
                            },
                            child: Text('update'),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              foregroundColor: Colors.amber,
                            )
                          ),
                          SizedBox(width: 12),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blueAccent,
                            ),
                            child: Text('cancel'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
