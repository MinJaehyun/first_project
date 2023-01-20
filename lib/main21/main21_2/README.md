1. [v] openweather api 사용하여 날씨 정보를 가져오려 한다
2. [v] 날씨 정보를 가져오려면 위도, 경도가 필요하다
3. [v] JSON data를 가져오고, 객체 형태로 변환한다
4. [v] env 설정 - $git rm .env --cached 기존 파일 삭제
5. [v] 리펙토링 - 코드 분리하기
- Geolocation()함수를 class로 분리하기
- Network()함수를 class로 분리하기
6. [v] UI를 구성하고, 가져온 날씨 정보 객체를 활용하여 화면을 구성한다
- [v] weather 의 condition 에 따른 svg 출력하기
- [v] 섭씨온도 출력
- [v] 요일, 날짜, 시간
7. [] 미세먼지 디자인 바탕으로 레이아웃 표시 후, UI구현하기
- [v] 레이아웃 만들기
- [v] 데이터 넣기
8. fixme, todo 찾아서 처리하기
9. 코드 개선할점 찾기