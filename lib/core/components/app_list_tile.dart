
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppListTile extends StatefulWidget {
  final String title;
  final Widget content;
  const AppListTile(
      {Key? key,
     
      required this.title,
      required this.content})
      : super(key: key);

  @override
  State<AppListTile> createState() => _AppListTileState();
}

class _AppListTileState extends State<AppListTile> {
    Widget trailingIcon = Icon(
      Icons.add,
      color: AppUi.colors.subTitleColor,
    );
   bool isExpanded=false;
  @override
  Widget build(BuildContext context) {
  
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: Theme(
           data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            
              trailing: Transform.rotate(
                            angle: isExpanded ? 80 : 0,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: isExpanded
                                  ? AppUi.colors.mainColor
                                  : AppUi.colors.subTitleColor,
                              size: 2.h,
                            )),
              
              onExpansionChanged: (val) {
                isExpanded=val;
                if (isExpanded) {
                  trailingIcon = Icon(
                    Icons.remove,
                    color: AppUi.colors.mainColor,
                  );
                  setState(() {});
                } else {
                  trailingIcon = Icon(
                    Icons.add,
                    color: AppUi.colors.subTitleColor,
                  );
                  setState(() {});
                }
              },
              childrenPadding:  EdgeInsets.symmetric(horizontal:5.w),
              title: AppText(widget.title,fontWeight: FontWeight.w600,fontSize: 13.sp,),
              children: [widget.content]),
        ));
  }
}
