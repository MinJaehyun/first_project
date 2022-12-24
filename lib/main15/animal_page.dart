import 'package:first_project/main15/animal_model.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

// NOTE: 좋아요 개수 증가를 동적으로 표현하기 위해 stf 사용
class AnimalPage extends StatefulWidget {
  const AnimalPage({Key? key, required this.animal}) : super(key: key);

  final Animal animal;

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  bool isLiked = false;
  int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.animal.name),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              widget.animal.imgPath,
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'It lives in ${widget.animal.location}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            LikeButton(
              size: 30,
              isLiked: isLiked,
              likeCount: likeCount,
            )
          ],
        ),
      ),
    );
  }
}
