import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindpeers_assigment/core/app_configs/colors.dart';
import 'package:mindpeers_assigment/core/app_configs/screen_names.dart';
import 'package:mindpeers_assigment/feature/authentication/cubit/login_cubit.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        body: Center(
          child: GestureDetector(
            onTap: () {
              context.read<LoginCubit>().signOut();
              Navigator.popAndPushNamed(context, ScreenNames.landingScreen);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.yellow.withOpacity(.5),
                borderRadius: BorderRadius.circular(12),
              ),
              height: 50,
              width: 120,
              child: Center(
                child: Text(
                  "Log-Out",
                  style: _textTheme.headline6!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ));
  }
}
