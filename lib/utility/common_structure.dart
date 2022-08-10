import 'package:flutter/material.dart';
import 'colors_utility.dart';

Widget commonStructure({
  required BuildContext context,
  required Widget child,
  PreferredSize? appBar,
  Color? bgColor,
  double? padding,
  Key? key,
  Widget? bottomNavigation,
  FloatingActionButton? floatingActionButton
}) {
  return SafeArea(
    key: key,
    child: Stack(
      children: [
        Scaffold(
          /*backgroundColor: bgColor ?? colorWhite,*/
          resizeToAvoidBottomInset: true,
          appBar: appBar,
          bottomNavigationBar: bottomNavigation,
          floatingActionButton: floatingActionButton,
          ///adding listView cause scroll issue
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: padding ?? 12),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: child,
          ),
        ),
      ],
    ),
  );
}
