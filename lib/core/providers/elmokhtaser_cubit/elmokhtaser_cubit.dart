import 'package:bloc/bloc.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/data/models/main_models/images_model.dart';
import 'package:elmokhtaser/data/repositories/app_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'elmokhtaser_state.dart';

class ElmokhtaserCubit extends Cubit<ElmokhtaserState> {
  ElmokhtaserCubit() : super(ElmokhtaserState());
  static ElmokhtaserCubit get(context) => BlocProvider.of(context);
  Future<void> getAllImages(context) async {
    emit(state.copyWith(getAppImagesStates: GetAppImagesStates.lodaing));
    try {
      var res = await AppRepo.getAppImages();
      if (res['status'] < 300) {
        ElmokhtaserImageModel imageModel = ElmokhtaserImageModel.fromJson(res);

        emit(state.copyWith(
            getAppImagesStates: GetAppImagesStates.succsse,
            elmokhtaserImageModel: imageModel));
      } else {
        AppUtil.flushbarNotification(res['data']);
        emit(state.copyWith(getAppImagesStates: GetAppImagesStates.failure));
      }
    } catch (error) {
      emit(state.copyWith(getAppImagesStates: GetAppImagesStates.failure));
    }
  }
}
