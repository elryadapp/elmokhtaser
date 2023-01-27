import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class AppSlideAnimation extends StatelessWidget {
  final Widget? child;
  final double? horizontalOffset;
  final double? verticalOffset;
  const AppSlideAnimation(
      {Key? key, this.child, this.verticalOffset, this.horizontalOffset, })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(

      child:  AnimationConfiguration.synchronized(
          duration: const  Duration(milliseconds: 600),
          child: SlideAnimation(
            
              verticalOffset: verticalOffset ?? 70,
              horizontalOffset: horizontalOffset ?? 0,
              child: child!),
        ),
      
    );
  }
}
