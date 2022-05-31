import 'package:flutter/material.dart';
import 'package:mindpeers_assigment/colors.dart';
import 'package:mindpeers_assigment/common_widget/mindpeers_textfield.dart';
import 'package:mindpeers_assigment/common_widget/tag_widget.dart';
import 'package:mindpeers_assigment/core/app_configs/constants.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    final Size _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * .18,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.searchBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          MindPeersTextField(
            hintText: "What do you want to work on today?",
            onChanged: (value) {},
          ),
          SizedBox(height: _size.height * .01),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.auto_graph,
                      color: Colors.white.withOpacity(.8),
                    ),
                    Text(
                      Constants.searchsubtitle,
                      style: _textTheme.bodyText2!.copyWith(
                          fontSize: 12,
                          color: Colors.white.withOpacity(.8),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: _size.height * .01,
                ),
                Row(
                  children: List.generate(
                    3,
                    (index) => TagWidget(
                      title: Constants.tagsText[index],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
