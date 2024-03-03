import 'package:fetra/core/shared_widgets/login_first.dart';
import 'package:fetra/core/utils/colors/colors.dart';
import 'package:fetra/core/utils/constants.dart';
import 'package:fetra/core/utils/services/local_services/cache_keys.dart';
import 'package:fetra/core/utils/text_styles/styles.dart';
import 'package:fetra/features/main_layout/view_model/change_nav_bar_status/change_nav_bar_status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({super.key, required this.icon, required this.index});

  final String icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
            ChangeNavBarStatusCubit.get(context).changeNavBarIndex(index);
        },
        child: Container(
          padding: EdgeInsets.all(AppConstants.width20(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: MediaQuery.of(context).size.height*.03,
                color: ChangeNavBarStatusCubit.get(context).currentIndex == index
                    ? AppColors.primaryColor
                    : const Color(0xffDCDCDC),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
