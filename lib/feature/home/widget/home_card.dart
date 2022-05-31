import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  final String title;
  final String content;
  final String image;
  final Color backgroundColor;
  const HomeCardWidget(
      {Key? key,
      required this.title,
      required this.content,
      required this.image,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    final Size _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(right: _size.width * .06),
      height: _size.height * .17,
      width: _size.width * .6,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: _textTheme.bodyText1!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: _size.height * .01,
            ),
            Text(
              content,
              style: _textTheme.bodyText2!.copyWith(
                  color: Colors.black.withOpacity(.8),
                  fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            Container(
              alignment: Alignment.center,
              height: _size.height * .09,
              child: Image.asset(image),
            )
          ],
        ),
      ),
    );
  }
}
