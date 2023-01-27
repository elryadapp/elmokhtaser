import 'package:dotted_border/dotted_border.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/components/custom_video.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/core/utils/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sizer/sizer.dart';

class QuestionCard extends StatelessWidget {
  final dynamic question;
  final String questionNum;
  const QuestionCard(
      {Key? key, required this.question, required this.questionNum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: DottedBorder(
        radius: const Radius.circular(5),
        dashPattern: const [8, 6],
        borderType: BorderType.RRect,
        color: AppUi.colors.borderColor,
        child: Container(
          decoration: BoxDecoration(
              color: AppUi.colors.whiteColor,
              borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.all(2.h),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 3.w,
                      backgroundColor: AppUi.colors.mainColor,
                      child: Center(
                          child: AppText(
                        questionNum,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w600,
                        color: AppUi.colors.whiteColor,
                      )),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: question.type == 'matching'
                        ? const AppText(
                            'قم بترتيب الإجابات بناء على الاسئلة (عن طريق تحريك البلوكات لأعلى واسفل)',
                            fontWeight: FontWeight.w600,
                          )
                        : Html(
                            data: question.question!,
                           
                          ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              if (question.image != null&&question.videoUrl==null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Stack(
                    children: [
                      Image.network(
                        AppUi.assets.networkImageBaseLink + question.image!,
                        fit: BoxFit.cover,
                        height: 20.h,
                        width: Constants.getwidth(context),
                      ),
                    ],
                  ),
                ),

                if(question.image!=null&&question.videoUrl!=null)
                 CustomVideo(
            courseImage: question.image,
            videoId: question.videoUrl.split('?').first,
          )


            ],
          ),
        ),
      ),
    );
  }
}
