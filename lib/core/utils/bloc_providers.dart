import 'package:elmokhtaser/core/providers/connectivity_bloc.dart/connectivity_bloc_cubit.dart';
import 'package:elmokhtaser/core/providers/elmokhtaser_cubit/elmokhtaser_cubit.dart';
import 'package:elmokhtaser/features/auth_module/auth_cubit/auth_cubit.dart';
import 'package:elmokhtaser/features/layout_module/domain/layout_cubit/layout_cubit.dart';
import 'package:elmokhtaser/features/layout_module/domain/notification_cubit/notifications_cubit.dart';
import 'package:elmokhtaser/features/layout_module/domain/services_cubit/service_cubit.dart';
import 'package:elmokhtaser/features/layout_module/presentation/personal_courses_screens/domain/personal_courses_cubit/personal_courses_cubit.dart';
import 'package:elmokhtaser/features/profile_module/domain/cubits/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviders {
  static List<BlocProvider> providers(BuildContext context) => [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<ElmokhtaserCubit>(
          create: (context) => ElmokhtaserCubit(),
        ),
        BlocProvider<LayoutCubit>(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider<ServiceCubit>(
          create: (context) => ServiceCubit(),
        ),
        BlocProvider<NotificationsCubit>(
          create: (context) => NotificationsCubit(),
        ),
        BlocProvider<ConnectivityCubit>(
          create: (context) => ConnectivityCubit(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider<PersonalCoursesCubit>(
          create: (context) => PersonalCoursesCubit(),
        ),
      ];
}
