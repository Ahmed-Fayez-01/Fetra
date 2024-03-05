import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetra/core/utils/assets/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';

class CoachProfileViewBody extends StatelessWidget {
  const CoachProfileViewBody({super.key});

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
        Text("Coach : Ahmed Fayez",style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: MediaQuery.of(context).size.height*.018
        ),),
        SizedBox(height: AppConstants.height5(context),),
        Text("Subscribed",style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColor,
            fontSize: MediaQuery.of(context).size.height*.014
        ),),
        SizedBox(height: AppConstants.height20(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Row(
            children: [
              Text("About him :",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height*.016
              ),),
            ],
          ),
        ),
        SizedBox(height: AppConstants.height5(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Row(
            children: [
              Expanded(
                child: Text("This text is an example of text that can be changed. This text is an example of text that can be changed.This text is an example of text that can be changed.",style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff4F4F4F),
                    fontSize: MediaQuery.of(context).size.height*.014
                ),),
              ),
            ],
          ),
        ),
        SizedBox(height: AppConstants.height20(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Row(
            children: [
              Text("Phone Number :",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height*.016
              ),),
              SizedBox(width: AppConstants.width5(context),),
              Row(
                children: [
                  SvgPicture.asset(AssetData.phone,width: MediaQuery.of(context).size.width*.035,),
                  SizedBox(width: AppConstants.width5(context),),
                  Text("01158368887",style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.height*.014,
                      color: const Color(0xff4F4F4F)
                  )),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: AppConstants.height20(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Row(
            children: [
              Text("Some Work :",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height*.016
              ),),
            ],
          ),
        ),
        SizedBox(height: AppConstants.height20(context),),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
            child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: AppConstants.width10(context),
                mainAxisSpacing: AppConstants.height10(context),
                children: List.generate(6, (index) {
                  return Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                      child: CachedNetworkImage(
                        width: MediaQuery.of(context).size.width*.3,
                        height: MediaQuery.of(context).size.width*.3,
                        imageUrl:"https://cdn.britannica.com/36/123536-050-95CB0C6E/Variety-fruits-vegetables.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                })),
          ),
        )
      ],
    );
  }
}
