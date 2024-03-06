import 'package:fetra/features/videos/presentation/views/video_details_view.dart';
import 'package:fetra/features/videos/presentation/views/widgets/video_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared_widgets/custom_tabs_item.dart';
import '../../../../../core/utils/constants.dart';

class VideoViewBody extends StatelessWidget {
  const VideoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: AppConstants.height20(context),),
        const CustomTabsItem(categories: ["Health","General","Football"],),
        SizedBox(height: AppConstants.height20(context),),

        Expanded(
          child: GridView.builder(
              padding: EdgeInsets.symmetric(
                  vertical:
                  AppConstants.height10(context),
                  horizontal:
                  AppConstants.width20(context)),
              itemCount: 6,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing:
                  AppConstants.width10(
                      context),
                  mainAxisSpacing:
                  AppConstants.height10(
                      context),
                  childAspectRatio: .8),
              itemBuilder: (context, index) {
                return  VideoItem(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const VideoDetailsView()));
                },);
              }),
        ),
      ],
    );
  }
}
