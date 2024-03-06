import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/constants.dart';

class SimilarVideoItem extends StatelessWidget {
  const SimilarVideoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: Container(
          padding: EdgeInsets.all(AppConstants.sp10(context)),
          decoration: BoxDecoration(
              color: const Color(0xffF6F7FA),
              borderRadius: BorderRadius.circular(AppConstants.sp10(context))
          ),
          child:Row(
            children: [
              Container(
                padding: EdgeInsets.all(AppConstants.sp15(context)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                ),
                child: SvgPicture.asset(AssetData.play,width: MediaQuery.of(context).size.width*.12,),
              ),
              SizedBox(width: AppConstants.width10(context),),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Is healthy eating beneficial? And why?",
                      maxLines: 2,
                      overflow:TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.of(context).size.height*.016,
                          color: const Color(0xff303030)
                      ),),
                    SizedBox(height: AppConstants.height5(context),),
                    Text("04:10m",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height*.018,
                          color: const Color(0xff8C8C8C)
                      ),),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
