import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class AddImage extends StatefulWidget {
  const AddImage(this.changeImage, {Key? key}) : super(key: key);
  final Function changeImage;

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  File? _imageFile;

  void _pickImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? pickedFile = await _picker.pickImage(
        // maxWidth: maxWidth, maxHeight: maxHeight, imageQuality: quality,
        source: ImageSource.camera,
      );
      setState(() {
        _imageFile = File(pickedFile!.path);
        widget.changeImage(_imageFile);
      });

      // note: 이미지를 storage 에 저장하고, userImae 에 image 를 담음
      var newUser = await FirebaseAuth.instance.currentUser;
      final refPickedImage = FirebaseStorage.instance.ref('picked_image/').child(newUser!.uid + '.png');
      // print(refPickedImage);
      // Reference(app: [DEFAULT], fullPath: picked_image/J7M9LyKoz2e7Wfb24EMmLWEWi0j1.png)

      // final userData = await FirebaseFirestore.instance.collection('user').doc(newUser!.uid).get();
      // note: print('userData: ${userData.data()}');
      // userData: {email: test18@email.com, username: test18}

      await refPickedImage.putFile(_imageFile!);
      final url = await refPickedImage.getDownloadURL();
      // print(url);

      // https://firebasestorage.googleapis.com/v0/b/chats-app-5b904.appspot.com/o/picked_image%2FJ7M9LyKoz2e7Wfb24EMmLWEWi0j1.png?alt=media&token=d6d24479-0ec6-4d8f-91e7-a4709e583c50
      // note: 기존 pickedImage 는 남기고, pickedImage2 속성을 추가
      final data = {'pickedImage': url};
      await FirebaseFirestore.instance.collection('user').doc(newUser.uid).set(data, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 400,
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
            ),
            SizedBox(height: 35),
            OutlinedButton.icon(
              onPressed: () {
                // note: 부모의 changeImage 실행하여 image 변경하고 reload된 값 즉시 나타내기
                _pickImage();
              },
              icon: Icon(Icons.camera_alt, color: Colors.purple),
              label: Text('이미지 등록 버튼', style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 80),
            TextButton.icon(
              icon: Icon(Icons.close_rounded, color: Colors.purple),
              onPressed: () => Navigator.of(context).pop(),
              label: Text('닫기', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
