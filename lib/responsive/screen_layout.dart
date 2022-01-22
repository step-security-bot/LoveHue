import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relationship_bars/utils/colors.dart';

abstract class ScreenLayout extends StatefulWidget {
  const ScreenLayout({Key? key}) : super(key: key);
}

abstract class ScreenLayoutState<T extends ScreenLayout> extends State<T>{
  int page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int currentPage) {
    setState(() {
      page = currentPage;
    });
  }

  void navigationTapped(int currentPage);
}
