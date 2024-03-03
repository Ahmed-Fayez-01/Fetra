import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fetra/core/shared_widgets/custom_button.dart';
import 'package:fetra/core/utils/constants.dart';

import '../utils/colors/colors.dart';

void exitDialog(context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              "exit".tr(),
              textAlign: TextAlign.center,
            ),
            content: Text(
              "exit_question".tr(),
            ),
            actions: [
              Row(
                children: [
                  Expanded(
                    child: DefaultButton(
                      onPress: () {
                        exit(0);
                      },
                      text: "exit".tr(),
                      backgroundColor: AppColors.primaryColor,
                      borderRadius: AppConstants.sp10(context),
                    fontSize: MediaQuery.of(context).size.height*.018,
                    ),
                  ),
                  SizedBox(
                    width: AppConstants.width20(context),
                  ),
                  Expanded(
                      child: DefaultButton(
                    onPress: () {
                      Navigator.pop(context);
                    },
                    text: "cancel".tr(),
                        textColor: AppColors.primaryColor,
                    backgroundColor: Colors.grey.shade300,
                        borderRadius: AppConstants.sp10(context),
                    fontSize: MediaQuery.of(context).size.height*.018,
                  )),
                ],
              ),
            ],
          ));
}
