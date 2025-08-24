import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pub_meme/infrastructure/theme/icons.dart';
import 'package:pub_meme/infrastructure/theme/theme.dart';

import 'controllers/landing.controller.dart';

class LandingScreen extends GetView<LandingController> {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          currentIndex: controller.currentIndex.value,
          onTap: (index) => controller.toggleScreen(index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primary,
          unselectedItemColor: Theme.of(context).textTheme.bodyMedium!.color!,
          showUnselectedLabels: true,
          selectedLabelStyle: r14.copyWith(),
          unselectedLabelStyle: r14.copyWith(),
          items: [
            BottomNavigationBarItem(
              icon: Text(
                grid_2,
                style: TextStyle(fontFamily: 'FontAwesomeLight', fontSize: 18),
              ),
              activeIcon: Text(
                grid_2,
                style: TextStyle(
                  fontFamily: 'FontAwesomeSolid',
                  fontSize: 18,
                  color: primary,
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Text(
                magnifying_glass,
                style: TextStyle(fontFamily: 'FontAwesomeLight', fontSize: 18),
              ),
              activeIcon: Text(
                magnifying_glass,
                style: TextStyle(
                  fontFamily: 'FontAwesomeSolid',
                  fontSize: 18,
                  color: primary,
                ),
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Text(
                plus,
                style: TextStyle(fontFamily: 'FontAwesomeLight', fontSize: 18),
              ),
              activeIcon: Text(
                plus,
                style: TextStyle(
                  fontFamily: 'FontAwesomeSolid',
                  fontSize: 18,
                  color: primary,
                ),
              ),
              label: "Create",
            ),
            BottomNavigationBarItem(
              icon: Text(
                user,
                style: TextStyle(fontFamily: 'FontAwesomeLight', fontSize: 18),
              ),
              activeIcon: Text(
                user,
                style: TextStyle(
                  fontFamily: 'FontAwesomeSolid',
                  fontSize: 18,
                  color: primary,
                ),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
