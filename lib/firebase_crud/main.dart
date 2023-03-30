import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

/** 기본 구성 및 진행 사항
 * 1. [x] DB를 통해 데이터 가져와서, 화면에 출력하기
 * 2. [x] card 내 ListTile 형태 만들기
 * 3. [] 코드 분리하기
 * */

/** Firebase 를 통한 CRUD - R,U 만들기
 * 1. [x] 변경 버튼 클릭 시, 하단 팝업창 띄우기
 * 2. [x] 기존 내용 input 창에 나타내기
 * 3. [x] 변경 후, 변경 버튼 누르면 변경된 내용을 DB 에 저장하고, UI 즉시 업데이트 하기
 * 4. [x] 취소 버튼 만들고, pop() 처리하기
 * */

/** Firebase 를 통한 CRUD - D 만들기
 * 1. [x] 클릭한 대상 찾아서, DB 에서 지운다
 * 2. [x] DB 에서 지우면 UI 즉시 업데이트 되는지 확인하기
 * */

/** Firebase 를 통한 CRUD - C 만들기
 * [x] 우측 하단에 데이터 생성 버튼 만들기
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        // note: 랜덤인 리스트 출력 순서를 최신 데이터를 상위에 위치하도록 개선
        stream: FirebaseFirestore.instance.collection('posts').orderBy('timeStamp', descending: true).snapshots(),
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
                      // note: update BTN
                      IconButton(
                        onPressed: () => updateModalBtn(context, documentSnapshot),
                        icon: Icon(Icons.auto_fix_high),
                      ),
                      IconButton(
                        onPressed: () {
                          // note: 팝업 띄우기 - showDialog() 내에 AlertDialog() return 하기
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('정말 삭제 하나요?'),
                                actions: [
                                  Row(
                                    children: [
                                      OutlinedButton(
                                        onPressed: () async {
                                          await FirebaseFirestore.instance.collection('posts').doc(documentSnapshot.id).delete();
                                          Navigator.of(context).pop();
                                        },
                                        style: OutlinedButton.styleFrom(backgroundColor: Colors.red),
                                        child: Text('delete', style: TextStyle(color: Colors.white)),
                                      ),
                                      SizedBox(width: 10),
                                      OutlinedButton(
                                        onPressed: Navigator.of(context).pop,
                                        child: Text('cancel'),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.delete_sweep),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createModalBtn();
        },
        child: Text('create'),
      ),
    );
  }

  void updateModalBtn(context, documentSnapshot) async {
    // note: DB 값 입력창에 나타내기
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
              // note: 소프트 키보드에 가려지는 입력창을 올리는 방법
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
                              onPressed: () async {
                                // note: posts collection 내 documentSnapshot 의 id 접근
                                await FirebaseFirestore.instance.collection('posts').doc(documentSnapshot.id).update({'title': titleController.text, 'body': bodyController.text});
                                Navigator.of(context).pop();
                              },
                              child: Text('update'),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                foregroundColor: Colors.amber,
                              )),
                          SizedBox(width: 12),
                          OutlinedButton(
                            onPressed: Navigator.of(context).pop,
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

  void createModalBtn() async {
    titleController.text = '';
    bodyController.text = '';

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
                              // note: create
                              onPressed: () async {
                                FirebaseFirestore.instance.collection('posts').add({
                                  'title': titleController.text,
                                  'body': bodyController.text,
                                  'timeStamp': Timestamp.now(),
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text('create'),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                foregroundColor: Colors.amber,
                              )),
                          SizedBox(width: 12),
                          OutlinedButton(
                            onPressed: Navigator.of(context).pop,
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
