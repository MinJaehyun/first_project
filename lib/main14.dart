import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  var jobList = ['Dentist', 'Pharmacist', 'Programmer'];
  var imageList = [
    'assets/main14/image1.png',
    'assets/main14/image2.png',
    'assets/main14/image3.png',
    // 'assets/main14/image1', X
    // 'image/1.png', X
  ];
  var descriptions = [
    'Moving the ownership of non-trivial UI-state-driving business logic out of the list child subtree. For instance, if a list contains posts with their number of upvotes coming from a cached network response, store the list of posts and upvote number in a data model outside the list. Let the list child UI subtree be easily recreate-able from the source-of-truth model object. ',
    "Letting KeepAlive be the root widget of the list child widget subtree that needs to be preserved. The KeepAlive widget marks the child subtree's top render object child for keepalive. When the associated top render object is scrolled out of view, the list keeps the child's render object (and by extension, its associated elements and states) in a cache list instead of destroying them. When scrolled back into view, the render object is repainted as-is (if it wasn't marked dirty in the interim)",
    'This only works if addAutomaticKeepAlives and addRepaintBoundaries are false since those parameters cause the ListView to wrap each child widget subtree with other widgets.'
  ];

  // showPopup
  // - context, job, image, description
  void showPopup(context, job, image, description) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          image,
                          alignment: Alignment.center,
                          width: 200,
                          height: 200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          description,
                          // maxLines: 15,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                          label: const Text('close'),
                      )
                    ],
                  );
                }
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ListView',
            style: TextStyle(color: Colors.grey[500]),
          ),
          elevation: 0,
          backgroundColor: Colors.grey[100],
        ),
        body: ListView.builder(
          itemCount: jobList.length,
          itemBuilder: (context, index) {
            // NOTE: 일반
            // return Text('test num ${index + 1}');

            // NOTE: Image(image: AssetImage()) 사용하여 이미지 가져오기
            // return Image(image: AssetImage(imageList[index]));

            // NOTE: Card 위젯 형태 사용하여 이미지 가져오기
            return GestureDetector(
              onTap: () {
                // debugPrint('cliced is GestureDetector onTap');
                // NOTE: showPopup 인자를 넣어 실행하여 팝업창 띄우기
                showPopup(context, jobList[index], imageList[index],
                    descriptions[index]);
              },
              child: Card(
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      // Image.asset 사용하여 이미지 가져오기
                      child: Image.asset(imageList[index]),
                    ),
                    SizedBox(
                      // width: 511,
                      width: width,
                      child: Center(
                        child: Column(
                          children: [
                            Text(jobList[index],
                                style: const TextStyle(
                                  fontSize: 22,
                                )),
                            Text(
                              descriptions[index],
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
