### 1. main28 - 기본 구조 설정

### 2-1. service - json to object 과정
    1) Uri.parse
    2) http.get 으로 json data 가져오기
    3) response.body 값을 decode 하기 위한 설정
       (1) user model에 userFromJson메서드 사용

### 2-2. user model - json to object 과정
    1) service.dart에서 실행한 userFromJson메서드는 과정을 통해 User object 에 정보를 담는다

### 2-3. main - json to object 과정
    1) UI에 뿌려줄 main28 파일에 user정보를 가져오기 위해
    2) initState 에서 Service.getInfo 에 접근하여 변수에 데이터를 담는다

### 3. UI에 데이터 지정하기