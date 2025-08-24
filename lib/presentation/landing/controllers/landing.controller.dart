import 'package:get/get.dart';
import 'package:pub_meme/presentation/screens.dart';

class LandingController extends GetxController {
  RxInt currentIndex = 0.obs;

  final screens = [HomeScreen(), HomeScreen(), HomeScreen(), HomeScreen()];

  void toggleScreen(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
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
