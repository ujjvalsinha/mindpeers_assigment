import 'package:flutter/material.dart';

class TopGreetingWidget extends StatelessWidget {
  final String heading;
  final String subHeading;
  const TopGreetingWidget(
      {Key? key, required this.heading, required this.subHeading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    final Size _size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: _textTheme.headline6!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: _size.height * .02,
        ),
        Text(
          subHeading,
          style: _textTheme.bodyText1!.copyWith(
              color: Colors.white.withOpacity(.6), fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
