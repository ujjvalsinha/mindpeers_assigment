import 'package:flutter/material.dart';

class Constants {
  static const String greetingTextTitle = "Good Morning, Sahil";
  static const String greetingTextContent =
      "Level up yout life, begin your jounrney with insight...";
  static const String greetingBannerText =
      "Mind Care Index\nGet dwtailed wellness report with insight by experts";
  static const String searchsubtitle = "Your peers are working on these";

  //images
  static const String bannerIcon = "assets/images/dna.png";
  static const String listCardImage1 = "assets/images/teenager.png";
  static const String listCardImage2 = "assets/images/teenager.png";
  static const String userImage = "assets/images/cool.png";

  static const List<String> listCardTitle = [
    "Vent out wall",
    "Vent out wall",
  ];
  static const List<String> listCardSubtitle = [
    "A safe space for you to pour your heart out and feel heard with our community",
    "A safe space for you to pour your heart out and feel heard with our community",
  ];
  static const List<String> listCardImage = [listCardImage1, listCardImage2];
  static const List<Color> listCardColor = [
    Color(0xFF3AA554),
    Color(0xFF3B9EA5)
  ];
  static const List<String> tagsText = ["Stress", "Anxiety", "Overthinking"];

  //More Screen Constants
  static const String moreScreenTitle = "Thought guides";
  static const String moreScreenContent =
      "Relatable thoughts,explained by physiologist";
  static const String moreFilter = "More filters";

  //Bottom Naviagtion constants

  static const String navigationHome = "Home";
  static const String navigationThearpy = "Thearpy";
  static const String navigationBoats = "Boats";
  static const String navigationInsights = "Insights";
  static const String navigationMore = "More";
}

enum UserStateEnum {
  login,
  logout,
}
