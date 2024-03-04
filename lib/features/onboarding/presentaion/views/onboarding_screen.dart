import 'package:fetra/features/onboarding/presentaion/views/widgets/onboarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/colors/colors.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            elevation: 0,
            systemOverlayStyle:  const SystemUiOverlayStyle(
              statusBarColor: Color(0xff53B97C),
              // <-- SEE HERE
              statusBarIconBrightness: Brightness.light,
              //<-- For Android SEE HERE (dark icons)
              systemNavigationBarColor:AppColors.primarySwatchColor,
              statusBarBrightness:
              Brightness.dark, //<-- For iOS SEE HERE (dark icons)
            ),
          )),
      body: OnBoardingViewBody(),
    );
  }
}
