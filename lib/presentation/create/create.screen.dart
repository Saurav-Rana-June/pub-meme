import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/src/types/entity.dart';
import 'package:pub_meme/data/enums/spacing_enum.dart';
import 'package:pub_meme/data/extensions/spacing_extension.dart';
import 'package:pub_meme/infrastructure/theme/icons.dart';
import 'package:pub_meme/infrastructure/theme/theme.dart';
import 'package:pub_meme/presentation/create/controllers/create.controller.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class CreateScreen extends GetView<CreateController> {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateController());

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.assets.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return buildSelectImageSection(controller);
        }),
      ),
    );
  }

  Container buildSelectImageSection(CreateController controller) {
    return Container(
      padding: EdgeInsets.only(right: Spacing.s12.value, left: Spacing.s20.value),
      child: Column(
        children: [
          buildTopBarSection(),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 8,
              ),
              itemCount: controller.assets.length,
              itemBuilder: (context, index) {
                final asset = controller.assets[index];
                return buildImageHolderTile(controller, asset);
              },
            ),
          ),
        ],
      ),
    );
  }

  Row buildTopBarSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: Spacing.s16.value),
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.s16.value,
            vertical: Spacing.s8.value,
          ),
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text(
                "Next",
                style: r14.copyWith(fontWeight: FontWeight.w400, color: white),
              ),
              Spacing.s4.w,
              Text(
                angle_right,
                style: TextStyle(
                  fontFamily: 'FontAwesomeSolid',
                  fontSize: 12,
                  color: white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  GestureDetector buildImageHolderTile(
    CreateController controller,
    AssetEntity asset,
  ) {
    return GestureDetector(
      onTap: () => controller.selectImage(asset),
      child: Stack(
        children: [
          Obx(
            () => Container(
              height: 250,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border:
                    controller.selected.value == asset
                        ? Border.all(color: primary, width: 3)
                        : null,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: AssetEntityImage(
                  asset,
                  fit: BoxFit.cover,
                  isOriginal: false,
                ),
              ),
            ),
          ),
          Obx(() {
            return controller.selected.value == asset
                ? Container(
                  padding: EdgeInsets.symmetric(horizontal: Spacing.s4.value),
                  child: Text(
                    circle_check,
                    style: TextStyle(
                      fontFamily: 'FontAwesomeSolid',
                      fontSize: 24,
                      color: primary,
                    ),
                  ),
                )
                : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
