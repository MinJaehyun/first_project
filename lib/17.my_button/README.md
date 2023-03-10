### 1차 결과물
    1. 구글 로그인하여 본인 계정으로 접근 성공 시, 
        snack bar msg 에 로그인 한 정보를 나타내고 있다
    2. login.dart 에서는 ElevatedButton 버튼을 3개 생성하고, 
        중복되는 버튼을 button.dart 에서 커스텀 button 위젯을 만들어서 처리하고 있다.
    3. google login 기능 구현
<img src="https://user-images.githubusercontent.com/43669992/224204786-0ade4e68-9fd1-4b3c-b9e5-9ef68964bd47.gif" width="200" height="400"/>

------
### 2차 결과물
    1. 다른 페이지에서 구글 로그인 정보를 가져오려할 때, 아래 에러 발생
        (LateInitializationError: Field 'name' has not been initialized)
        1) Streambuider 사용하여 authStateChanges 에 인증 정보를 snapshot 으로 받아서 정보 처리함 
    2. google logout 기능 구현
<img src='https://user-images.githubusercontent.com/43669992/224400129-f6656c3f-0c8c-4702-9772-cee581696f76.gif' width="200" height="400"/>

------
### fix: 
    1. [] previous_code.dart 는 버튼이 중복되는데, 이를 리펙토링 하기

------
* 1,2번 프로젝트는 동일한 기능을 하므로 1번만 수정하기