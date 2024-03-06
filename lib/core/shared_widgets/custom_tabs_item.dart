
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/blogs/presentation/view_models/change_tabs_cubit/change_tabs_cubit.dart';
import '../../features/blogs/presentation/view_models/change_tabs_cubit/change_tabs_states.dart';
import '../utils/colors/colors.dart';
import '../utils/constants.dart';
import '../utils/text_styles/styles.dart';

class CustomTabsItem extends StatelessWidget {
  const CustomTabsItem({super.key, required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeTabsCubit, ChangeTabsStates>(
        builder: (context, state) {
      return SizedBox(
        height: MediaQuery.of(context).size.height*.05,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                context.read<ChangeTabsCubit>().changeTabs(index);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  index==0?SizedBox(width: AppConstants.width20(context),):const SizedBox(),
                  // index==0?Container(
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: AppConstants.width20(context),
                  //       vertical: AppConstants.height10(context)),
                  //   margin: EdgeInsetsDirectional.only(
                  //       end: AppConstants.width10(context)),
                  //   decoration: BoxDecoration(
                  //     color: context.read<ChangeTabsCubit>().selectedTab == index
                  //         ? AppColors.primaryColor
                  //         :const Color(0xffFAFAFA),
                  //     borderRadius:
                  //         BorderRadius.circular(AppConstants.width5(context)),
                  //     // color:
                  //   ),
                  //   child: Text(
                  //     "all".tr(),
                  //     style: Styles.title12(context).copyWith(
                  //       color: context.read<ChangeTabsCubit>().selectedTab == index
                  //           ? Colors.white
                  //           : const Color(0xff9A9999),
                  //       fontWeight:context.read<ChangeTabsCubit>().selectedTab == index ? FontWeight.w600 :FontWeight.w500,
                  //     ),
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ):
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.width20(context),
                        vertical: AppConstants.height10(context)),
                    margin: EdgeInsetsDirectional.only(
                        end: AppConstants.width10(context)),
                    decoration: BoxDecoration(
                      color: context.read<ChangeTabsCubit>().selectedTab == index
                          ? AppColors.primaryColor
                          :const Color(0xffFAFAFA),
                      borderRadius:
                      BorderRadius.circular(AppConstants.width5(context)),
                      // color:
                    ),
                    child: Text(
                      categories[index],
                      style: Styles.title12(context).copyWith(
                        color: context.read<ChangeTabsCubit>().selectedTab == index
                            ? Colors.white
                            : const Color(0xff9A9999),
                        fontWeight:context.read<ChangeTabsCubit>().selectedTab == index ? FontWeight.w600 :FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: categories.length,
        ),
      );
    });
  }
}
