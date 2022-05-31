import 'package:flutter/material.dart';
import 'package:mindpeers_assigment/colors.dart';
import 'package:mindpeers_assigment/core/app_configs/constants.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    final Size _size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      height: _size.height * .16,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.topGreetingBannerColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SizedBox(
            width: _size.width * .5,
            child: Text(
              Constants.greetingBannerText,
              style: _textTheme.bodyText1!.copyWith(
                  color: Colors.black.withOpacity(.8),
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Spacer(),
          SizedBox(
            height: _size.height * .1,
            width: _size.width * .25,
            child: Image.asset(
              Constants.bannerIcon,
            ),
          )
        ],
      ),
    );
  }
}
