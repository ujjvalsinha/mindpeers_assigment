import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mindpeers_assigment/colors.dart';
import 'package:mindpeers_assigment/common_widget/bottom_bar_widget.dart';
import 'package:mindpeers_assigment/core/app_configs/constants.dart';

import 'package:mindpeers_assigment/core/auth_services.dart';
import 'package:mindpeers_assigment/feature/authentication/screens/login.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: FutureBuilder<UserStateEnum>(
        future: GetIt.I<AuthService>().getUserState(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data) {
              case UserStateEnum.login:
                return const BottomBarWidget();

              case UserStateEnum.logout:
                return const LoginScreen();

              default:
                return const Center(child: CircularProgressIndicator());
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
