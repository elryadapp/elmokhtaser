import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/data/models/notification_model.dart';
import 'package:elmokhtaser/features/layout_module/data/repos/services_repo.dart';
import 'package:elmokhtaser/features/layout_module/presentation/notification_screen/components/notification_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsState());
  static NotificationsCubit get(context) => BlocProvider.of(context);
  //============get user notification====================
  List<NotificationItem> unreadedNotification = [];
  Future<void> getUserNotification(context) async {
    emit(state.copyWith(
      getNotificationsStates: GetNotificationsStates.loading,
      notificationModel: null,
    ));
    try {
      var res = await ServicesRepo.getUserNotifications();
      if (res['status'] < 300) {
        var notificationModel = NotificationModel.fromJson(res);
        for (var item in notificationModel.data ?? []) {
          if (item.readAt == null) {
            unreadedNotification.add(item);
          }
        }
        emit(state.copyWith(
            getNotificationsStates: GetNotificationsStates.success,
            notificationModel: notificationModel));
      } else {
        AppUtil.flushbarNotification(res['data']);
        emit(state.copyWith(
          getNotificationsStates: GetNotificationsStates.failure,
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        getNotificationsStates: GetNotificationsStates.failure,
      ));
    }
  }

  //=====================mark notification as readed==========

  Future<void> markNotificationAsReaded(
      NotificationItemModel notificationId, context) async {
    emit(state.copyWith(
        markNotificationAsReadedStates:
            MarkNotificationAsReadedStates.loading));
    try {
      await ServicesRepo.markNotificationAsReaded(notificationId.id);

      getUserNotification(context);
      emit(state.copyWith(
          markNotificationAsReadedStates:
              MarkNotificationAsReadedStates.success));
    } catch (error) {
      emit(state.copyWith(
          markNotificationAsReadedStates:
              MarkNotificationAsReadedStates.failure));
    }
  }
}
