import 'package:elmokhtaser/features/auth_module/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';





class BlocProviders {
  static List<BlocProvider> providers(BuildContext context) => [
      // BlocProvider(create: (context) => PaymentCubit()..getAllCoupons()),
      //   BlocProvider(create: (context) => ContestCubit()..getAllContest()),
      //   BlocProvider(create: (context) => ChatCubit()),
      //   BlocProvider(
      //     create: (context) => NotificationCubit(),
      //   ),
      //      BlocProvider(
      //     create: (context) => ConnectivityCubit(),
      //   ),
      //   BlocProvider(create: (context) => CartCubit()),
      //   BlocProvider(create: (context) => TestsCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        // BlocProvider(create: (context) => LayoutCubit()),
        // BlocProvider(create: (context) => CoursesCubit()),
        // BlocProvider(create: (context) => ProfileCubit()),
        // BlocProvider(create: (context) => ServicesCubit())
         
      ];
}
