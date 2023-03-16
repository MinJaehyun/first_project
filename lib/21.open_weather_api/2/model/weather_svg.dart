import 'package:flutter_svg/flutter_svg.dart';

class Weather_Model {
  final int conditionId;
  Weather_Model(this.conditionId);

  SvgPicture getSvg() {
    // 날씨 상태를 받아 이미지를 반환하는 코드
    SvgPicture duplicationCode({file}) {
      return SvgPicture.asset(
        'assets/main21/svg/$file.svg',
        width: 100,
        height: 100,
      );
    }

    if (conditionId >= 200 && conditionId < 300) {
      String file = 'lightning';
      return duplicationCode(file: file);
    } else if (conditionId >= 300 && conditionId < 500) {
      String file = 'rain';
      return duplicationCode(file: file);
    } else if (conditionId >= 600 && conditionId < 700) {
      String file = 'snow';
      return duplicationCode(file: file);
    } else if (conditionId >= 700 && conditionId < 800) {
      String file = 'smog';
      return duplicationCode(file: file);
    } else if (conditionId == 800) {
      String file = 'sun';
      return duplicationCode(file: file);
    } else if (conditionId >= 801) {
      String file = 'cloud_sun';
      return duplicationCode(file: file);
    } else {
      String file = 'icon';
      return duplicationCode(file: file);
    }
  }
}
