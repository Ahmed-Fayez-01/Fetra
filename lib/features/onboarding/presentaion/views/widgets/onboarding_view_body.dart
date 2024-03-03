import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/assets/assets.dart';
import 'onboarding_item.dart';

class OnBoardingViewBody extends StatelessWidget {
  OnBoardingViewBody({super.key});
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: PageView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              OnBoardingItem(
                image: Image.asset(AssetData.onBoarding),
                title: "onBoardingTitle0".tr(),

                noOfScreen: 3,
                onNextPressed: changeScreen,
                currentScreenNo: 0,
              ),
              OnBoardingItem(
                image: Image.asset(AssetData.onBoarding),
                title: "onBoardingTitle1".tr(),
                noOfScreen: 3,
                onNextPressed: changeScreen,
                currentScreenNo: 1,
              ),
              OnBoardingItem(
                image: Image.asset(AssetData.onBoarding),
                title: "onBoardingTitle2".tr(),
                noOfScreen: 3,
                onNextPressed: changeScreen,
                currentScreenNo: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
  void changeScreen(int nextScreenNo) {
    controller.jumpToPage(nextScreenNo);
  }
}
