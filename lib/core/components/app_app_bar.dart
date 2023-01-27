import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ElmoktaserAppbar extends AppBar {
  ElmoktaserAppbar(
    context, {
    Key? key,
    bool? isTitleCenterd,
    Widget? leading,
    bool? isLeading = true,
    Color? leadingIconColor,
    Color? backIconColor,
    Widget? title,
    bool? showMenu,
    Widget? flexibleSpace,
    String? titleText,
    List<Widget>? actions,
    void Function()? onActionTap,
    PreferredSizeWidget? bottom,
    Color? backgroundColor,
  }) : super(
          key: key,
          leadingWidth: isLeading! ? 12.w : 0,
          bottom: bottom,
          leading: leading ??
              (isLeading
                  ? IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ))
                  : Container()),
          title: title ??
              AppText(
                titleText ?? '',
                color: AppUi.colors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                textOverflow: TextOverflow.visible,
              ),
          actions: actions ??
              [
               InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.card)
                              .then((value) {});
                        },
                        child: Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: [
                            Image.asset(AppUi.assets.cardIcon),
                            // BlocBuilder<CartCubit, CartState>(
                            //   builder: (context, state) {
                            //     return CircleAvatar(
                            //       radius: 2.5.w,
                            //       child: AppText(
                            //         '${CartCubit.get(context).cartItemList.length}',
                            //         fontSize: 8.sp,
                            //         textAlign: TextAlign.center,
                            //         color: CartCubit.get(context)
                            //                 .cartItemList
                            //                 .isNotEmpty
                            //             ? AppUi.colors.whiteColor
                            //             : Colors.transparent,
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            //       backgroundColor: CartCubit.get(context)
                            //               .cartItemList
                            //               .isNotEmpty
                            //           ? AppUi.colors.buttonColor
                            //           : Colors.transparent,
                            //     );
                            //   },
                            // ),
                           
                          ],
                        ),
                      ),

                      //  if (LayoutCubit.get(context).currentPageIndex != 2)
                      //         InkWell(
                      //           onTap: () {
                      //             LayoutCubit.get(context)
                      //                 .changeCurrentPageIndex(2);
                      //             Navigator.pushNamed(context, Routes.layout);
                      //           },
                      //           child: Stack(
                      //             alignment: AlignmentDirectional.topStart,
                      //             children: [
                      //               Lottie.asset(
                      //                 AppUi.assets.lottieNotification,
                      //                 height: 6.h,
                      //                 controller: NotificationHelper.controller,
                      //                 onLoaded: (composition) {
                      //                   NotificationHelper
                      //                           .controller!.duration =
                      //                       const Duration(milliseconds: 500);
                      //                 },
                      //               ),
                      //               PositionedDirectional(
                      //                 start: 1.5.w,
                      //                 top: .5.h,
                      //                 child: BlocBuilder<NotificationCubit,
                      //                     NotificationState>(
                      //                   builder: (context, state) {
                      //                     return CircleAvatar(
                      //                       radius: 2.5.w,
                      //                       child: AppText(
                      //                         '${NotificationCubit.get(context).unreadedNotification.length}',
                      //                         fontSize: 8.sp,
                      //                         textAlign: TextAlign.center,
                      //                         color:
                      //                             NotificationCubit.get(context)
                      //                                     .unreadedNotification
                      //                                     .isNotEmpty
                      //                                 ? AppUi.colors.whiteColor
                      //                                 : Colors.transparent,
                      //                         fontWeight: FontWeight.w600,
                      //                       ),
                      //                       backgroundColor:
                      //                           NotificationCubit.get(context)
                      //                                   .unreadedNotification
                      //                                   .isNotEmpty
                      //                               ? AppUi.colors.buttonColor
                      //                               : Colors.transparent,
                      //                     );
                      //                   },
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
              ],
          centerTitle: isTitleCenterd ?? true,
          flexibleSpace: flexibleSpace,
          elevation: 0.0,
        );
}
