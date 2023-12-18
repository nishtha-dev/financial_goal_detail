import 'package:financial_goal_detail/src/core/constants/app_colors.dart';
import 'package:financial_goal_detail/src/core/theme/app_style_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextSmallBold extends StatelessWidget {
  final String? text;
  final String? keyName;
  final Color? color;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  const TextSmallBold({
    this.text,
    super.key,
    this.color,
    this.keyName,
    this.overflow,
    this.textAlign,
  }) : assert(text != null || keyName != null);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
              color: color ?? AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500)
          .lineHeight(21.sp),
      overflow: overflow ?? TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.justify,
    );
  }
}
