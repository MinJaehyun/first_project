import 'package:flutter/material.dart';
import 'animal_model.dart';
import 'animal_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyPage());
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  static List<String> animalName = [
    'Bear',
    'Camel',
    'Deer',
    'Fox',
    'Kangaroo',
  ];
  static List<String> animalPath = [
    'assets/main15/bear.png',
    'assets/main15/camel.png',
    'assets/main15/deer.png',
    'assets/main15/fox.png',
    'assets/main15/kangaroo.png',
  ];
  static List<String> animalLocation = [
    'korea',
    'seoul',
    'deagu',
    'busan',
    'jeju',
  ];

  // note: 흐름 1. model 사용하여 데이터 생성
  final List<Animal> animalData = List.generate(animalLocation.length,
      (idx) => Animal(animalName[idx], animalPath[idx], animalLocation[idx]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List View')),
      body: ListView.builder(
        itemCount: animalName.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(animalData[index].name),
              leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(animalData[index].imgPath)),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    // note: 흐름 2. 페이지에 데이터 전달
                    builder: (context) => AnimalPage(animal: animalData[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
