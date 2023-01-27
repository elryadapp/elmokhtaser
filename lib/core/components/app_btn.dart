
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class AppButton extends StatelessWidget {
  final Function? onTap;
  final String? title;
  final Widget? titleWidget;
  final Color? color, titleColor;
  final double? width, height, fontSize ;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  const AppButton(
      {Key? key, this.onTap,
      this.color,
      this.titleColor ,
      this.title,
      this.height,
      this.width,
      this.fontSize ,
      this.borderRadius,
      this.titleWidget, this.border }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Container(
        width: width ?? Constants.getwidth(context),
        height: height ?? 6.h,
        decoration: BoxDecoration(
             gradient:  LinearGradient(colors: [
                       color??  const Color(0xff00678A),
                         color??const Color(0xff29B4E3),
                      ]),
          color: color??AppUi.colors.mainColor ,
          border: border,
          borderRadius: borderRadius ?? BorderRadius.circular(5.0),
        ),
        child: Center(
            child: title == null
                ? titleWidget
                : AppText(
                    title!,

                    fontSize: fontSize??12.sp,
                    fontWeight: FontWeight.bold,
                    color: titleColor??AppUi.colors.whiteColor,
                  )),
      ),
    );
  }
}
