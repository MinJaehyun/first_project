import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductEdit extends StatefulWidget {
  const ProductEdit({Key? key, required this.documentSnapshot}) : super(key: key);
  final DocumentSnapshot documentSnapshot;

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();

  Future<void> _update(DocumentSnapshot documentSnapshot) async {
    final title = titleController.text;
    final subTitle = subTitleController.text;
    // note: CR->DR->DS 접근해서 update
    DocumentReference product = FirebaseFirestore.instance
        .collection('posts')
        .doc(documentSnapshot.id); // documentSnapshot.toString()
    product.update({'title': title, 'body': subTitle});
    // note: upate 클릭 후, 하단팝업시트를 위젯 트리에서 제거
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: IconButton(
          icon: const Icon(Icons.production_quantity_limits),
          onPressed: () {
            // todo: 2개의 컬렉션 가져오려면? Navigator.push 로 페이지 이동하여 body에 stream builder 설정?
          },
        ),
        title: Text(widget.documentSnapshot['title']),
        subtitle: Text(widget.documentSnapshot['body'], maxLines: 1),
        trailing: IconButton(
            onPressed: () async {
              // note: edit 클릭 시, 작성한 내용 나타내기 및 하단 팝업 띄우기
              titleController.text = widget.documentSnapshot['title'];
              subTitleController.text = widget.documentSnapshot['body'];

              await showModalBottomSheet(
                // note: 모달 사용 시, 가려지는 키보드를 위한 3가지 설정
                // note: 모달 1
                isScrollControlled: true,
                context: context,
                builder: (context) => Container(
                  padding: EdgeInsets.only(
                      left: 20,
                      top: 20,
                      right: 20,
                      // note: 모달 2
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    // note: 모달 3
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          const Text('title'),
                          TextField(
                            // note: 자동 줄바꿈
                            maxLines: null,
                            controller: titleController,
                            decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
                            style: const TextStyle(
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          const Text('subtitle'),
                          TextField(
                            maxLines: null,
                            controller: subTitleController,
                            decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
                            style: const TextStyle(
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            // note: 팝업 내용 update
                            _update(widget.documentSnapshot);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent),
                          child: const Text('Update'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(Icons.edit)),
      ),
    );
  }
}
