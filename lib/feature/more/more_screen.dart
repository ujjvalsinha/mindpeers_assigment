import 'package:flutter/material.dart';
import 'package:mindpeers_assigment/core/app_configs/colors.dart';
import 'package:mindpeers_assigment/common_widget/custom_appbar.dart';
import 'package:mindpeers_assigment/common_widget/mindpeers_textfield.dart';
import 'package:mindpeers_assigment/common_widget/tag_widget.dart';
import 'package:mindpeers_assigment/common_widget/top_greeting_widget.dart';
import 'package:mindpeers_assigment/core/app_configs/constants.dart';
import 'package:mindpeers_assigment/feature/more/widget/blog_card.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final TextTheme _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: _size.height * .04),
            const CustomAppbar(),
            SizedBox(height: _size.height * .02),
            const TopGreetingWidget(
              heading: Constants.moreScreenTitle,
              subHeading: Constants.moreScreenContent,
            ),
            SizedBox(height: _size.height * .02),
            MindPeersTextField(
              hintText: "Search for a guide",
              onChanged: (value) {},
            ),
            SizedBox(height: _size.height * .04),
            Row(
              children: [
                ...List.generate(
                  2,
                  (index) => TagWidget(
                    title: Constants.tagsText[index],
                  ),
                ),
                const Spacer(),
                Text(
                  Constants.moreFilter,
                  style: _textTheme.bodyText2!.copyWith(
                      fontSize: 12,
                      color: Colors.white.withOpacity(.8),
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  size: 28,
                  color: Colors.white.withOpacity(.6),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: BlogCard(
                        title: "When I am anxious about life transitions...",
                        image:
                            "https://cdn.pixabay.com/photo/2021/07/15/21/25/chaka-salt-lake-6469432_1280.jpg",
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
