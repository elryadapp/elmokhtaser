import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/core/utils/icon_broken.dart';
import 'package:elmokhtaser/data/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class NotificationItem extends StatelessWidget {
  final NotificationItemModel notificationItemModel;
  const NotificationItem({Key? key, required this.notificationItemModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: .2.h, horizontal: 2.w),
      child: Card(
        color: notificationItemModel.readAt != null
            ? AppUi.colors.whiteColor
            : AppUi.colors.btnBgColor,
        child: Padding(
          padding: EdgeInsets.all(3.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                IconBroken.Notification,
                color: Colors.amber,
                size: 5.h,
              ),
              SizedBox(
                width: 2.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      notificationItemModel.type == 'activate_certificate'
                          ? 'activate_certificate'.tr()
                          : notificationItemModel.type ==
                                  'activate_subscribtion'
                              ? 'activate_subscribtion'.tr()
                              : notificationItemModel.type ==
                                      'un_activate_certificate'
                                  ? 'cancel_certificate'.tr()
                                  : notificationItemModel.type ==
                                          'un_activate_subscribtion'
                                      ? 'un_activate_subscribtion'.tr()
                                      : '',
                      color: AppUi.colors.mainColor,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: AppText(
                        notificationItemModel.course!,
                        color: AppUi.colors.subTitleColor.withOpacity(.5),
                      ),
                    ),
                    AppText(
                      '${DateTime.parse(notificationItemModel.createdAt!).toString().substring(0, 10)} ',
                      color: AppUi.colors.subTitleColor.withOpacity(.6),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
