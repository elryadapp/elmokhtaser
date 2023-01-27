part of 'connectivity_bloc_cubit.dart';

@immutable
abstract class ConnectivityCubitState {}

class ConnectivityBlocInitial extends ConnectivityCubitState {}
class ConnectedState extends ConnectivityCubitState{}
class DisconnectedState extends ConnectivityCubitState{}
