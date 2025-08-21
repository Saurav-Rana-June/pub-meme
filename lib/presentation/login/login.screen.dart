import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pub_meme/data/enums/spacing_enum.dart';
import 'package:pub_meme/data/extensions/spacing_extension.dart';
import 'package:pub_meme/infrastructure/theme/theme.dart';
import 'package:pub_meme/widgets/buttons/custom_outline_button.widget.dart';
import 'package:pub_meme/widgets/buttons/custom_primary_button.widget.dart';
import 'package:pub_meme/widgets/form_fields/custom_textfield.widget.dart';

import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [buildBannerSection(), buildLoginForm(context)],
        ),
      ),
    );
  }

  Container buildBannerSection() {
    return Container(
      width: Get.width,
      height: Get.height,
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.s8.symmetric.horizontal,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              buildBannerImageTile(
                Get.width / 3.5,
                170,
                'assets/images/meme-1.png',
              ),
              buildBannerImageTile(
                Get.width / 3.5,
                120,
                'assets/images/meme-2.jpg',
              ),
              buildBannerImageTile(
                Get.width / 3.5,
                120,
                'assets/images/meme-3.jpg',
              ),
            ],
          ),
          Column(
            children: [
              buildBannerImageTile(
                Get.width / 3.5,
                120,
                'assets/images/meme-4.jpg',
              ),
              buildBannerImageTile(
                Get.width / 3.5,
                170,
                'assets/images/meme-5.png',
              ),
            ],
          ),
          Column(
            children: [
              buildBannerImageTile(
                Get.width / 3.5,
                120,
                'assets/images/meme-6.jpeg',
              ),
              buildBannerImageTile(
                Get.width / 3.5,
                120,
                'assets/images/meme-7.jpg',
              ),
              buildBannerImageTile(
                Get.width / 3.5,
                120,
                'assets/images/meme-8.jpg',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Opacity buildBannerImageTile(double width, double height, String image) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.only(bottom: Spacing.s8.value),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
      ),
    );
  }

  IntrinsicHeight buildLoginForm(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(
          horizontal: Spacing.s24.symmetric.horizontal,
          vertical: Spacing.s24.symmetric.vertical,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.0),
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).scaffoldBackgroundColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              child: Image.asset('assets/logo/logo.png'),
            ),
            Spacing.s4.h,

            CustomTextFormField(
              controller: TextEditingController(),
              hintText: "Email address",
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) return "Email is required";
                if (!value.contains("@")) return "Enter a valid email";
                return null;
              },
            ),
            Spacing.s12.h,

            CustomPrimaryButton(
              text: "Login",
              borderRadius: 12,
              height: 35,
              backgroundColor: secondaryColor,
              onPressed: () {},
            ),
            Spacing.s32.h,

            CustomOutlineButton(
              text: "Continue with Google",
              height: 45,
              borderRadius: 15,
              prefixIcon: Container(
                width: 20,
                height: 20,
                child: Image.asset('assets/logo/google_logo.png'),
              ),
              borderColor: Theme.of(context).dividerColor,
              textColor: Theme.of(context).dividerColor,
              onPressed: () {},
            ),
            Spacing.s12.h,
            CustomOutlineButton(
              text: "Continue as a Guest",
              height: 45,
              borderRadius: 15,
              prefixIcon: Container(
                width: 20,
                height: 20,
                child: Image.asset('assets/logo/guest_logo.png'),
              ),
              borderColor: Theme.of(context).dividerColor,
              textColor: Theme.of(context).dividerColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
