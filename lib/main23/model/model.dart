class Model {
  String? getWeatherIcon(int condition) {
    if(condition < 300) {
      return 'assets/main23/svg/cloud_lightning.svg';
    }
    else if(condition < 600) {
      return 'assets/main23/svg/cloud_snow_alt.svg';
    }
    else if(condition == 800) {
      return 'assets/main23/svg/sun.svg';
    }
    else if(condition <= 804) {
      return 'assets/main23/svg/cloud_sun.svg';
    }
    return 'assets/main23/svg/icon.svg';
  }
}