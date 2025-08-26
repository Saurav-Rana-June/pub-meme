import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final scrollController = ScrollController();
  RxBool isCreationSelected = true.obs;
  var isHeaderVisible = true.obs;

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
      if (scrollController.offset > 0 && isHeaderVisible.value) {
        isHeaderVisible.value = false;
      } else if (scrollController.offset <= 0 && !isHeaderVisible.value) {
        isHeaderVisible.value = true;
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
