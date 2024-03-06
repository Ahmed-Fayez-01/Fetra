import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/store/presentation/view_models/change_tabs_image_cubit/change_tabs_image_cubit.dart';
import '../../features/store/presentation/view_models/change_tabs_image_cubit/change_tabs_image_states.dart';
import '../utils/colors/colors.dart';
import '../utils/constants.dart';
import '../utils/text_styles/styles.dart';

class CustomTabsCategoriesWithImage extends StatelessWidget {
  const CustomTabsCategoriesWithImage({super.key, required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeTabsImageCubit, ChangeTabsImageStates>(
        builder: (context, state) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * .12,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        context.read<ChangeTabsImageCubit>().changeTabs(index);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.height * .009,
                                vertical:
                                    MediaQuery.of(context).size.height * .009),
                            decoration: BoxDecoration(
                              color: const Color(0x334CAD73),
                              border: Border.all(
                                width: 2,
                                color: context
                                            .read<ChangeTabsImageCubit>()
                                            .selectedTab ==
                                        index
                                    ? const Color(0xff51BC7D)
                                    : Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(
                                  AppConstants.sp15(context)),
                              // color:
                            ),
                            child: CachedNetworkImage(
                              width: MediaQuery.of(context).size.width * .08,
                              height: MediaQuery.of(context).size.width * .08,
                              imageUrl:
                                  "https://cdn.britannica.com/36/123536-050-95CB0C6E/Variety-fruits-vegetables.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: AppConstants.height5(context),
                          ),
                          Text(
                            categories[index],
                            style: Styles.title12(context).copyWith(
                              color: context
                                          .read<ChangeTabsImageCubit>()
                                          .selectedTab ==
                                      index
                                  ? AppColors.primaryColor
                                  : Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          context.read<ChangeTabsImageCubit>().selectedTab ==
                                  index
                              ? const Spacer()
                              : const SizedBox(),
                          context.read<ChangeTabsImageCubit>().selectedTab ==
                                  index
                              ? Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius:
                                          BorderRadiusDirectional.vertical(
                                              top: Radius.circular(
                                                  AppConstants.sp30(context)))),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width * .18,
                                    height:
                                        MediaQuery.of(context).size.width * .015,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    );
                  },
                  itemCount: categories.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: AppConstants.width20(context),
                    );
                  },
                ),
              ),
            ),
            Divider(
              height: 0,
            ),
          ],
        ),
      );
    });
  }
}
