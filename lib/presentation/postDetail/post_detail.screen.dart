import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:pub_meme/data/enums/spacing_enum.dart';
import 'package:pub_meme/data/extensions/spacing_extension.dart';
import 'package:pub_meme/infrastructure/theme/icons.dart';
import 'package:pub_meme/infrastructure/theme/theme.dart';

import 'controllers/post_detail.controller.dart';

class PostDetailScreen extends GetView<PostDetailController> {
  const PostDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  buildPostDetailsSection(context),
                  buildMoreToExploreSection(context),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Spacing.s16.value,
                top: Spacing.s8.value,
              ),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    primary.withValues(alpha: 0.5),
                  ),
                ),
                icon: Text(
                  chevron_left,
                  style: TextStyle(
                    fontFamily: 'FontAwesomeSolid',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomScrollView buildMoreToExploreSection(BuildContext context) {
    return CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 40,
          surfaceTintColor: Colors.transparent,
          title: Row(
            children: [
              Text(
                "More To Explore",
                style: r18.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),

        SliverPadding(
          padding: EdgeInsets.only(
            right: Spacing.s16.value,
            left: Spacing.s16.value,
            top: Spacing.s8.value,
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
        ),
      ],
    );
  }

  Column buildPostDetailsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDetailedImageViewSection(),
        Spacing.s16.h,
        buildPostedByUserDetailsSection(context),
        Spacing.s24.h,
      ],
    );
  }

  Padding buildPostedByUserDetailsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Spacing.s16.value),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: secondary,
            child: Text("S", style: r18.copyWith(fontWeight: FontWeight.w600)),
          ),
          Spacing.s8.w,
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Saurav Rana",
                      style: r16.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "5 Followings",
                      style: r12.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(
                          context,
                        ).textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Spacing.s16.value,
                    vertical: Spacing.s8.value,
                  ),
                  decoration: BoxDecoration(
                    color: primary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        user_plus,
                        style: TextStyle(
                          fontFamily: 'FontAwesomeLight',
                          fontSize: 12,
                          color: primary,
                        ),
                      ),
                      Spacing.s8.w,
                      Text(
                        "Follow",
                        style: r14.copyWith(
                          fontWeight: FontWeight.w400,
                          color: primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildDetailedImageViewSection() {
    return Column(
      children: [
        Container(
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: Spacing.s8.value),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/meme-1.png'),
          ),
        ),
        Spacing.s8.h,
        Container(
          padding: EdgeInsets.symmetric(horizontal: Spacing.s16.value),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          heart,
                          style: TextStyle(
                            fontFamily: 'FontAwesomeLight',
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Spacing.s8.w,
                      Text('3', style: r16.copyWith()),
                    ],
                  ),
                  Spacing.s20.w,
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          comment,
                          style: TextStyle(
                            fontFamily: 'FontAwesomeLight',
                            fontSize: 20,
                          ),
                        ),
                      ),
                      // Spacing.s8.w,
                      // Text('3', style: r16.copyWith()),
                    ],
                  ),
                  Spacing.s20.w,
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          share_nodes,
                          style: TextStyle(
                            fontFamily: 'FontAwesomeLight',
                            fontSize: 20,
                          ),
                        ),
                      ),
                      // Spacing.s8.w,
                      // Text('3', style: r16.copyWith()),
                    ],
                  ),
                ],
              ),

              GestureDetector(
                onTap: () {},
                child: Text(
                  circle_ellipsis_vertical,
                  style: TextStyle(
                    fontFamily: 'FontAwesomeLight',
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
