import 'package:fetra/core/utils/colors/colors.dart';
import 'package:fetra/core/utils/constants.dart';
import 'package:fetra/features/onboarding/presentaion/views/widgets/progress_dots.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/utils/services/local_services/cache_helper.dart';
import '../../../../../core/utils/text_styles/styles.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.image,
    required this.title,
    required this.noOfScreen,
    required this.onNextPressed,
    required this.currentScreenNo,
  });

  final Image image;

  final String title;

  final int noOfScreen;

  final Function(int) onNextPressed;

  final int currentScreenNo;

  @override
  Widget build(BuildContext context) {
    bool isLastScreen = currentScreenNo >= noOfScreen - 1;
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.height * .5,
                  height: MediaQuery.of(context).size.height * .5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      image,
                    ],
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              Text(
                title,
                style: Styles.onboardingTitleText(context),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .08,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.width20(context)),
                child: DefaultButton(
                  onPress: () {
                    if(isLastScreen)
                              {
                                CacheHelper.saveData(key: "onBoarding", value: true);
                                GoRouter.of(context).go("/loginView");
                              }else{
                                onNextPressed(currentScreenNo + 1);
                              }
                  },
                  text: 'ابدأ',
                  borderRadius: AppConstants.sp10(context),
                  backgroundColor: Colors.white,
                  textColor: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int index = 0; index < noOfScreen; index++)
                    ProgressDots(
                      isActiveScreen: (index == currentScreenNo) ? true : false,
                    )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .04,
        ),
      ],
    );
  }
}
