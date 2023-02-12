import 'package:sizer/sizer.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:flutter/material.dart';

class RowBtn extends StatelessWidget {
  final String route;
  final String title;
  final int? newsId;
  final dynamic args;
  final bool? isIos;
  const RowBtn(
      {Key? key,
      required this.route,
      required this.title,
      this.isIos = false,
      this.newsId,
      this.args})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, route, arguments: newsId ?? args);
          },
          child: AppText(
            title,
            color: AppUi.colors.mainColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Icon(
          isIos! ? Icons.arrow_forward_ios : Icons.arrow_forward,
          color: AppUi.colors.mainColor,
          size: 4.w,
        ),
      ],
    );
  }
}
