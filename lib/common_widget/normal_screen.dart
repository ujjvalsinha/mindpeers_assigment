import 'package:flutter/material.dart';
import 'package:mindpeers_assigment/core/app_configs/colors.dart';

class NormalScreen extends StatelessWidget {
  final String title;
  const NormalScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Center(
        child: Text(
          title,
          style: _textTheme.bodyText2!.copyWith(
              fontSize: 20,
              color: Colors.white.withOpacity(.8),
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
