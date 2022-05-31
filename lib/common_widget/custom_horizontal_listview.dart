import 'package:flutter/material.dart';
import 'package:mindpeers_assigment/feature/home/widget/home_card.dart';

class CustomHorizontallistview extends StatefulWidget {
  final String title;
  final List<String> cardTitle;
  final List<String> cardSubtitle;
  final List<String> cardImage;
  final List<Color> cardBackgroundColor;
  const CustomHorizontallistview({
    Key? key,
    required this.title,
    required this.cardTitle,
    required this.cardSubtitle,
    required this.cardImage,
    required this.cardBackgroundColor,
  }) : super(key: key);

  @override
  State<CustomHorizontallistview> createState() =>
      _CustomHorizontallistviewState();
}

class _CustomHorizontallistviewState extends State<CustomHorizontallistview> {
  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    final Size _size = MediaQuery.of(context).size;
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title == "") Container(),
          Text(
            widget.title,
            style: _textTheme.headline6!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: _size.height * .02,
          ),
          SizedBox(
            height: _size.height * .24,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return HomeCardWidget(
                  backgroundColor: widget.cardBackgroundColor[index],
                  content: widget.cardSubtitle[index],
                  title: widget.cardTitle[index],
                  image: widget.cardImage[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
