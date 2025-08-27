import 'package:get/get.dart';
import 'package:pub_meme/data/models/categories.model.dart';

class HomeController extends GetxController {
  RxBool isLiked = false.obs;

  RxInt selectedCategoriesId = 1.obs;

  RxList<CategoryModel> categories =
      <CategoryModel>[
        CategoryModel(id: 1, name: "Dank", key: "dank"),
        CategoryModel(id: 2, name: "Wholesome", key: "wholesome"),
        CategoryModel(id: 3, name: "Dark Humor", key: "dark_humor"),
        CategoryModel(id: 4, name: "Relatable", key: "relatable"),
        CategoryModel(id: 5, name: "Gaming", key: "gaming"),
        CategoryModel(id: 6, name: "Anime", key: "anime"),
        CategoryModel(id: 7, name: "Sports", key: "sports"),
        CategoryModel(id: 8, name: "Politics", key: "politics"),
        CategoryModel(id: 9, name: "Animals", key: "animals"),
        CategoryModel(id: 10, name: "Movies", key: "movies"),
      ].obs;

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
