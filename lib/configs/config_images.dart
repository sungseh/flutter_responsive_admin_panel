class Images { 
  static const String spacer = "assets/images/source_app-spacer.png";
  static const String star = "assets/images/star-icon.png";
  static const String welcome = "assets/images/welcome_image.png";
  static const String logoTrans = "assets/images/main_logo.png";
  static const String noImage = "assets/images/noimage.jpg";
  static const String avatar = "assets/images/avatar.jpg";
  static const String morning = "assets/images/morning.png";
  static const String evening = "assets/images/evening.png";
  static const String sampeLandscape = "assets/images/landscape.png";
  static const String gradientBg = "assets/images/gradient_bg.png";
  static const String waterColorBg = "assets/images/watercolor_bg.png";
  static const String waterColorBgOld = "assets/images/oldwatercolor_bg.png";
  static const String searchBg = "assets/images/search_bg.png";
  static const String nocontent = "assets/images/nocontent.png";
  static const String smallAppIcon = "assets/images/smallicon.png";
  static const String google = "assets/images/google.png";
  static const String goldBackground = "assets/images/gold.jpg";

  ///Singleton factory
  static final Images _instance = Images._internal();

  factory Images() {
    return _instance;
  }

  Images._internal();
}
