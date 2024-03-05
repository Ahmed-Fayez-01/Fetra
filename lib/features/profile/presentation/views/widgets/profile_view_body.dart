import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetra/core/shared_widgets/custom_button.dart';
import 'package:fetra/features/profile/presentation/views/account_info_view.dart';
import 'package:fetra/features/profile/presentation/views/measurements_view.dart';
import 'package:fetra/features/profile/presentation/views/sleeping_schedules_view.dart';
import 'package:fetra/features/profile/presentation/views/walking_times_view.dart';
import 'package:fetra/features/profile/presentation/views/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: AppConstants.height20(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:AppConstants.width20(context) ),
          child: Row(
            children: [
              InkWell(onTap: (){
                Navigator.pop(context);
              },child: SvgPicture.asset(AssetData.arrowLeft,color: Colors.black,)),
            ],
          ),
        ),
        SizedBox(height: AppConstants.height20(context),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:
              EdgeInsets.all(AppConstants.width5(context)),
              height: MediaQuery.of(context).size.height * .13,
              width: MediaQuery.of(context).size.height * .13,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height * .13,
                ),
                color: Colors.transparent,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height * .13,
                ),
                child: CachedNetworkImage(
                  imageUrl:
                  "https://images.pexels.com/photos/1557652/pexels-photo-1557652.jpeg",
                  fit: BoxFit.cover,
                  height:
                  MediaQuery.of(context).size.height * .1,
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: AppConstants.height10(context),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ahmed Fayez",style: TextStyle(
                fontWeight: FontWeight.w500,
                color: const Color(0xff4F4F4F),
                fontSize: MediaQuery.of(context).size.height*.024
            ),),
            SizedBox(width: AppConstants.width10(context),),
            SvgPicture.asset(AssetData.edit),
          ],
        ),
        SizedBox(height: AppConstants.height30(context),),
        ProfileItem(title: 'Account Information', onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const AccountInfoView()));
        },),
        SizedBox(height: AppConstants.height10(context),),
        ProfileItem(title: 'Sleeping schedules', onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const SleepingSchedulesView()));
        },),
        SizedBox(height: AppConstants.height10(context),),
        ProfileItem(title: 'Walking times', onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const WalkingTimesView()));
        },),
        SizedBox(height: AppConstants.height10(context),),
        ProfileItem(title: 'Subscriptions', onTap: () {  },),
        SizedBox(height: AppConstants.height10(context),),
        ProfileItem(title: 'My Measurements', onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const MeasurementsView()));
        },),
        SizedBox(height: AppConstants.height30(context)*2,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: DefaultButton(onPress: (){}, text: "Sign Out",textColor: const Color(0xff212132),icon: SvgPicture.asset(AssetData.signOut),borderRadius: AppConstants.sp20(context),backgroundColor: const Color(0xffF2F3F2),surfaceTintColor: Colors.transparent,shadowColor: Colors.transparent,),
        ),
      ],
    );
  }
}
