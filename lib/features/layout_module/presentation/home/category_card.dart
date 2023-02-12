import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String img;
  final Function() onTab;
  const CategoryCard(
      {Key? key, required this.title, required this.img, required this.onTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(img),
              const SizedBox(
                height: 10,
              ),
              AppText(title)
            ],
          ),
        ),
      ),
    );
  }
}
