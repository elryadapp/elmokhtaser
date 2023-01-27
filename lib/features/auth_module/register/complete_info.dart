
import 'package:flutter/material.dart';
import 'package:elmoktaser_elshamel/modules/auth/_exports.dart';


class CompleteInfoScreen extends StatelessWidget {
  const CompleteInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authCubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return AppSlideAnimation(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 1.2.h, top: 2.h),
                child: AppText(
                  'education_level'.tr(),
                ),
              ),
              InkWell(
                onTap: () {
                  AppUtil.appDialoge(
                          context: context,
                          title: 'select_education_level'.tr(),
                          content: CustomAppDia(
                              contentList: authCubit.educationLevelList))
                      .then((value) {
                    authCubit.registerEducationalLevelController.text = value??'';
                    authCubit.getLevelList(value);
                  });
                },
                child: AppTextFormFeild(
                  filledColor: AppUi.colors.bgColor,
                  isFilled: true,
                  hint: 'select_education_level'.tr(),
                  isEnable: false,
                  controller: authCubit.registerEducationalLevelController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 1.2.h, top: 2.h),
                child: AppText(
                  'level'.tr(),
                ),
              ),
              InkWell(
                onTap: () {
                  if (authCubit.levelsList.isNotEmpty) {
                    AppUtil.appDialoge(
                            context: context,
                            title:authCubit.registerEducationalLevelController.text=='University_stage'.tr()?'University_stage'.tr() :'select_your_level'.tr(),
                            content:
                                CustomAppDia(contentList: authCubit.levelsList))
                        .then((value) {
                      authCubit.registerLevelController.text = value??'';
                    });
                  } else {
                    AppUtil.flushbarNotification( 'level_alert'.tr());
                  }
                },
                child: AppTextFormFeild(
                  filledColor: AppUi.colors.bgColor,
                  isFilled: true,
                  hint: 'level'.tr(),
                  isEnable: false,
                  controller: authCubit.registerLevelController,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Theme(
                      data: ThemeData(
                          unselectedWidgetColor: AppUi.colors.borderColor),
                      child: Checkbox(
                          activeColor: AppUi.colors.mainColor,
                          checkColor: AppUi.colors.whiteColor,
                          value: authCubit.termsState,
                          onChanged: (val) {
                            authCubit.onChangeConditionsAgrree(val);
                          })),
                  AppText(
                    'Agree_to'.tr(),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
              InkWell(
                child:     AppText(
                    'Terms_and_Condtions'.tr(),
                    color: AppUi.colors.mainColor,
                    textDecoration: TextDecoration.underline,
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, Routes.termsAndConditions);
                  },
              )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              BuildCondition(
                  condition: state is RegisterLoadingState,
                  builder: (context) => AppUtil.appLoader(height: 14.h),
                  fallback: (context) {
                    return AppButton(
                        title: 'Create_Account'.tr(),
                        onTap: () {
                          if (authCubit.termsState &&
                              authCubit.registerLevelController.text != '' &&
                              authCubit.registerEducationalLevelController
                                      .text !=
                                  '') {
                            authCubit.authRegistration(context);
                          } else {
                            if (authCubit.registerEducationalLevelController.text == '') {
                              AppUtil.flushbarNotification(
                                   'level_error'.tr());
                            }
                            else if(authCubit.registerLevelController.text == ''){
                               AppUtil.flushbarNotification(
                                   'level_year'.tr());
                            }
                            else{
                              AppUtil.flushbarNotification(
                                   'terms_error'.tr());
                            }
                          }
                        });
                  }),
            ],
          ),
        );
      },
    );
  }
}
