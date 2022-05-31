import 'package:flutter/material.dart';
import 'package:mindpeers_assigment/colors.dart';
import 'package:mindpeers_assigment/common_widget/tag_widget.dart';
import 'package:mindpeers_assigment/core/app_configs/constants.dart';

class BlogCard extends StatelessWidget {
  final String title;
  final String image;

  const BlogCard({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    final Size _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * .15,
      width: _size.width * .9,
      decoration: BoxDecoration(
        color: AppColors.bllogCardBackgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          SizedBox(
            width: _size.width * .035,
          ),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  image,
                  height: _size.width * .25,
                  width: _size.width * .3,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: _size.width * .25,
                width: _size.width * .3,
                color: Colors.black.withOpacity(.2),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 16,
                            color: Colors.white.withOpacity(.7),
                          ),
                          Text(
                            "5k views",
                            style: _textTheme.subtitle2!.copyWith(
                                fontSize: 12,
                                color: Colors.white.withOpacity(.8),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.timer,
                            size: 16,
                            color: Colors.white.withOpacity(.7),
                          ),
                          Text(
                            "5-7 min",
                            style: _textTheme.subtitle2!.copyWith(
                                fontSize: 12,
                                color: Colors.white.withOpacity(.8),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(width: _size.width * .05),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: _size.width * .4,
                child: Text(
                  title,
                  style: _textTheme.bodyText2!.copyWith(
                      fontSize: 14,
                      color: Colors.black.withOpacity(.8),
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: _size.height * .02,
              ),
              Row(
                children: List.generate(
                  2,
                  (index) => TagWidget(
                    backgroundColor: Colors.white,
                    fontSize: 10,
                    fontColor: Colors.black,
                    title: Constants.tagsText[index],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
