
import 'package:flutter/material.dart';
import 'package:elmoktaser_elshamel/modules/auth/_exports.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var authCubit=AuthCubit.get(context);
        return Scaffold(
          backgroundColor: AppUi.colors.whiteColor,
          body: AppSlideAnimation(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.h,
                  horizontal: 5.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                            IconButton(
                            onPressed: () {
                              if(authCubit.currentInfoIndex==0){
                              Navigator.pop(context);
          
                              }
                              else{
                                authCubit.changeIndex(0,context);
                              }
                            },
                            icon: const Icon(Icons.arrow_back)),
                        AppText(
                          'Create_Account'.tr(),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                    
                      ],
                    ),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 2.h),
                          child: Stack(
                            alignment: AlignmentDirectional.centerStart,
                      children: [
                          Container(
                            width: Constants.getwidth(context),
                            height: .5.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppUi.colors.borderColor
                            ),
                          ),
                              AnimatedContainer(
                                duration:const Duration(milliseconds: 600),
                            width:authCubit.animatedWidth?? Constants.getwidth(context)/2-5.w,
                            height: .5.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppUi.colors.mainColor
                            ),
                          )
                      ],
                    ),
                        ),
                    authCubit.currentInfoIndex==0?
                    const BasicInfoScreen():const CompleteInfoScreen()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
