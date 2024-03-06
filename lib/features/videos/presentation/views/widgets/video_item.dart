import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/constants.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({super.key, required this.onTap});
final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                      child: Image.asset(AssetData.videoBanner,fit: BoxFit.fill,width: MediaQuery.of(context).size.width*.43,
                        height: MediaQuery.of(context).size.width*.43,),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(AppConstants.sp10(context)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xE8FFFFFF),
                      borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: MediaQuery.of(context).size.height*.03,
                  backgroundColor: const Color(0xff84C245),
                  child: SvgPicture.asset(AssetData.arrowRight,width: MediaQuery.of(context).size.height*.01,),
                )
              ],
            ),
          ),
          Text("Is healthy eating beneficial? And why?",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height*.018,
              fontWeight: FontWeight.w600,
            ),)
        ],
      ),
    );
  }
}
