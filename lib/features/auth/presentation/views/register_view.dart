import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/shared_widgets/custom_button.dart';
import '../../../../core/shared_widgets/default_text_form_field.dart';
import '../../../../core/utils/assets/assets.dart';
import '../../../../core/utils/colors/colors.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/text_styles/styles.dart';
import '../view_model/register_cubit/register_cubit.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController email = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();
  var formKeyRegister = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
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
              padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
              child: Column(
                children: [
                  Form(
                    key: formKeyRegister,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Name",
                              style: TextStyle(
                                color: Color(0xff191E3A),
                              ),
                            ),
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height *
                                  .008,
                            ),
                            DefaultTextFormField(
                              textInputType: TextInputType.text,
                              controller: name,
                              maxLines: 1,
                              validation: (String? value) {
                                if (value!.isEmpty) {
                                  return "ValidationEmptyText".tr();
                                }
                              },
                              borderRadius: MediaQuery.of(context)
                                  .size
                                  .height *
                                  .01,
                              hasBorder: true,
                              borderSideWidth: 0,
                              contentPaddingHorizontal:
                              AppConstants.width20(context),
                              contentPaddingVertical:
                              AppConstants.height15(context),
                            ),
                          ],
                        ),
                        SizedBox(
                          height:
                          AppConstants.height10(context),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Email",
                              style: TextStyle(
                                color: Color(0xff191E3A),
                              ),
                            ),
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height *
                                  .008,
                            ),
                            DefaultTextFormField(
                              textInputType:
                              TextInputType.emailAddress,
                              controller: email,
                              maxLines: 1,
                              borderRadius: MediaQuery.of(context)
                                  .size
                                  .height *
                                  .01,
                              hasBorder: true,
                              validation: (String? value) {
                                if (value!.isEmpty) {
                                  return "ValidationEmptyText".tr();
                                } else if (EmailValidator.validate(
                                    value)) {
                                  return null;
                                } else {
                                  return "emailValidationSyntaxText"
                                      .tr();
                                }
                              },
                              borderSideWidth: 0,
                              contentPaddingHorizontal:
                              AppConstants.width20(context),
                              contentPaddingVertical:
                              AppConstants.height15(context),
                            ),
                          ],
                        ),
                        SizedBox(
                          height:
                          AppConstants.height10(context),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Password",
                              style: TextStyle(
                                color: Color(0xff191E3A),
                              ),
                            ),
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height *
                                  .008,
                            ),
                            DefaultTextFormField(
                              textInputType: TextInputType.visiblePassword,
                              controller: password,
                              maxLines: 1,
                              validation: (String? value) {
                                if (value!.isEmpty) {
                                  return "ValidationEmptyText".tr();
                                }
                              },
                              borderRadius: MediaQuery.of(context)
                                  .size
                                  .height *
                                  .01,
                              hasBorder: true,
                              isPassword: true,
                              borderSideWidth: 0,
                              contentPaddingHorizontal:
                              AppConstants.width20(context),
                              contentPaddingVertical:
                              AppConstants.height15(context),
                            ),
                          ],
                        ),
                        SizedBox(
                          height:
                          AppConstants.height10(context),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Confirm Password",
                              style: TextStyle(
                                color: Color(0xff191E3A),
                              ),
                            ),
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height *
                                  .008,
                            ),
                            DefaultTextFormField(
                              textInputType: TextInputType.text,
                              controller: confirmPassword,
                              isPassword: true,
                              maxLines: 1,
                              validation: (String? value) {
                                if (value!.isEmpty) {
                                  return "ValidationEmptyText".tr();
                                } else if (confirmPassword.text !=
                                    password.text) {
                                  return "notIdenticalText".tr();
                                }
                              },
                              borderRadius: MediaQuery.of(context)
                                  .size
                                  .height *
                                  .01,
                              hasBorder: true,
                              borderSideWidth: 0,
                              contentPaddingHorizontal:
                              AppConstants.width20(context),
                              contentPaddingVertical:
                              AppConstants.height15(context),
                            ),
                          ],
                        ),
                        SizedBox(
                          height:
                          AppConstants.height30(context),
                        ),
                        BlocConsumer<RegisterCubit,
                            RegisterState>(
                          builder:
                              (BuildContext context, state) {
                            return DefaultButton(
                              height: MediaQuery.of(context)
                                  .size
                                  .height *
                                  .018,
                              onPress: () {
              
                              },
                              text: 'signup'.tr(),
                              borderRadius:
                              MediaQuery.of(context)
                                  .size
                                  .height *
                                  .01,
                            );
                          },
                          listener: (BuildContext context,
                              state) async {
                            if (state
                            is UserRegisterSuccessState) {
              
                            } else if (state
                            is UserRegisterErrorState) {
              
                            } else if (state
                            is UserRegisterLoadingState) {
              
                            }
                          },
                        ),
                        SizedBox(
                          height: AppConstants.height15(context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                  fontSize:
                                  MediaQuery.of(context).size.height * .014,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Cairo",
                                  color: const Color(0xff0EB177)),
                            ),
                            InkWell(
                              onTap: (){
                                GoRouter.of(context).push("/loginView");
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize:
                                    MediaQuery.of(context).size.height * .014,
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
            ),
          ],
        ),
      ),
    );
  }
}