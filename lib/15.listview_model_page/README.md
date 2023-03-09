### 결과물
<img src="https://user-images.githubusercontent.com/43669992/223931509-f376bbf7-aff1-4cdd-8b19-e6103243436a.gif" width="200" height="400"/>

### main
    1. Animal model class 을 사용하여 여러개의 인스턴스를 생성하기 위해 List.generate 사용
    2. ListView.builder 사용하여 이동할 페이지에 클릭한 index 전달
    3. 전달 받은 데이터를 사용하기 위해 설정
    4. 데이터를 UI에 지정

### model
    String: name, imgPath, location - UI 에서 사용할 3개의 변수 설정  

### page
    1. 부모로부터 전달받은 widget value 를 자식에서 사용하기 위한 설정 및 UI 지정
    2. like_button 패키지 사용하여 하트 구현