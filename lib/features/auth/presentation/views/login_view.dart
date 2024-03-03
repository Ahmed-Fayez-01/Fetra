import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:fetra/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/shared_widgets/custom_button.dart';
import '../../../../core/shared_widgets/default_text_form_field.dart';
import '../../../../core/utils/assets/assets.dart';
import '../../../../core/utils/colors/colors.dart';
import '../../../../core/utils/text_styles/styles.dart';
import '../view_model/login_cubit/login_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var formKeyLogin = GlobalKey<FormState>();

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  TextEditingController emailOrPhone = TextEditingController();
  TextEditingController password = TextEditingController();
  late StreamSubscription<InternetConnectionStatus> subscription;

  @override
  initState() {
    super.initState();

    subscription = InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            setState(() {
              AppConstants.hasInternet = true;
            });
            break;
          case InternetConnectionStatus.disconnected:
            // ignore: avoid_print
            setState(() {
              AppConstants.hasInternet = false;
            });
            break;
        }
      },
    );
  }

// Be sure to cancel subscription after you are done
  @override
  dispose() {
    super.dispose();

    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .4,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(
                                        MediaQuery.of(context).size.height *
                                            .2))),
                          ),
                          Transform.translate(
                            offset: Offset(-AppConstants.width20(context),
                                MediaQuery.of(context).size.height * .07),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.height *
                                              .048),
                                  child: Row(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: SvgPicture.asset(
                                            AssetData.arrowLeft,
                                            color: Colors.white,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .035,
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: AppConstants.height10(context),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      AssetData.authIcon,
                                      fit: BoxFit.contain,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              .35,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .35,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: MediaQuery.of(context).size.width * .15,
                            right: MediaQuery.of(context).size.width * .15,
                            child: Text(
                              "Welcome Back!",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .022,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Cairo",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppConstants.height30(context),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.width20(context)),
                        child: Column(
                          children: [
                            Form(
                              key: formKeyLogin,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "email".tr(),
                                        style: TextStyle(
                                            color: const Color(0xff333333),
                                            fontWeight: FontWeight.w500,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .016),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .008,
                                      ),
                                      DefaultTextFormField(
                                        textInputType: TextInputType.text,
                                        controller: emailOrPhone,
                                        maxLines: 1,
                                        borderRadius:
                                            MediaQuery.of(context).size.height *
                                                .01,
                                        borderSideWidth: 0,
                                        validation: (String? value) {
                                          if (value!.isEmpty) {
                                            return "ValidationEmptyText".tr();
                                          }
                                        },
                                        contentPaddingHorizontal:
                                            AppConstants.width20(context),
                                        contentPaddingVertical:
                                            AppConstants.height15(context),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppConstants.height10(context),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Password",
                                        style: TextStyle(
                                            color: const Color(0xff333333),
                                            fontWeight: FontWeight.w500,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .016),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .008,
                                      ),
                                      DefaultTextFormField(
                                        textInputType: TextInputType.text,
                                        controller: password,
                                        isPassword: true,
                                        maxLines: 1,
                                        validation: (String? value) {
                                          if (value!.isEmpty) {
                                            return "ValidationEmptyText".tr();
                                          }
                                        },
                                        borderRadius:
                                            MediaQuery.of(context).size.height *
                                                .01,
                                        borderSideWidth: 0,
                                        contentPaddingHorizontal:
                                            AppConstants.width20(context),
                                        contentPaddingVertical:
                                            AppConstants.height15(context),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppConstants.height15(context),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          "forgetPasswordText".tr(),
                                          style: Styles.onboardingTitleText(
                                                  context)
                                              .copyWith(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          .014,
                                                  color:
                                                      const Color(0xff0EB177),
                                                  fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppConstants.height15(context),
                                  ),
                                  BlocConsumer<LoginCubit, LoginState>(
                                    builder: (BuildContext context, state) {
                                      return DefaultButton(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .018,
                                        onPress: () {
                                          GoRouter.of(context).push("/mainLayoutView");
                                        },
                                        text: 'signin'.tr(),
                                        fontFamily: "Cairo",
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                        borderRadius:
                                            MediaQuery.of(context).size.height *
                                                .01,
                                      );
                                    },
                                    listener:
                                        (BuildContext context, state) async {
                                      if (state is UserLoginSuccessState) {
                                      } else if (state is UserLoginErrorState) {
                                      } else if (state
                                          is UserLoginLoadingState) {}
                                    },
                                  ),
                                  SizedBox(
                                    height: AppConstants.height15(context),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don’t have an account? ",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .014,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Cairo",
                                            color: const Color(0xff0EB177)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          GoRouter.of(context)
                                              .push("/registerView");
                                        },
                                        child: Text(
                                          "Register",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .014,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "Cairo",
                                              color: const Color(0xff0EB177)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}