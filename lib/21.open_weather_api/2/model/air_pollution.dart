import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AirPollution {
  final int index;
  AirPollution(this.index);

  Widget getAqiImg() {
    var path = 'assets/main21/pollution_image';

    if (index == 1) {
      return Image.asset('$path/good.png');
    }
    else if(index == 2) {
      return Image.asset('$path/fair.png');
    }
    else if(index == 3) {
      return Image.asset('$path/moderate.png');
    }
    else if(index == 4) {
      return Image.asset('$path/poor.png');
    }
    else {
      return Image.asset('$path/bad.png');
    }
  }

  Widget getAqiText() {
    var style = GoogleFonts.getFont('Lato', fontSize: 15,color: Colors.white);
    
    if (index == 1) {
      return Text("매우좋음", style: style);
    }
    else if(index == 2) {
      return Text("좋음", style: style);
    }
    else if(index == 3) {
      return Text("보통", style: style);
    }
    else if(index == 4) {
      return Text("나쁨", style: style);
    }
    else {
      return Text("매우나쁨", style: style);
    }
  }
}