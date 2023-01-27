
import 'package:elmokhtaser/core/components/text_btn_row.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ExpandedList extends StatelessWidget {
  final List listItem;
final Widget? child;
  const ExpandedList({Key? key, required this.listItem, this.child, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        ...listItem.asMap().entries.map((e) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
               Padding(padding: EdgeInsetsDirectional.only(end: 4.w),
               child:  TextBtnRow(title: e.value, icon:child?? Image.asset(AppUi.assets.gradCap)),)
              
                    
              ],
            ))
      ],
    );
  }
}
