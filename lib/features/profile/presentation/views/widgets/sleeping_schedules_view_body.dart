import 'package:easy_localization/easy_localization.dart';
import 'package:fetra/core/shared_widgets/custom_button.dart';
import 'package:fetra/core/utils/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared_widgets/default_text_form_field.dart';
import '../../../../../core/utils/constants.dart';

class SleepingSchedulesViewBody extends StatefulWidget {
  const SleepingSchedulesViewBody({super.key});

  @override
  State<SleepingSchedulesViewBody> createState() => _SleepingSchedulesViewBodyState();
}

class _SleepingSchedulesViewBodyState extends State<SleepingSchedulesViewBody> {
  TextEditingController to = TextEditingController();

  TextEditingController from = TextEditingController();
  var formKeySleeping = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal:AppConstants.width20(context) ),
      child: Column(children: [
        SizedBox(height: AppConstants.height20(context),),
        Form(
            key: formKeySleeping,
            child: Column(children: [
          DefaultTextFormField(
            textInputType: TextInputType.text,
            controller: from,
            maxLines: 1,
            validation: (String? value) {
              if (value!.isEmpty) {
                return "ValidationEmptyText".tr();
              }
            },
            borderRadius: MediaQuery.of(context).size.height * .01,
            hasBorder: true,
            hintText: "from".tr(),
            borderSideEnabledColor: Colors.transparent,
            borderSideWidth: 1,
            contentPaddingHorizontal: AppConstants.width20(context),
            contentPaddingVertical: AppConstants.height15(context),
          ),
          SizedBox(height: AppConstants.height20(context),),
          DefaultTextFormField(
            textInputType: TextInputType.text,
            controller: to,
            maxLines: 1,
            validation: (String? value) {
              if (value!.isEmpty) {
                return "ValidationEmptyText".tr();
              }
            },
            borderRadius: MediaQuery.of(context).size.height * .01,
            hasBorder: true,
            hintText: "to".tr(),
            borderSideEnabledColor: Colors.transparent,
            borderSideWidth: 1,
            contentPaddingHorizontal: AppConstants.width20(context),
            contentPaddingVertical: AppConstants.height15(context),
          ),
        ],)),
        SizedBox(height: AppConstants.height20(context)*2,),
        DefaultButton(onPress: (){}, text: "Calculate",borderRadius: AppConstants.sp10(context),),
        SizedBox(height: AppConstants.height30(context)*2,),
        Container(
          padding: EdgeInsets.symmetric(horizontal:AppConstants.width20(context),vertical: AppConstants.height20(context)*2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
            border: Border.all(color: const Color(0xff69BD46)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text("Your sleep hours are very good. Please keep it",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height*.018,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xE5000000)
                ),),
              ),
            ],
          ),
        )
      ],),
    );
  }
}
