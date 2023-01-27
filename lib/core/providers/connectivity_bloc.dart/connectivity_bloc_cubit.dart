import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:easy_localization/easy_localization.dart';
part 'connectivity_bloc_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityCubitState> {
  ConnectivityCubit() : super(ConnectivityBlocInitial());
  static ConnectivityCubit get(context) => BlocProvider.of(context);
  final Connectivity connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  bool hasConnection = true;



  Future<void> checkConnection({required Connectivity connectivity}) async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      hasConnection = false;

      AppUtil.flushbarNotification('there_is_no_internet_connection'.tr());
      emit(DisconnectedState());
    } else {
      hasConnection = true;
      emit(ConnectedState());
    }
  }
}
