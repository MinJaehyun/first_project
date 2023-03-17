import 'dart:ui';

// 여러곳에서 색상을 사용하기 위한 설정
class Palette {
  static const Color iconColor = Color(0xFFB6C7D1);
  static const Color activeColor = Color(0xFF09126C);
  static const Color textColor1 = Color(0XFFA7BCC7); // Slate Grey
  static const Color textColor2 = Color(0XFF9BB3C0);
  static const Color facebookColor = Color(0xFF3B5999);
  static const Color googleColor = Color(0xFFDE4B39);
  static const Color backgroundColor = Color(0xFFECF3F9);
}

// note: const 없고 static 만 있는 경우, Only static fields can be declared as const 에러
// note: static 삭제 시 다른 파일에서 Palette.textColor1로 참조하려는 경우, Instance member 'textColor1' can't be accessed using static access 에러
