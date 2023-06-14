import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Lotto'),
            centerTitle: true,
            // note: appbar gradient 설정
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Colors.black, Colors.blue]),
              ),
            ),
          ),
          body: LottoDataTable(),
          // note: floatingActionButton 삭제하고, 다른 파일에 직접 버튼 만든 이유? 부모에서 생성한 변수를 자식에게 내려줘야 하는데 매우 번거롭다..
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          // floatingActionButton: FloatingActionButton.extended(
          //   isExtended: true,
          //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //   onPressed: () {
          //     setState(() {
          //       randomNumbers = randomCreateLottoNumbers();
          //     });
          //     print(randomNumbers);
          //   },
          //   label: Text(
          //     '번호 랜덤 생성',
          //   ),
          // ),
        ),
      ),
    );
  }
}

class LottoDataTable extends StatefulWidget {
  const LottoDataTable({super.key});

  @override
  State<LottoDataTable> createState() => _LottoDataTableState();
}

class _LottoDataTableState extends State<LottoDataTable> {
  late List<String> randomNumbers = []; // ['12 1 2 3 5 6', '7'];
  late String myNumbers = ''; // '32 38 25 35 21 37'
  List<int> intList = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                // note: 로또 당첨 번호
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    Container(
                      child: Text(
                        textAlign: TextAlign.center,
                        '로또 당첨 번호',
                        // note: height 로 Text 높이 설정
                        style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20, height: 2),
                      ),
                      color: Colors.blueGrey,
                      width: 400,
                      height: 50,
                    ),
                    DataTable(
                      // note: 좌, 우 간격을 넓힌다. SizedBox(width: 250) 설정하는 것보다 효율적인가 ?
                      columnSpacing: 130,
                      // note: 로또 당첨 번호 - 1열
                      columns: [
                        DataColumn(
                          label: Text('당첨번호', style: TextStyle(fontStyle: FontStyle.italic)),
                        ),
                        DataColumn(
                          label: Text('보너스', style: TextStyle(fontStyle: FontStyle.italic)),
                        ),
                      ],
                      // note: 로또 당첨 번호 - 1행
                      rows: <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            // todo: 추 후 공 모양으로 숫자 감싸는 기능 만들기
                            // note: 로또당첨번호
                            DataCell(
                              Text(
                                randomNumbers.isEmpty ? '로또 번호를\n생성 해주세요' : randomNumbers[0],
                                style: TextStyle(fontSize: 15, letterSpacing: 2.0),
                              ),
                            ),
                            // note: 보너스
                            DataCell(Text(randomNumbers.isEmpty ? '' : randomNumbers[1])),
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),
                SizedBox(height: 10),
                // note: 로또 구매 내역
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        child: Text(
                          textAlign: TextAlign.center,
                          '로또 구매 내역',
                          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20, height: 2),
                        ),
                        color: Colors.blueGrey,
                        width: 400,
                        height: 50,
                      ),
                      DataTable(
                        columns: [
                          DataColumn(
                            label: Text('구매번호', style: TextStyle(fontStyle: FontStyle.italic)),
                          ),
                          DataColumn(
                            label: Text('적중개수', style: TextStyle(fontStyle: FontStyle.italic)),
                          ),
                          DataColumn(
                            label: Text('당첨순위', style: TextStyle(fontStyle: FontStyle.italic)),
                          ),
                        ],
                        rows: <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              // 구매 번호
                              DataCell(
                                SizedBox(
                                  width: 145,
                                  child: Text(
                                    myNumbers.isEmpty ? '로또 번호를\n생성해 주세요' : myNumbers,
                                    softWrap: true,
                                    style: TextStyle(fontSize: 15, letterSpacing: 2.0),
                                  ),
                                ),
                              ),
                              // 적중 개수
                              // note: Text 위젯 밖에 삼항 연산자를 걸거나, Text 위젯 안에 삼항 연산자를 걸 수 있다
                              // note: Opacity(opacity: 0) 위젯 설정하여 안 보이도록 설정하거나
                              DataCell(intList.isNotEmpty ? Text(intList[0].toString()) : Opacity(opacity: 0)),
                              // 당첨 순위
                              // note: '' 설정하여 없도록 할 수 있다
                              DataCell(Text(intList.isEmpty ? '' : intList[1].toString(), style: TextStyle(fontSize: 15, letterSpacing: 5.0))),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  // note: 로또번호와 보너스 번호를 랜덤 생성하는 함수
                  randomNumbers = randomCreateLottoNumbers();
                  // note: 내 로또 번호 랜덤 생성하는 함수
                  myNumbers = myLottoNumbers();
                  // note: 로또 번호와 일치하는 내 로또의 개수와 당첨 순위를 판별하는 함수
                  intList = matchChecker(randomNumbers, myNumbers);
                });
              },
              child: Text('로또 번호 생성기', style: TextStyle(color: Colors.redAccent)),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> randomCreateLottoNumbers() {
  // note: 이렇게 상세 들어가서 사용법 복붙한 뒤 활용하기 - List<E> sublist(int start, [int? end]);
  List<int> randomNumbers = (List<int>.generate(45, (int i) => i + 1)..shuffle()).sublist(0, 7);
  String lottoNumbers = randomNumbers.sublist(0, 6).join(' ');
  String bonus = randomNumbers.sublist(6).join('');
  return [lottoNumbers, bonus];
}

String myLottoNumbers() {
  List<int> randomNumbers = (List<int>.generate(45, (int i) => i + 1)..shuffle()).sublist(0, 6); // [1, 2, 3, 4, 5, 6]
  return randomNumbers.join(' ');
}

List<int> matchChecker(List<String> randomNumbers, String myNumbers) {
  String winnerNumbers = randomNumbers[0]; // '43 14 27 16 9 40'
  int bonus = int.parse(randomNumbers[1]); // int, 22

  List<String> a = winnerNumbers.split(' ');
  List<int> aList = a.map((str) => int.parse(str)).toList();
  // print(aList);

  List<String> b = myNumbers.split(' ');
  List<int> bList = b.map((str) => int.parse(str)).toList();
  // print(bList);

  int matchCount = 0;
  int rank = 0;

  for(int i=0; i<aList.length; i++){ // i=0
    for(int j=0; j<aList.length; j++){ // j=0~끝
      if(aList[i] == bList[j]){
        matchCount += 1;
      }
    }
  }

  if(matchCount == 3) rank = 5;
  else if(matchCount == 4) rank = 4;
  else if(matchCount == 5) rank = 3;
  else if(matchCount == 5 && bList.contains(bonus)) rank = 2;
  else if(matchCount == 6) rank = 1;

  return [matchCount, rank];
}
