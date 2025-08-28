import 'package:get/get.dart';

import '../../../../presentation/create/controllers/create.controller.dart';

class CreateControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateController>(
      () => CreateController(),
    );
  }
}
