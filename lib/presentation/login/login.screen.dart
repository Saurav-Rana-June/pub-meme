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
        child: Container(
          width: Get.width,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Spacing.s24.symmetric.horizontal,
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
                    if (value == null || value.isEmpty)
                      return "Email is required";
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
                  onPressed: () {
                    // Handle cancel
                  },
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
                  onPressed: () {
                    // Handle cancel
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
