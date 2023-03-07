import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  void getImagePicker() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      // note: convert XFile to File
      image = File(photo!.path);
    });
    // print(image); // '/data/user/0/com.example.first_project/cache/91932336-6aba-4ccf-ab09-83e3fd98f2c53409390823472700578.jpg'
  }

  void showPopup(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.only(top: 30),
            width: 150,
            height: 300,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: image != null ? FileImage(image!) : null,
                ),
                const SizedBox(height: 15),
                OutlinedButton.icon(
                  onPressed: () => getImagePicker(),
                  icon: const Icon(Icons.photo_camera),
                  label: const Text('이미지 등록'),
                ),
                const SizedBox(height: 50),
                TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                  label: const Text('close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
