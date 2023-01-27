
import 'package:flutter/material.dart';
import 'package:elmoktaser_elshamel/modules/auth/_exports.dart';


class BasicInfoScreen extends StatelessWidget {
  const BasicInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var authCubit = AuthCubit.get(context);
        return Form(
          key: authCubit.registerBasicInfoFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.h, bottom: 1.2.h),
                child: AppText(
                  'Name'.tr(),
                ),
              ),
              AppTextFormFeild(
                filledColor: AppUi.colors.bgColor,
                controller: authCubit.registerNameController,
                isFilled: true,
                hint: 'user_name'.tr(),
                validation: true,
                prefixIcon: Icon(
                  IconBroken.User,
                  color: AppUi.colors.subTitleColor.withOpacity(.5),
                  size: 6.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 1.2.h, top: 2.h),
                child: AppText(
                  'E-mail'.tr(),
                ),
              ),
              AppTextFormFeild(
                filledColor: AppUi.colors.bgColor,
                isFilled: true,
                hint: 'example@gmail.com',
               
                textInputType: TextInputType.emailAddress,
                controller: authCubit.registerEmailController,
                prefixIcon: Icon(
                  IconBroken.Message,
                  size: 6.w,
                  color: AppUi.colors.subTitleColor.withOpacity(.5),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 1.2.h, top: 2.h),
                child: AppText(
                  'Phone'.tr(),
                ),
              ),
              AppTextFormFeild(
                  filledColor: AppUi.colors.bgColor,
                  isFilled: true,
                  hint: 'Phone'.tr(),
                  maxLength: 9,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'this_field_is_required'.tr();
                    } else if (value.length < 9||value.length > 9) {
                      return 'phone_error_msg'.tr();
                    }
                    return null;
                  },
                  
                  controller: authCubit.registerPhoneNumberController,
                  textInputType: TextInputType.phone,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          IconBroken.Call,
                          size: 6.w,
                          color: AppUi.colors.subTitleColor.withOpacity(.5),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        const AppText('+966'),
                      ],
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: 1.2.h, top: 2.h),
                child: AppText(
                  'Password'.tr(),
                ),
              ),
              AppTextFormFeild(
                filledColor: AppUi.colors.bgColor,
                isFilled: true,
                hint: 'Password'.tr(),

                    validator: (value) {
                    if (value!.isEmpty) {
                      return 'this_field_is_required'.tr();
                    } else if (value.length < 8) {
                      return 'password_length_error_msg'.tr();
                    }
                    return null;
                  },
                suffixIcon: InkWell(
                  onTap: () {
                    authCubit.registerChangeVisibilityp();
                  },
                  child: Icon(authCubit.registerVisibilityIconp),
                ),
                obscureText: authCubit.registerVisibilityp,
                controller: authCubit.registerPasswordController,
                prefixIcon: Icon(
                  IconBroken.Lock,
                  size: 6.w,
                  color: AppUi.colors.subTitleColor.withOpacity(.5),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 1.2.h, top: 2.h),
                child: AppText(
                  'password_confiremation'.tr(),
                ),
              ),
              AppTextFormFeild(
                filledColor: AppUi.colors.bgColor,
                isFilled: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'this_field_is_required'.tr();
                  } else if (value !=
                      authCubit.registerPasswordController.text) {
                    return 'password_error_msg'.tr();
                  }
                  else if (value.length < 8) {
                      return 'password_length_error_msg'.tr();
                    }
                  return null;
                },
                suffixIcon: InkWell(
                  onTap: () {
                    authCubit.registerChangeVisibility();
                  },
                  child: Icon(authCubit.registerVisibilityIcon),
                ),
                obscureText: authCubit.registerVisibility,
                hint: 'password_confiremation'.tr(),
                controller: authCubit.registerPasswordConfirmController,
                prefixIcon: Icon(
                  IconBroken.Lock,
                  size: 6.w,
                  color: AppUi.colors.subTitleColor.withOpacity(.5),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              AppButton(
                title: 'Next'.tr(),
                onTap: () {
                  if (authCubit.registerBasicInfoFormKey.currentState!
                      .validate()) {
                    AuthCubit.get(context).changeIndex(1, context);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
