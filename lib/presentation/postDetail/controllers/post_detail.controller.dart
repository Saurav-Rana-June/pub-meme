import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostDetailController extends GetxController {
  final scrollController = ScrollController();
  RxBool showPostDetailsSection = true.obs;

  final List<String> images = [
    'assets/images/meme-1.png',
    'assets/images/meme-2.jpg',
    'assets/images/meme-3.jpg',
    'assets/images/meme-4.jpg',
    'assets/images/meme-5.png',
    'assets/images/meme-6.jpeg',
    'assets/images/meme-7.jpg',
    'assets/images/meme-8.jpg',
    'assets/images/meme-1.png',
    'assets/images/meme-2.jpg',
    'assets/images/meme-3.jpg',
    'assets/images/meme-4.jpg',
    'assets/images/meme-5.png',
    'assets/images/meme-6.jpeg',
    'assets/images/meme-7.jpg',
    'assets/images/meme-8.jpg',
  ];

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.offset > 0 && showPostDetailsSection.value) {
        showPostDetailsSection.value = false;
      } else if (scrollController.offset <= 0 &&
          !showPostDetailsSection.value) {
        showPostDetailsSection.value = true;
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
