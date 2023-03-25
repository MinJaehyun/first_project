## 결과물
    1. 회원가입
<img src="https://user-images.githubusercontent.com/43669992/227701180-0fe71d53-4008-428c-9ef9-1cdc2426b76e.gif" width="300" height="600"/>

    2. 업로드 이미지
<img src="https://user-images.githubusercontent.com/43669992/227701185-cd194cea-0eab-4573-984d-42c90fd3eeab.gif" width="300" height="600"/>

    3. 일반 회원가입 유저와 구글 회원가입 유저의 채팅 주고 받기
![chatting_loginuser_googleuser](https://user-images.githubusercontent.com/43669992/227701186-e21f94b3-e73f-4a41-85d8-2c08d0cae146.gif)

### firebase_authentication
![2Untitled](https://user-images.githubusercontent.com/43669992/227703701-09282034-3e88-4cd6-addc-76a9c7d1eab7.png)

### firestore + login_google_user
![Untitled](https://user-images.githubusercontent.com/43669992/227702901-b2111759-b4d6-47b3-bdb4-53faf8745ba0.png)

### 흐름
    1. 계정 1. 일반 회원가입 후, 일반 로그인하고 채팅앱 보여주기 
    2. 계정 2. 구글 로그인하여 채팅앱 보여주기
    * test 계정: t1@email.com , 123456

### 화면 구성
    1. signup screen
    2. login screen
    3. chat screen

### 특징
    1. main 에서 StreamBuilder 에서 authStateChanges 으로 토큰 유무 체크
    2. 회원 가입 & 로그인 페이지에서 body: ModalProgressHUD() 설정
    3. 제일 처음으로 돌아가기: Navigator.of(context).popUntil((route) => route.isFirst);
    4. 미구현: 회원 탈퇴는 FirebaseAuth.instance.currentUser!.delete();

### 개선할 점
1. [x] 버튼 클릭 시, unfocus()로 소프트 키보드 해제 하기
2. [x] 회원 가입의 password 입력창 클릭 시, 소프트 키보드에 입력창 가리는 현상
   - padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom * 1)
3. [x] 구글 로그인 구현
4. [x] 로그 아웃 시, Null check 에러 발생
   - 오류 메시지 없으니 찾기 힘듦
5. [] signup_signin 페이지 리펙토링 
   - 500줄 분리하기
6. [pass] 직접 firebase 에 접근하여 데이터를 작성하였는데, 코드를 통해 메시지를 생성하기
   - 불 필요한 작업
7. [x] profile 에서 이미지 등록 구현
8. [x] 경고: Invalid argument(s): No host specified in URI file:///
   - add_image.dart 65:
9. [x] ChatBubble() 2개의 코드 한개로 리펙토링
10. [x] t1 계정의 이미지 등록된 유저가 메시지 보내면 chats/{doc}/message/에 등록 되는데,
     test19 계정의 이미지 등록 했는지 확인 안 된 유저가 메시지 보내면, 컬랙션 등록 안됨.
   - 문제: firebase 의 test19 에 username 이 null
   - 해결: 최근 회원 가입된 user 는 username 적용 되어서 나오므로, 전체 auth 데이터와 firestore 의 chats 이하 모든 메시지 삭제
11. [] 에러: username 이 4글자 이하로 가입 된다.
12. [x] 구글 로그인 실패
   - 해결: keytool 을 firebase 프로젝트에 sha-1 적용
13. [x] 우선 처리할 것: 2번째 애뮬 레이터에 내가 보낸 메시지가 화면에서 짤린다.
   - 에러나 경고는 아닌데 화면 제대로 안 나온다.
   - 원인: chat_bubble.dart 38: if (!widget.isMe) 설정하여 하나의 위젯만 처리 되었다.
14. [] 말풍선 좌,우 BubbleType 이 변경될 때, 위와 아래 왔다갔다하면 정상 작동한다.
15. [] google-services.json 에 api_key 비밀키로 변경해야 하지 않나 ? - echo 사용해서 github 에서 secret 키 설정하기
16. [x] 구글 로그인 후, 메시지 안 보내진다
   - FirebaseAuth.instance.currentUser 로 firestore 통해서 newUser.uid 가져와서 username 을 적용 했는데,
     이는 구글 로그인 유저 확인 못하므로
   - FirebaseAuth.instance.currentUser 통해 displayName 가져와서 구글 로그인 한 유저의 username 에 적용함

### 전체 구조
      main24
      ㄴ signup_signin: 회원가입 및 로그인 페이지
      ㄴ chat_screen: 전체 채팅 화면
         ㄴ new_message: 최하단 새로운 채팅 보내기 화면
         ㄴ add_image: appbar 좌측 profile 화면
         ㄴ message: 중단 채팅 화면
            ㄴ chat_bubble: 중단 채팅글 말풍선 기능
