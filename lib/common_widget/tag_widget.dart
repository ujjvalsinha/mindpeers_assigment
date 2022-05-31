import 'package:flutter/material.dart';
import 'package:mindpeers_assigment/colors.dart';

class TagWidget extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final double? fontSize;
  final Color? fontColor;
  const TagWidget(
      {Key? key,
      required this.title,
      this.backgroundColor = AppColors.searchBackgroundColor,
      this.fontSize = 12,
      this.fontColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(.8)),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        title,
        style: _textTheme.bodyText2!.copyWith(
            fontSize: fontSize,
            color: fontColor!.withOpacity(.8),
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
