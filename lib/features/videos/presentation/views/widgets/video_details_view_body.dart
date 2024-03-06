import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetra/features/videos/presentation/views/widgets/similar_video_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/text_styles/styles.dart';

class VideoDetailsViewBody extends StatelessWidget {
  const VideoDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppConstants.height30(context),),
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AssetData.videoBanner,width: MediaQuery.of(context).size.width-AppConstants.width20(context)*2,fit: BoxFit.fill,),
                ],
              ),
            ),
            CircleAvatar(
              radius: MediaQuery.of(context).size.height*.03,
              backgroundColor: const Color(0xff84C245),
              child: SvgPicture.asset(AssetData.arrowRight,width: MediaQuery.of(context).size.height*.01,),
            )
          ],
        ),
        SizedBox(height: AppConstants.height30(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Text("How to take correct neck measurements",style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: MediaQuery.of(context).size.height*.022,
              color: const Color(0xff303030)
          ),),
        ),
        SizedBox(height: AppConstants.height10(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(AppConstants.width5(context)),
                decoration: BoxDecoration(
                  color: const Color(0xff8D5EF2),
                  borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                ),
                child: Text("The Health",style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height*.014,
                    fontWeight: FontWeight.w600
                ),),
              ),
              SizedBox(width: AppConstants.width5(context),),
              Container(
                padding: EdgeInsets.all(AppConstants.width5(context)),
                decoration: BoxDecoration(
                  color: const Color(0xff0082CD),
                  borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                ),
                child: Text("Thinness",style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height*.014,
                    fontWeight: FontWeight.w600
                ),),
              ),
              SizedBox(width: AppConstants.width5(context),),
              Container(
                padding: EdgeInsets.all(AppConstants.width5(context)),
                decoration: BoxDecoration(
                  color: const Color(0xff4DC9D1),
                  borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                ),
                child: Text("Sports",style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height*.014,
                    fontWeight: FontWeight.w600
                ),),
              ),
            ],
          ),
        ) ,
        SizedBox(height: AppConstants.height20(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Text("If you are interested in getting your health system now, just join us If you are interested in getting your health system now, just join us now",style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.height*.018,
              color: const Color(0xff9D9FA0)
          ),),
        ),
        SizedBox(height: AppConstants.height30(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .07,
                    width: MediaQuery.of(context).size.height * .07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * .07,
                      ),
                      color: Colors.grey[300],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * .07,
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                        "https://images.pexels.com/photos/1557652/pexels-photo-1557652.jpeg",
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * .07,
                        placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primarySwatchColor,
                            )),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(MediaQuery.of(context).size.height * .001,
                        MediaQuery.of(context).size.height * .05),
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.height * .01,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height * .007,
                        backgroundColor: const Color(0xff27AE60)
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: AppConstants.width10(context),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ahmed Fayez",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height*.02,
                          color: const Color(0xff303030),
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: AppConstants.height5(context),),
                    Text(
                      "Nutritional specialist",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height*.014,
                          color: const Color(0xff9D9FA0),
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: AppConstants.height20(context),),
       Expanded(
         child: ListView.separated(
           itemCount: 3,
           itemBuilder: (BuildContext context, int index) {
           return const SimilarVideoItem();
         }, separatorBuilder: (BuildContext context, int index) {
             return SizedBox(height: AppConstants.height10(context),);
         },),
       ),
      ],
    );
  }
}
