import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetra/core/utils/assets/assets.dart';
import 'package:fetra/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlogDetailsViewBody extends StatelessWidget {
  const BlogDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Stack(
          children: [
            CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*.55,
              imageUrl:"https://cdn.britannica.com/36/123536-050-95CB0C6E/Variety-fruits-vegetables.jpg",
              fit: BoxFit.fill,
            ),

            Padding(
              padding: EdgeInsets.all(AppConstants.sp20(context)),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(AppConstants.width5(context)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                    ),
                    child: SvgPicture.asset(AssetData.arrowLeft,color: Colors.black,)),
              ),
            ),
          ],
        ),
        SizedBox(height: AppConstants.height30(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Is healthy eating beneficial? And why?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height*.02
              ),),
            ],
          ),
        ),
        SizedBox(height: AppConstants.height30(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Text("Is healthy eating beneficial? Why? Is healthy eating beneficial? Why? Is healthy eating beneficial? Why? Is healthy eating beneficial? And why? Is healthy eating beneficial? Why? Is healthy eating beneficial? Why? Is healthy eating beneficial? Why? Is healthy eating beneficial? And why?",style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.height*.018
          ),),
        ),
      ],
    );
  }
}
