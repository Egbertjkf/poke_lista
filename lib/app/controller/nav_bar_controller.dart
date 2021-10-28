import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  final pageViewController = PageController();
  final _selectedPage = 0.obs;

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  get selectedPage => _selectedPage.value;
  set selectedPage(data) => _selectedPage.value = data;

  goTo(int page) {
    pageViewController.animateToPage(page,
        curve: Curves.easeIn, duration: const Duration(milliseconds: 200));
    selectedPage = page;
    update();
  }
}
