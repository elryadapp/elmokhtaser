import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class TextBtnRow extends StatelessWidget {
  final String title;
  final Widget icon;
  const TextBtnRow({ Key? key, required this.title, required this.icon }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 5,),
        AppText(title,height: 3,fontSize: 10.sp,),
       

      ],
    );
  }
}