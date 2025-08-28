import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class CreateController extends GetxController {
  var assets = <AssetEntity>[].obs;
  var selected = Rxn<AssetEntity>();

  @override
  void onInit() {
    super.onInit();
    _loadImages();
  }

  Future<void> _loadImages() async {
    final permission = await PhotoManager.requestPermissionExtend();
    if (permission.isAuth) {
      // fetch albums
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
      );

      if (albums.isNotEmpty) {
        // fetch images from first album (usually "Recent")
        final photos = await albums[0].getAssetListPaged(page: 0, size: 100);
        assets.assignAll(photos);
      }
    } else {
      PhotoManager.openSetting();
    }
  }

  void selectImage(AssetEntity asset) {
    selected.value = asset;
  }
}
