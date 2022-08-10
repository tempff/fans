import 'package:fans/moduls/Home/home/home_screen.dart';
import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class GoToPostScreen extends StatefulWidget {
  const GoToPostScreen({Key? key}) : super(key: key);

  @override
  State<GoToPostScreen> createState() => _GoToPostScreenState();
}

class _GoToPostScreenState extends State<GoToPostScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        appBar: commonAppBar(),
        padding: 10.0,
        context: context,
        child: Column(
          children: [30.heightBox, commonPost(context,),],
        ));
  }
}
