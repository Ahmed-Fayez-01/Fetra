import 'package:fetra/core/shared_widgets/custom_button.dart';
import 'package:fetra/core/shared_widgets/default_text_form_field.dart';
import 'package:fetra/core/utils/colors/colors.dart';
import 'package:fetra/core/utils/constants.dart';
import 'package:fetra/features/fat_calculator/presentation/views/widgets/fat_calc_row_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/assets/assets.dart';
import 'correct_mesure_item.dart';

class WomanFatCalcViewBody extends StatefulWidget {
  const WomanFatCalcViewBody({super.key});

  @override
  State<WomanFatCalcViewBody> createState() => _WomanFatCalcViewBodyState();
}

class _WomanFatCalcViewBodyState extends State<WomanFatCalcViewBody> {
  var neck = TextEditingController();
  var middle = TextEditingController();
  var lowerBack = TextEditingController();
  var weight = TextEditingController();
  var length = TextEditingController();
  @override
  void initState(){
    AppConstants.hideMeasure=false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppConstants.hideMeasure ?const SizedBox(): CorrectMesureItem(onTap: () {
          setState(() {
            AppConstants.hideMeasure=true;
          });
        },),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AssetData.woman,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .4,
            ),
            Transform.translate(
              offset: Offset(MediaQuery.of(context).size.width*.21,-MediaQuery.of(context).size.height*.11),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .27,
                  child: DefaultTextFormField(
                    textInputType: TextInputType.text,
                    contentPaddingHorizontal:0,
                    controller: neck,
                    hasBorder: true,
                    hasCons: true,
                    borderSideWidth: 2,
                    hintText: "Neck (cm)",
                    prefixIcon: SvgPicture.asset(AssetData.line,fit: BoxFit.scaleDown,),
                    borderSideEnabledColor: AppColors.primaryColor,
                  )),
            ),
            Transform.translate(
              offset: Offset(-MediaQuery.of(context).size.width*.25,-MediaQuery.of(context).size.height*.04),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .27,
                  child: DefaultTextFormField(
                    textInputType: TextInputType.text,
                    contentPaddingHorizontal:0,
                    controller: middle,
                    hasBorder: true,
                    hasCons: true,
                    borderSideWidth: 2,
                    hintText: "Middle (cm)",
                    prefixIcon: SvgPicture.asset(AssetData.line,fit: BoxFit.scaleDown,),
                    borderSideEnabledColor: AppColors.primaryColor,
                  )),
            ),
            Transform.translate(
              offset: Offset(MediaQuery.of(context).size.width*.18,MediaQuery.of(context).size.height*.01),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .27,
                  child: DefaultTextFormField(
                    textInputType: TextInputType.text,
                    contentPaddingHorizontal:0,
                    controller: lowerBack,
                    hasBorder: true,
                    hasCons: true,
                    borderSideWidth: 2,
                    hintText: "lower back (cm)",
                    prefixIcon: SvgPicture.asset(AssetData.line,fit: BoxFit.scaleDown,),
                    borderSideEnabledColor: AppColors.primaryColor,
                  )),
            ),
            Transform.translate(
              offset: Offset(MediaQuery.of(context).size.width*.24,MediaQuery.of(context).size.height*.16),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .27,
                  child: DefaultTextFormField(
                    textInputType: TextInputType.text,
                    contentPaddingHorizontal:0,
                    controller: weight,
                    hasBorder: true,
                    hasCons: true,
                    borderSideWidth: 2,
                    hintText: "Weight (kg)",
                    prefixIcon: SvgPicture.asset(AssetData.line,fit: BoxFit.scaleDown,),
                    borderSideEnabledColor: AppColors.primaryColor,
                  )),
            ),
            Transform.translate(
              offset: Offset(-MediaQuery.of(context).size.width*.32,MediaQuery.of(context).size.height*.16),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .27,
                  child: DefaultTextFormField(
                    textInputType: TextInputType.text,
                    contentPaddingHorizontal:0,
                    controller: length,
                    hasBorder: true,
                    hasCons: true,
                    borderSideWidth: 2,
                    hintText: "Length (cm)",
                    prefixIcon: SvgPicture.asset(AssetData.line,fit: BoxFit.scaleDown,),
                    borderSideEnabledColor: AppColors.primaryColor,
                  )),
            ),
          ],
        ),
        SizedBox(height: AppConstants.height30(context),),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.3),
          child: DefaultButton(onPress: (){}, text: "Calculate",borderRadius: MediaQuery.of(context).size.height*.2,height: AppConstants.height15(context),),
        ),
        SizedBox(height: AppConstants.height20(context),),
         Column(
          children: [
            const FatCalcRowItem(title: "Fat percentage", value: "0 %"),
            SizedBox(height: AppConstants.height15(context),),
            const FatCalcRowItem(title: "Fat weight", value: "0 kg"),
            SizedBox(height: AppConstants.height15(context),),
            const FatCalcRowItem(title: "Weight of lean mass", value: "0 kg"),
            SizedBox(height: AppConstants.height15(context),),
            const FatCalcRowItem(title: "Fat class", value: "0 kg"),
          ],
        ),
        SizedBox(height: AppConstants.height30(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: DefaultButton(onPress: (){}, text: "Design your own health regimen",borderRadius: AppConstants.sp10(context),),
        ),
      ],
    );
  }
}
