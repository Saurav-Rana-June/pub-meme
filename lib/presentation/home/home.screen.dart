import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:pub_meme/data/enums/spacing_enum.dart';
import 'package:pub_meme/data/extensions/spacing_extension.dart';
import 'package:pub_meme/data/models/categories.model.dart';
import 'package:pub_meme/infrastructure/theme/theme.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

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

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverFloatingHeader(
              child: PreferredSize(
                preferredSize: const Size.fromHeight(43),
                child: SizedBox(
                  height: 43,
                  child: buildCategoriesSection(context),
                ),
              ),
            ),
        
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverMasonryGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childCount: images.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(images[index], fit: BoxFit.cover),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildCategoriesSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Spacing.s12.value),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Obx(
            () => InkWell(
              onTap: () {
                controller.selectedCategoriesId.value =
                    controller.categories[index].id;
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 8),
                margin: EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                  border:
                      controller.selectedCategoriesId ==
                              controller.categories[index].id
                          ? Border(
                            bottom: BorderSide(
                              width: 1.8,
                              color:
                                  Theme.of(
                                    context,
                                  ).textTheme.bodyMedium?.color ??
                                  Colors.black,
                            ),
                          )
                          : null,
                ),
                child: Text(
                  controller.categories[index].name,
                  style: r16.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
