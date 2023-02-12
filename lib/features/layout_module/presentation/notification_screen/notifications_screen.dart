import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/core/components/animated_list_handler.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/features/layout_module/domain/layout_cubit/layout_cubit.dart';
import 'package:elmokhtaser/features/layout_module/domain/notification_cubit/notifications_cubit.dart';
import 'package:elmokhtaser/features/layout_module/domain/services_cubit/service_cubit.dart';
import 'package:elmokhtaser/features/layout_module/presentation/notification_screen/components/empty_notification.dart';
import 'package:elmokhtaser/features/layout_module/presentation/notification_screen/components/notification_item.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  void initState() {
    NotificationsCubit.get(context).getUserNotification(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        var cubit = NotificationsCubit.get(context);
        switch (state.getNotificationsStates) {
          case GetNotificationsStates.loading:
            return AppUtil.appLoader();
          case GetNotificationsStates.success:
            if (state.notificationModel!.data!.isEmpty) {
              return const EmptyNotification();
            } else {
              return AnimatedListHandler(
                  children: List.generate(
                      state.notificationModel!.data!.length,
                      (index) => InkWell(
                            onTap: () {
                              cubit.markNotificationAsReaded(
                                  state.notificationModel!.data![index],
                                  context);
                              if (state.notificationModel!.data![index].type!
                                      .split('_')
                                      .last ==
                                  'certificate') {
                                Navigator.pushNamed(
                                    context, Routes.certificate);
                              } else {
                                LayoutCubit.get(context)
                                    .changeCurrentPageIndex(1);

                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  Routes.layout,
                                  (route) => false,
                                );
                              }
                            },
                            child: NotificationItem(
                              notificationItemModel:
                                  state.notificationModel!.data![index],
                            ),
                          )));
            }
          default:
            if (state.notificationModel!.data!.isEmpty) {
              return const EmptyNotification();
            } else {
              return AnimatedListHandler(
                  children: List.generate(
                      state.notificationModel!.data!.length,
                      (index) => InkWell(
                            onTap: () {
                              cubit.markNotificationAsReaded(
                                  state.notificationModel!.data![index],
                                  context);
                              if (state.notificationModel!.data![index].type!
                                      .split('_')
                                      .last ==
                                  'certificate') {
                                Navigator.pushNamed(
                                    context, Routes.certificate);
                              } else {
                                LayoutCubit.get(context)
                                    .changeCurrentPageIndex(1);

                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  Routes.layout,
                                  (route) => false,
                                );
                              }
                            },
                            child: NotificationItem(
                              notificationItemModel:
                                  state.notificationModel!.data![index],
                            ),
                          )));
            }
        }
      },
    );
  }
}
