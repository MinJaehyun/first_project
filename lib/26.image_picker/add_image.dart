import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddImage extends StatefulWidget {
  const AddImage(this.imageFunc, {Key? key}) : super(key: key);
  final Function(File image) imageFunc;

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  File? image;

  void getImagePicker() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      // note: convert XFile to File
      image = File(photo!.path);
    });
    // note: 부모의 메서드를 자식에서 실행하여 이미지 등록
    widget.imageFunc(image!);
  }

  @override
  Widget build(BuildContext context) {
    print('child');
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          width: 150,
          height: 300,
          child: Column(
            children: [
              CircleAvatar(radius: 40, backgroundImage: image != null ? FileImage(image!) : null),
              const SizedBox(height: 15),
              OutlinedButton.icon(
                onPressed: getImagePicker,
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
      ),
    );
  }
}
