
import 'package:elmokhtaser/core/components/app_btn.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTabBar extends StatefulWidget {
  final TabController tabController;
  final List<String> tabTitlesList;
  final Function()?ontap;
  const CustomTabBar(
      {Key? key, required this.tabController, required this.tabTitlesList,  this.ontap})
      : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:2.h),
      child: TabBar(
          onTap: (index) {
            setState(() {});
            if(widget.ontap!=null){
                       widget.ontap!();
            }

          },
          isScrollable: true,
          physics: const BouncingScrollPhysics(),
          unselectedLabelColor: AppUi.colors.subTitleColor,
          labelColor: AppUi.colors.whiteColor,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppUi.colors.mainColor),
          labelPadding: EdgeInsets.zero,
          labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 10.sp),
          controller: widget.tabController,
          tabs: [
            ...widget.tabTitlesList.asMap().entries.map((e) => Padding(
                padding:  EdgeInsets.symmetric(horizontal:2.w),
              child: AppButton(
                border: e.key == widget.tabController.index
                    ? Border.all(color: Colors.transparent)
                    : Border.all(color: AppUi.colors.borderColor),
                height: 5.h,
                width: 37.w,
                color: e.key == widget.tabController.index
                    ? Colors.transparent
                    : AppUi.colors.whiteColor,
                titleWidget: Tab(
                  text:e.value,
                ),
              ),
            ))
          ]),
    );
  }
}
