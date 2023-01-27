import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NavItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  const NavItem({Key? key, required this.title, required this.icon, required this.color,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Icon(icon,
            color:color,),
          AppText(title,
              fontSize: 10.sp,
              color: color),
        ],
      ),
    );
  }
}
