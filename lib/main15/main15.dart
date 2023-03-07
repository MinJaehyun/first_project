import 'package:flutter/material.dart';
import 'package:first_project/main15/animal_page.dart';
import 'animal_model.dart';

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

  final List<Animal> animalData = List.generate(
    animalLocation.length,
    (idx) => Animal(animalName[idx], animalPath[idx], animalLocation[idx]),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List View'),
        ),
        body: ListView.builder(
          itemCount: animalName.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                // title: Text(animalName[index]),
                title: Text(animalData[index].name),
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(animalData[index].imgPath),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AnimalPage(
                        animal: animalData[index],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ));
  }
}
