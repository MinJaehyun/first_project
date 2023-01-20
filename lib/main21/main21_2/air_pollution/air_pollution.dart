import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AirPollution {
  final int index;
  AirPollution(this.index);

  Widget getAqiImg(index) {
    if (index == 1) {
      // fixme: 이미지 크기 조절하기
      return Image.asset('assets/main21/pollution_image/good.png');
    }
    else if(index == 2) {
      return Image.asset('assets/main21/pollution_image/fair.png');
    }
    else if(index == 3) {
      return Image.asset('assets/main21/pollution_image/moderate.png');
    }
    else if(index == 4) {
      return Image.asset('assets/main21/pollution_image/poor.png');
    }
    else {
      return Image.asset('assets/main21/pollution_image/bad.png');
    }
  }

  Widget getAqiText(index) {
    if (index == 1) {
      return Text("매우좋음", style: GoogleFonts.getFont('Lato', fontSize: 15,color: Colors.white));
    }
    else if(index == 2) {
      return Text("좋음", style: GoogleFonts.getFont('Lato', fontSize: 15,color: Colors.white));
    }
    else if(index == 3) {
      return Text("보통", style: GoogleFonts.getFont('Lato', fontSize: 15,color: Colors.white));
    }
    else if(index == 4) {
      return Text("나쁨", style: GoogleFonts.getFont('Lato', fontSize: 15,color: Colors.white));
    }
    else {
      return Text("매우나쁨", style: GoogleFonts.getFont('Lato', fontSize: 15,color: Colors.white));
    }
  }
}