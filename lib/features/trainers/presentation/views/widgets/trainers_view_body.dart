import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetra/features/trainers/presentation/views/coach_profile_view.dart';
import 'package:fetra/features/trainers/presentation/views/widgets/coach_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/shared_widgets/default_text_form_field.dart';
import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';

class TrainersViewBody extends StatefulWidget {
  const TrainersViewBody({super.key});

  @override
  State<TrainersViewBody> createState() => _TrainersViewBodyState();
}

class _TrainersViewBodyState extends State<TrainersViewBody> {
var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: AppConstants.height20(context),),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppConstants.width20(context)),
          child: Row(
            children: [
              InkWell(onTap: (){
                Navigator.pop(context);
              },child: SvgPicture.asset(AssetData.arrowLeft,color: Colors.black,width: MediaQuery.of(context).size.height*.03,)),
              SizedBox(width: AppConstants.width20(context),),
              Expanded(
                child: DefaultTextFormField(
                  textInputType: TextInputType.name,
                  controller: searchController,
                  onChange: (value) {
                  },
                  hasBorder: false,
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


            ],
          ),
        ),
        SizedBox(height: AppConstants.height20(context),),
        Expanded(
          child: ListView.separated(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) { 
            return InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CoachProfileView()));
            },child: const CoachItem());
          }, separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: AppConstants.height15(context),);
          },),
        ),
      ],
    );
  }
}
