part of 'elmokhtaser_cubit.dart';

enum GetAppImagesStates { initial, lodaing, succsse, failure }

class ElmokhtaserState {
  final String? exception;
  final ElmokhtaserImageModel? elmokhtaserImageModel;
  final GetAppImagesStates getAppImagesStates;

  ElmokhtaserState(
      {this.exception,
      this.elmokhtaserImageModel,
      this.getAppImagesStates = GetAppImagesStates.initial});
  ElmokhtaserState copyWith(
      {String? exception,
      ElmokhtaserImageModel? elmokhtaserImageModel,
      GetAppImagesStates? getAppImagesStates}) {
    return ElmokhtaserState(
        exception: exception ?? this.exception,
        elmokhtaserImageModel:
            elmokhtaserImageModel ?? this.elmokhtaserImageModel,
        getAppImagesStates: getAppImagesStates ?? this.getAppImagesStates);
  }
}
