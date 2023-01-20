import 'package:flutter_svg/flutter_svg.dart';

class Model {
  final int conditionId;

  Model(this.conditionId);

  SvgPicture getSvg(conditionId) {
    if (conditionId >= 200 && conditionId < 300) {
      return SvgPicture.asset(
        'assets/main21/svg/lightning.svg',
        width: 100,
        height: 100,
      );
    } else if (conditionId >= 300 && conditionId < 500) {
      return SvgPicture.asset(
        'assets/main21/svg/rain.svg',
        width: 100,
        height: 100,
      );
    } else if (conditionId >= 600 && conditionId < 700) {
      return SvgPicture.asset(
        'assets/main21/svg/snow.svg',
        width: 100,
        height: 100,
      );
    } else if (conditionId >= 700 && conditionId < 800) {
      return SvgPicture.asset(
        'assets/main21/svg/smog.svg',
        width: 100,
        height: 100,
      );
    } else if (conditionId == 800) {
      return SvgPicture.asset(
        'assets/main21/svg/sun.svg',
        width: 100,
        height: 100,
      );
    } else if (conditionId >= 801) {
      return SvgPicture.asset(
        'assets/main21/svg/cloud_sun.svg',
        width: 100,
        height: 100,
      );
    } else {
      return SvgPicture.asset(
        'assets/main21/svg/icon.svg',
        width: 100,
        height: 100,
      );
    }
  }
}
