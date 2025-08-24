import 'package:flutter/material.dart';
import 'package:pub_meme/infrastructure/theme/theme.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double? height;
  final Color? borderColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final double borderRadius;
  final double borderWidth;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? padding;
  final Color? disabledColor;

  const CustomOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.width,
    this.height,
    this.borderColor,
    this.textColor,
    this.textStyle,
    this.borderRadius = 12,
    this.borderWidth = 1.5,
    this.prefixIcon,
    this.suffixIcon,
    this.padding,
    this.disabledColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 48,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
          side: BorderSide(
            color: borderColor ?? Theme.of(context).primaryColor,
            width: borderWidth,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          disabledForegroundColor: disabledColor ?? Colors.grey,
        ),
        child:
            isLoading
                ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      borderColor ?? Theme.of(context).primaryColor,
                    ),
                  ),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (prefixIcon != null) ...[
                      prefixIcon!,
                      const SizedBox(width: 10),
                    ],
                    Text(
                      text,
                      style:
                          textStyle ??
                          r14.copyWith(
                            fontWeight: FontWeight.w500,
                            color:
                                textColor ??
                                borderColor ??
                                Theme.of(context).primaryColor,
                          ),
                    ),
                    if (suffixIcon != null) ...[
                      const SizedBox(width: 8),
                      suffixIcon!,
                    ],
                  ],
                ),
      ),
    );
  }
}
