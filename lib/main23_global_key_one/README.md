# Global key 
## 다른 class 의 변수나 메서드를 실행하는 방법은 ?
1. GlobalKey 설정 후, 가져올 class 의 state 명칭을 설정하고,
2. key 를 설정한 뒤, 키에 접근해서
3. currentContext, currentState, currentWidget 를 통해 메서드에 실행한다