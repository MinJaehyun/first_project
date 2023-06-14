### 결과물 1. - old
<img src="https://user-images.githubusercontent.com/43669992/224541206-409e8ed4-d226-4f6e-b7b4-2e247da9f559.gif" width="200" height="400"/>

### 결과물 2. - 기능 이해 및 오류 수정
<img src="https://github.com/MinJaehyun/first_project/assets/43669992/1f600996-6642-40ae-b557-37f88e0196cb" width="200" height="400"/>

### 1번 project
    1. 버튼 클릭하여 지연된 데이터 가져오는 방법
    2. 버튼 클릭하지 않고 지연된 데이터를 가져오는 방법
    3. FutureBuilder 사용법
    4. snapshot.ConnectionState 종류(none, waiting, done)와 snapshot.hasData 의 차이점
    5. 함수 실행 결과 받는 2가지 방법

### 2번 project
    1. snapshot.hasData 사용하여 처리하는 방법

### 정리: snapshot.ConnectionState 와 snapshot.hasData 차이
    1. 네트워크를 통해 데이터를 가져와 사용할 땐 ConnectionState 사용하고, 
       네트워크를 통해 데이터를 가져오지 않을 땐 hasData 사용한다
    2. FutureBuilder 내 future 에는 화면에 출력할 결과값을 가져오고, 이를 snapShot.data 로 처리한다 
