import 'package:get/get.dart';

import '../../../../presentation/postDetail/controllers/post_detail.controller.dart';

class PostDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostDetailController>(
      () => PostDetailController(),
    );
  }
}
