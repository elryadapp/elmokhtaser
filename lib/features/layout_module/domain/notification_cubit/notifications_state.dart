part of 'notifications_cubit.dart';

enum GetNotificationsStates { initial, loading, success, failure }

enum MarkNotificationAsReadedStates { initial, loading, success, failure }

class NotificationsState {
  final String? exception;
  final GetNotificationsStates getNotificationsStates;
  final MarkNotificationAsReadedStates markNotificationAsReadedStates;
  final NotificationModel? notificationModel;

  NotificationsState({
    this.exception,
    this.getNotificationsStates = GetNotificationsStates.initial,
    this.markNotificationAsReadedStates =
        MarkNotificationAsReadedStates.initial,
    this.notificationModel,
  });
  NotificationsState copyWith({
    String? exception,
    GetNotificationsStates? getNotificationsStates,
    MarkNotificationAsReadedStates? markNotificationAsReadedStates,
    NotificationModel? notificationModel,
  }) {
    return NotificationsState(
      exception: exception ?? this.exception,
      getNotificationsStates:
          getNotificationsStates ?? this.getNotificationsStates,
      markNotificationAsReadedStates:
          markNotificationAsReadedStates ?? this.markNotificationAsReadedStates,
      notificationModel: notificationModel ?? this.notificationModel,
    );
  }
}
