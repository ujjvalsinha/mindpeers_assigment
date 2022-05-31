import 'package:flutter/material.dart';
import 'package:mindpeers_assigment/colors.dart';
import 'package:mindpeers_assigment/common_widget/custom_appbar.dart';
import 'package:mindpeers_assigment/common_widget/custom_horizontal_listview.dart';
import 'package:mindpeers_assigment/common_widget/serch_widget.dart';
import 'package:mindpeers_assigment/core/app_configs/constants.dart';
import 'package:mindpeers_assigment/feature/home/widget/home_banner.dart';
import 'package:mindpeers_assigment/common_widget/top_greeting_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppbar(),
              SizedBox(height: _size.height * .035),
              const TopGreetingWidget(
                heading: Constants.greetingTextTitle,
                subHeading: Constants.greetingTextContent,
              ),
              SizedBox(
                height: _size.height * .02,
              ),
              const HomeBanner(),
              SizedBox(height: _size.height * .03),
              const CustomHorizontallistview(
                title: "Tailored for you",
                cardTitle: Constants.listCardTitle,
                cardBackgroundColor: Constants.listCardColor,
                cardImage: Constants.listCardImage,
                cardSubtitle: Constants.listCardSubtitle,
              ),
              SizedBox(height: _size.height * .035),
              const SearchWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
