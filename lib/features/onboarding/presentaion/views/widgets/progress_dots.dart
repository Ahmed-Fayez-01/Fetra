import 'package:flutter/material.dart';

import '../../../../../core/utils/colors/colors.dart';

class ProgressDots extends StatelessWidget {
  ProgressDots({super.key, required this.isActiveScreen});
  bool isActiveScreen;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.005),
      height:  MediaQuery.of(context).size.width*.015,
      width:   MediaQuery.of(context).size.width*.015,
      decoration: BoxDecoration(
          color: isActiveScreen ?  Colors.white : const Color(0xffBDBDBD),
          borderRadius:  BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*.01))),
    );
  }
}

