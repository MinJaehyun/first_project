import 'dart:io';
import 'package:first_project/26.image_picker/add_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'test image picker',
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
  File? image;

  void pickedImage(File image) {
    image = image;
  }

  void showPopup(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(child: AddImage(pickedImage));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('parent');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showPopup(context);
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
