import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/core/network/local/cache_helper.dart';
import 'package:elmokhtaser/core/utils/constants.dart';
import 'package:elmokhtaser/features/layout_module/data/models/about_model.dart';
import 'package:elmokhtaser/features/layout_module/data/models/news_model.dart';
import 'package:elmokhtaser/features/layout_module/data/models/teames_model.dart';
import 'package:elmokhtaser/features/layout_module/data/models/termes_model.dart';
import 'package:elmokhtaser/features/layout_module/data/repos/services_repo.dart';
import 'package:elmokhtaser/features/layout_module/domain/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceState());
  static ServiceCubit get(context) => BlocProvider.of(context);

  void changeLang(langCode, context) async {
    context.setLocale(Locale(langCode));
    Constants.lang = context.locale.toString();

    emit(state.copyWith(isLangExpanded: false));

    await CacheHelper.assignData(
        key: 'lang', value: Locale(langCode).toString());
    LayoutCubit.get(context).changeCurrentPageIndex(4);
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.layout, ModalRoute.withName('/'));
  }

  void changeLangExpanedState(val) {
    emit(state.copyWith(isLangExpanded: val));
  }

//================================about data=========================================

  Future<void> getAboutData() async {
    emit(state.copyWith(getAboutDataStates: GetAboutDataStates.loading));
    try {
      var aboutRes = await ServicesRepo.getAboutData();
      var teamRes = await ServicesRepo.getTeamsData();
      var aboutModel = AboutModel.fromJson(aboutRes);

      var teamModel = TeamsModel.fromJson(teamRes);

      emit(state.copyWith(
        getAboutDataStates: GetAboutDataStates.success,
        aboutModel: aboutModel,
        teamsModel: teamModel,
      ));
    } catch (error) {
      emit(state.copyWith(getAboutDataStates: GetAboutDataStates.failure));
    }
  }

//======================================termes data=============================================

  Future<void> getTermesData() async {
    emit(state.copyWith(
        getTermesAndConditionStates: GetTermesAndConditionStates.loading));
    try {
      var res = await ServicesRepo.getTermesData();

      var termsAndConditionModel = TermsAndConditionModel.fromJson(res);
      emit(state.copyWith(
        getTermesAndConditionStates: GetTermesAndConditionStates.success,
        termsAndConditionModel: termsAndConditionModel,
      ));
    } catch (error) {
      emit(state.copyWith(
          getTermesAndConditionStates: GetTermesAndConditionStates.failure));
    }
  }
//===================================privacy data============================

  Future<void> getPrivacyData() async {
    emit(state.copyWith(
        getTermesAndConditionStates: GetTermesAndConditionStates.loading));
    try {
      var res = await ServicesRepo.getPrivacyData();

      var privacy = TermsAndConditionModel.fromJson(res);
      emit(state.copyWith(
        getTermesAndConditionStates: GetTermesAndConditionStates.success,
        termsAndConditionModel: privacy,
      ));
    } catch (error) {
      emit(state.copyWith(
          getTermesAndConditionStates: GetTermesAndConditionStates.failure));
    }
  }

  //=========================news ==============================================

  Future<void> getAllNewsData({page = 1}) async {
    if (page == 1) {
      emit(
        state.copyWith(
          getNewsStates: GetNewsStates.loading,
          newsModel: null,
        ),
      );
    } else {
      emit(state.copyWith(getNewsStates: GetNewsStates.paginationLoading));
    }
    try {
      var res = await ServicesRepo.getAllNewsData(page: page);

      var newsModel = NewsModel.fromJson(res);
      emit(state.copyWith(
        getNewsStates: GetNewsStates.success,
        newsModel: newsModel,
      ));
    } catch (error) {
      emit(state.copyWith(
        getNewsStates: GetNewsStates.failure,
      ));
    }
  }

  Future<void> getSingleNewsData(
    id,
  ) async {
    emit(state.copyWith(getSingleNewsStates: GetSingleNewsStates.loading));
    try {
      var res = await ServicesRepo.getSingleNewsData(
        id,
      );

      var singleNewsModel = NewsItem.fromJson(res['data']);
      emit(
        state.copyWith(
          getSingleNewsStates: GetSingleNewsStates.success,
          newsItem: singleNewsModel,
        ),
      );
    } catch (error) {
      emit(state.copyWith(getSingleNewsStates: GetSingleNewsStates.failure));
    }
  }

//===================user Logout==================

  Future<void> userLogout(context) async {
    emit(state.copyWith(logoutStates: LogoutStates.loading));

    try {
      var res = await ServicesRepo.userLogOut();
      if (res['data'] != null) {
        CacheHelper.clearCache(key: 'jwt');
        CacheHelper.clearCache(key: 'user_name');

        Constants.token = '';
        Constants.userName = '';
        LayoutCubit.get(context).changeCurrentPageIndex(0);
        Navigator.pushReplacementNamed(context, Routes.login);
        emit(state.copyWith(logoutStates: LogoutStates.success));
      }
    } catch (error) {
      emit(state.copyWith(logoutStates: LogoutStates.failure));
    }
  }
}
