### 결과물
<img src="https://user-images.githubusercontent.com/43669992/224541206-409e8ed4-d226-4f6e-b7b4-2e247da9f559.gif" width="200" height="400"/>

### 1번 project 학습 내용
    1. 버튼을 사용하여 데이터를 가져오는 방법
    2. 버튼을 사용하지 않고 데이터를 가져오는 방법
    3. FutureBuilder 사용법
    4. snapshot.ConnectionState 의 none, waiting, done 의 차이점
    5. 함수 실행 결과를 받아서 처리하는 2가지 방법

### 2번 project 학습 내용
    1. snapshot.hasData 사용하여 처리하는 방법

### 느낀점
    * snapshot.ConnectionState 는 현재 상태를 나타내는 반면, snapshot.hasData 는 데이터가 성공적으로 반환 되었는지 여부를 나타낸다
    * 근데 동일한 결과는 나타내므로 아직까지 차이를 못느끼겠다..
    * snapshot.ConnectionState 사용할 경우, 버튼을 클릭하면 같이 데이터가 변경된다
    * snapshot.hasData 사용할 경우, 버튼을 클릭하면 아래는 데이터가 변경되자 않는다
    * 왜 ? snapshot.connectionState == ConnectionState.waiting 처리 시, re builder 되고 있다
    * 일단, FutureBuilder rebuilder 안되게 하려면 snapshot.hasData 사용하거나,   
    * ConnectionState.waiting 사용 시, async 설치 및 return this._memoizer.runOnce(() async {} 설정한다.  
