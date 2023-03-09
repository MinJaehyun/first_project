import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'animal_model.dart';

// NOTE: 좋아요 개수를 동적 표현하기 위해 STF 적용
class AnimalPage extends StatefulWidget {
  // note: 흐름 3. 전달 받은 데이터를 사용하기 위한 설정
  const AnimalPage({Key? key, required this.animal}) : super(key: key);
  final Animal animal;

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

// note: 흐름 4. 데이터를 UI에 지정
class _AnimalPageState extends State<AnimalPage> {
  bool isLiked = false;
  int likeCount = 5;

  @override
  Widget build(BuildContext context) {
    var widgetAnimal = widget.animal;
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetAnimal.name),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              widgetAnimal.imgPath,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            Text('It lives in ${widgetAnimal.location}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            LikeButton(size: 30, isLiked: isLiked, likeCount: likeCount)
          ],
        ),
      ),
    );
  }
}
