import 'package:flutter/material.dart';
import 'package:mindpeers_assigment/colors.dart';
import 'package:mindpeers_assigment/common_widget/basic_screen.dart';
import 'package:mindpeers_assigment/core/app_configs/constants.dart';
import 'package:mindpeers_assigment/feature/home/home_screen.dart';
import 'package:mindpeers_assigment/feature/more/more_screen.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int navigationSelectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      const BottomNavigationBarItem(
        label: Constants.navigationHome,
        icon: Icon(
          Icons.home,
        ),
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.account_tree_sharp,
        ),
        label: Constants.navigationThearpy,
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.more,
        ),
        label: Constants.navigationMore,
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.more,
        ),
        label: Constants.navigationMore,
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.more,
        ),
        label: Constants.navigationMore,
      ),
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageViewScreen() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: const <Widget>[
        HomeScreen(),
        MoreScreen(),
        BasicScreen(),
        HomeScreen(),
        HomeScreen(),
      ],
    );
  }

  void pageChanged(int index) {
    setState(
      () {
        navigationSelectedIndex = index;
      },
    );
  }

  void bottomTapped(int index) {
    setState(
      () {
        navigationSelectedIndex = index;
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (navigationSelectedIndex == 0) {
          return Future.value(true);
        } else {
          bottomTapped(0);
          return Future.value(false);
        }
      },
      child: Scaffold(
        body: buildPageViewScreen(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppColors.appBackgroundColor,
            border: Border(
              top: BorderSide(
                width: 0.2,
                color: Colors.white.withOpacity(.2),
              ),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed, // Fixed
            backgroundColor:
                AppColors.appBackgroundColor, // <-- This works for fixed
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            currentIndex: navigationSelectedIndex,
            onTap: (index) {
              bottomTapped(index);
            },
            items: buildBottomNavBarItems(),
          ),
        ),
      ),
    );
  }
}
