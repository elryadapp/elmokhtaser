import 'dart:ui' show lerpDouble;

import 'package:elmokhtaser/core/components/custom_nav_bar/bottom_nav_item.dart';
import 'package:elmokhtaser/core/components/custom_nav_bar/nav_item.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:flutter/material.dart';


const double defaultBarHeight = 60;

const double defaultIndicatorHeight = 2;


// ignore: must_be_immutable
class TitledBottomNavigationBar extends StatefulWidget {
  final Curve curve;
  final Color? activeColor;
  final Color? inactiveStripColor;
  final Color? indicatorColor;
    int currentIndex;


  final ValueChanged<int> onTap;


  final List<TitledNavigationBarItem> items;

  final double indicatorHeight;

  final double height;

  TitledBottomNavigationBar({
    Key? key,
    this.curve = Curves.linear,
    required this.onTap,
    required this.items,
    this.activeColor,
    this.inactiveStripColor,
    this.indicatorColor,
    this.currentIndex = 0,
    this.height = defaultBarHeight,
    this.indicatorHeight = defaultIndicatorHeight,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  @override
  State createState() => _TitledBottomNavigationBarState();
}

class _TitledBottomNavigationBarState extends State<TitledBottomNavigationBar> {


  Curve get curve => widget.curve;

  List<TitledNavigationBarItem> get items => widget.items;

  double width = 0;
  Color? activeColor;
  Duration duration =const Duration(milliseconds: 270);

  double _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr){
      return lerpDouble(-1.0, 1.0, index / (items.length - 1))!;}
    else
     { return lerpDouble(1.0, -1.0, index / (items.length - 1))!;}
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    activeColor = widget.activeColor ?? Theme.of(context).indicatorColor;

    return Container(
      height: widget.height + MediaQuery.of(context).viewPadding.bottom,
      width: width,
      decoration: BoxDecoration(
        color: widget.inactiveStripColor ?? Theme.of(context).cardColor,
        boxShadow: const[
                BoxShadow(color: Colors.black12, blurRadius: 5),
              ]
            
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: widget.indicatorHeight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((item) {
                var index = items.indexOf(item);
                return GestureDetector(
                  onTap: () => _select(index),
                  child: _buildItemWidget(item, index == widget.currentIndex),
                );
              }).toList(),
            ),
          ),
          Positioned(
            top: 0,
            width: width,
            child: AnimatedAlign(
              alignment:
                  Alignment(_getIndicatorPosition(widget.currentIndex), 0),
              curve: curve,
              duration: duration,
              child: Container(
                color: widget.indicatorColor ?? activeColor,
                width: width / items.length,
                height: widget.indicatorHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _select(int index) {
    widget.currentIndex = index;
    widget.onTap(widget.currentIndex);

    setState(() {});
  }

  Widget _buildIcon(TitledNavigationBarItem item,Color color) {
    return NavItem(title:  item.title, icon:  item.icon,color: color,);
  }

  Widget _buildText(TitledNavigationBarItem item,Color color) {
    return  NavItem(title: item.title, icon:  item.icon,color:color);
  }

  Widget _buildItemWidget(TitledNavigationBarItem item, bool isSelected) {
    return Container(
      color: item.backgroundColor,
      height: widget.height,
      width: width / items.length,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
           
            child:  _buildText(item,isSelected?activeColor!:AppUi.colors.subTitleColor.withOpacity(.5)),
          ),
          Align(
            alignment:Alignment.center,
            child:  _buildIcon(item,isSelected?activeColor!:AppUi.colors.subTitleColor.withOpacity(.5)),
          ),
        ],
      ),
    );
  }
}