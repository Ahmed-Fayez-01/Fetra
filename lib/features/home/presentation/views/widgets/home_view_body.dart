import 'package:fetra/features/blogs/presentation/views/blogs_view.dart';
import 'package:fetra/features/fat_calculator/presentation/views/fat_calculator_view.dart';
import 'package:fetra/features/home/presentation/views/widgets/home_item.dart';
import 'package:fetra/features/trainers/presentation/views/trainers_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/shared_widgets/default_text_form_field.dart';
import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Transform.translate(
              offset: Offset(0,-MediaQuery.of(context).size.height * .05),
              child: Container(
                height: MediaQuery.of(context).size.height * .33,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetData.homeBack),
                      fit: BoxFit.cover
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: AppConstants.height20(context),),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.width20(context)),
                  child: Row(
                    children: [
                      Expanded(
                        child: DefaultTextFormField(
                          textInputType: TextInputType.name,
                          controller: searchController,
                          onChange: (value) {
                          },
                          contentPaddingVertical:
                          MediaQuery.of(context).size.height * .015,
                          borderSideColor: AppColors.primaryColor,
                          borderSideEnabledColor: AppColors.primaryColor,
                          prefixIcon: SvgPicture.asset(
                            AssetData.search,
                            fit: BoxFit.scaleDown,
                          ),
                          hintText: "Search",
                        ),
                      ),
                      SizedBox(width: AppConstants.width20(context),),
                      SvgPicture.asset(AssetData.notification),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.03,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                  ),
                  child: Image.asset(AssetData.offer,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*.25,),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppConstants.width30(context)),
                child:  Row(
                  children: [
                    Expanded(child: HomeItem(backColor: const Color(0x1AF8A44C), borderColor:  const Color(0xB2F8A44C), title: 'Fat calculation', icon: AssetData.calc, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const FatCalculatorView()));
                    },)),
                    SizedBox(width: AppConstants.width20(context),),
                    Expanded(child: HomeItem(backColor: const Color(0x1A53B175), borderColor:  const Color(0xB253B175), title: 'Blogs', icon: AssetData.papers, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const BlogsView()));
                    },)),
                  ],
                ),
              ),
              SizedBox(height: AppConstants.height20(context),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppConstants.width30(context)),
                child:  Row(
                  children: [
                    Expanded(child: HomeItem(backColor: const Color(0x40F7A593), borderColor:  const Color(0xffF7A593), title: 'video clips', icon: AssetData.creator, onTap: () {  },)),
                    SizedBox(width: AppConstants.width20(context),),
                    Expanded(child: HomeItem(backColor: const Color(0x40D3B0E0), borderColor:  const Color(0xffD3B0E0), title: 'Trainers', icon: AssetData.trainers, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const TrainersView()));
                    },)),
                  ],
                ),
              ),
              SizedBox(height: AppConstants.height20(context),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppConstants.width30(context)),
                child:  Row(
                  children: [
                    Expanded(child: HomeItem(backColor: const Color(0xffE6F0F5), borderColor:  const Color(0xffB7DFF5), title: 'Paid Fat calculation', icon: AssetData.calc2, onTap: () {  },)),
                    SizedBox(width: AppConstants.width20(context),),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ),
              SizedBox(height: AppConstants.height20(context),),
            ],
          ),
        )
      ],
    );
  }
}
