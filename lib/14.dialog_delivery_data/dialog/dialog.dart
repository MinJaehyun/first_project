import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  const MyDialog(context, this.job, {Key? key, required this.description, required this.image }) : super(key: key);
  final String job;
  final String description;
  final dynamic image;

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        // note: 팝업창 안에 UI 나타내기
        child: Expanded(
          child: ListView.builder(
            // itemCount: jobList.length, 설정 시, 모달창안에 같은 내용이 3번 반복된다
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.image,
                      alignment: Alignment.center,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      // widget.description,
                      'des: ${widget.description}',
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
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
            },
          ),
        ),
      ),
    );
  }
}
