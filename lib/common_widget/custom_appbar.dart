import 'package:flutter/material.dart';
import 'package:mindpeers_assigment/core/app_configs/colors.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.avatarbackgrounColor,
          ),
          child: const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
