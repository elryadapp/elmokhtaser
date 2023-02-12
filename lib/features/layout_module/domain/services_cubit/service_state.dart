part of 'service_cubit.dart';

enum GetAboutDataStates { initial, loading, success, failure }

enum GetTermesAndConditionStates { initial, loading, success, failure }

enum GetNewsStates { initial, loading, success, failure, paginationLoading }

enum GetSingleNewsStates { initial, loading, success, failure }

enum LogoutStates { initial, loading, success, failure, paginationLoading }

class ServiceState {
  final String? exception;
  final LogoutStates logoutStates;
  final GetAboutDataStates getAboutDataStates;
  final GetNewsStates getNewsStates;
  final GetSingleNewsStates getSingleNewsStates;
  final GetTermesAndConditionStates getTermesAndConditionStates;
  final int page;
  final bool isLangExpanded;
  final TermsAndConditionModel? termsAndConditionModel;
  final AboutModel? aboutModel;
  final TeamsModel? teamsModel;
  final NewsModel? newsModel;
  final NewsItem? newsItem;

  ServiceState({
    this.exception,
    this.logoutStates = LogoutStates.initial,
    this.getAboutDataStates = GetAboutDataStates.initial,
    this.getNewsStates = GetNewsStates.initial,
    this.getSingleNewsStates = GetSingleNewsStates.initial,
    this.getTermesAndConditionStates = GetTermesAndConditionStates.initial,
    this.page = 1,
    this.isLangExpanded = false,
    this.termsAndConditionModel,
    this.aboutModel,
    this.teamsModel,
    this.newsModel,
    this.newsItem,
  });

  ServiceState copyWith({
    String? exception,
    LogoutStates? logoutStates,
    GetAboutDataStates? getAboutDataStates,
    GetNewsStates? getNewsStates,
    GetSingleNewsStates? getSingleNewsStates,
    GetTermesAndConditionStates? getTermesAndConditionStates,
    int? page,
    bool? isLangExpanded,
    TermsAndConditionModel? termsAndConditionModel,
    AboutModel? aboutModel,
    TeamsModel? teamsModel,
    NewsModel? newsModel,
    NewsItem? newsItem,
  }) {
    return ServiceState(
        logoutStates: logoutStates ?? this.logoutStates,
        aboutModel: aboutModel ?? this.aboutModel,
        exception: exception ?? this.exception,
        getAboutDataStates: getAboutDataStates ?? this.getAboutDataStates,
        getNewsStates: getNewsStates ?? this.getNewsStates,
        getSingleNewsStates: getSingleNewsStates ?? this.getSingleNewsStates,
        getTermesAndConditionStates:
            getTermesAndConditionStates ?? this.getTermesAndConditionStates,
        isLangExpanded: isLangExpanded ?? this.isLangExpanded,
        newsItem: newsItem ?? this.newsItem,
        newsModel: newsModel ?? this.newsModel,
        page: page ?? this.page,
        teamsModel: teamsModel ?? this.teamsModel,
        termsAndConditionModel:
            termsAndConditionModel ?? this.termsAndConditionModel);
  }
}
