import 'package:flutter/material.dart';
import 'package:mindpeers_assigment/common_widget/bottom_bar_widget.dart';
import 'package:mindpeers_assigment/core/app_configs/screen_names.dart';
import 'package:mindpeers_assigment/feature/authentication/screens/login.dart';
import 'package:mindpeers_assigment/feature/home/home_screen.dart';
import 'package:mindpeers_assigment/feature/landing_screen.dart';
import 'package:mindpeers_assigment/feature/more/more_screen.dart';

class RouteFenerator {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case ScreenNames.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const LoginScreen(),
        );

      case ScreenNames.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomeScreen(),
        );

      case ScreenNames.more:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const MoreScreen(),
        );

      case ScreenNames.homeNavigationScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const BottomBarWidget(),
        );

      case ScreenNames.landingScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const LandingScreen(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const LoginScreen(),
        );
    }
  }
}
