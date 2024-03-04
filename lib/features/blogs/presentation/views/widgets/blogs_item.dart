import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/constants.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: Container(
        padding: EdgeInsets.all(AppConstants.sp20(context)),
        decoration: BoxDecoration(
          color: const Color(0xffFAFAFB),
          borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: AppConstants.height20(context),
                  backgroundColor: const Color(0xffF93A00),
                  child: Text("UX",style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height*.016,
                      fontWeight: FontWeight.w600
                  ),),
                ),
                SizedBox(width: AppConstants.width10(context),),
                Text("Ahmed Fayez",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).size.height*.016
                ),)
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text("Is healthy eating beneficial? And why?",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.height*.02
                  ),),
                ),
                SizedBox(width: AppConstants.width10(context),),
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                  child: CachedNetworkImage(
                    width: MediaQuery.of(context).size.width*.3,
                    height: MediaQuery.of(context).size.width*.3,
                    imageUrl:"https://cdn.britannica.com/36/123536-050-95CB0C6E/Variety-fruits-vegetables.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConstants.height10(context),),
            Row(
              children: [
                Expanded(
                  child: Text("18 hours ago",style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff8B8C91),
                      fontSize: MediaQuery.of(context).size.height*.016
                  ),),
                ),
                SvgPicture.asset(AssetData.more),

              ],
            ),
            SizedBox(height: AppConstants.height10(context),),
            Text("Is healthy eating beneficial? Why? Is healthy eating beneficial? Why? Is healthy eating beneficial? Why? Is healthy eating beneficial? And why?",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: const Color(0xff2F315A),
                  fontSize: MediaQuery.of(context).size.height*.016,
                  fontWeight: FontWeight.w500
              ),),
          ],
        ),
      ),
    );
  }
}
