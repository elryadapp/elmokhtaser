import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/core/utils/icon_broken.dart';
import 'package:elmokhtaser/features/profile_module/domain/cubits/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CustomeAppImage extends StatelessWidget {
  const CustomeAppImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var cubit = ProfileCubit.get(context);
          return Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              ClipOval(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color(0xff00678A),
                        Color(0xff29B4E3),
                      ]),
                      border: Border.all(
                        color: AppUi.colors.mainColor,
                      ),
                      borderRadius: BorderRadius.circular(32)),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: ClipOval(
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        width: 10.h,
                        height: 10.h,
                        child: state.userModel!.data!.image == null &&
                                cubit.profileImage == null
                            ? CircleAvatar(
                                backgroundColor: AppUi.colors.whiteColor,
                                child: Icon(
                                  IconBroken.User,
                                  size: 12.w,
                                  color: AppUi.colors.subTitleColor
                                      .withOpacity(.7),
                                ),
                              )
                            : cubit.profileImage == null
                                ? CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        AppUi.assets.networkImageBaseLink +
                                            state.userModel!.data!.image!),
                                  )
                                : CircleAvatar(
                                    backgroundImage:
                                        FileImage(cubit.profileImage!),
                                  ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  cubit.changeImage();
                },
                child: CircleAvatar(
                  backgroundColor: AppUi.colors.subTitleColor.withOpacity(.6),
                  radius: 3.5.w,
                  child: Icon(
                    IconBroken.Camera,
                    size: 5.5.w,
                    color: AppUi.colors.bgColor,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
