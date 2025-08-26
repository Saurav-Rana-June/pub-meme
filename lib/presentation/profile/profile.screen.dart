import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:pub_meme/data/enums/spacing_enum.dart';
import 'package:pub_meme/data/extensions/spacing_extension.dart';
import 'package:pub_meme/infrastructure/theme/icons.dart';
import 'package:pub_meme/infrastructure/theme/theme.dart';

import 'controllers/profile.controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    axisAlignment: -1.0,
                    child: child,
                  );
                },
                child:
                    controller.isHeaderVisible.value
                        ? Column(
                          key: ValueKey("header"),
                          children: [
                            PreferredSize(
                              preferredSize: const Size.fromHeight(43),
                              child: SizedBox(
                                height: 43,
                                child: buildAppbarSection(),
                              ),
                            ),
                            buildProfileDetailsSection(context),
                          ],
                        )
                        : const SizedBox.shrink(key: ValueKey("empty")),
              ),
            ),

            Expanded(
              child: Obx(
                () => AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  alignment:
                      controller.isHeaderVisible.value
                          ? Alignment.topCenter
                          : Alignment.center,
                  child: buildProfileContentSection(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomScrollView buildProfileContentSection(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      controller: controller.scrollController,
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 48,
          surfaceTintColor: Colors.transparent,
          title: buildProfileContentTabs(context),
        ),

        Obx(
          () =>
              controller.isCreationSelected.value
                  ? buildCreationSection()
                  : buildSavedSection(),
        ),
      ],
    );
  }

  SliverPadding buildSavedSection() {
    return SliverPadding(
      padding: EdgeInsets.only(
        right: Spacing.s16.value,
        left: Spacing.s16.value,
        top: Spacing.s20.value,
      ),
      sliver: SliverMasonryGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childCount: 3,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(controller.images[index], fit: BoxFit.cover),
          );
        },
      ),
    );
  }

  SliverPadding buildCreationSection() {
    return SliverPadding(
      padding: EdgeInsets.only(
        right: Spacing.s16.value,
        left: Spacing.s16.value,
        top: Spacing.s20.value,
      ),
      sliver: SliverMasonryGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childCount: controller.images.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(controller.images[index], fit: BoxFit.cover),
          );
        },
      ),
    );
  }

  Container buildProfileContentTabs(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Obx(
            () => Visibility(
              visible: controller.isHeaderVisible.value ? false : true,
              child: Row(
                children: [
                  Spacing.s8.w,
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: secondary,
                    child: Text(
                      "S",
                      style: r12.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Spacing.s40.w,
                  Spacing.s8.w,
                ],
              ),
            ),
          ),

          Obx(
            () => GestureDetector(
              onTap: () {
                controller.isCreationSelected.value = true;
              },
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                margin: EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                  border:
                      controller.isCreationSelected.value
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
                          : Border(
                            bottom: BorderSide(
                              width: 1.8,
                              color: Colors.transparent,
                            ),
                          ),
                ),
                child: Text(
                  "Creation",
                  style: r16.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),

          Obx(
            () => GestureDetector(
              onTap: () {
                controller.isCreationSelected.value = false;
              },
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                margin: EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                  border:
                      controller.isCreationSelected.value == false
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
                          : Border(
                            bottom: BorderSide(
                              width: 1.8,
                              color: Colors.transparent,
                            ),
                          ),
                ),
                child: Text(
                  "Saved",
                  style: r16.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildProfileDetailsSection(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Spacing.s16.value),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: secondary,
                    child: Text(
                      "S",
                      style: h1.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Spacing.s16.w,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Saurav Rana",
                          style: r20.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "sauravsevenjune@gmail.com",
                          style: r12.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).textTheme.bodySmall?.color
                                ?.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacing.s12.h,
              Row(
                children: [
                  Text(
                    "0 Followers",
                    style: r12.copyWith(fontWeight: FontWeight.w300),
                  ),
                  Spacing.s8.w,
                  Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  Spacing.s8.w,
                  Text(
                    "5 Followings",
                    style: r12.copyWith(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ],
          ),
        ),
        Spacing.s32.h,
      ],
    );
  }

  Container buildAppbarSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Spacing.s16.value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {},
            child: Text(
              share_nodes,
              style: TextStyle(fontFamily: 'FontAwesomeLight', fontSize: 24),
            ),
          ),
          Spacing.s24.w,
          GestureDetector(
            onTap: () {},
            child: Text(
              circle_ellipsis_vertical,
              style: TextStyle(fontFamily: 'FontAwesomeLight', fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
