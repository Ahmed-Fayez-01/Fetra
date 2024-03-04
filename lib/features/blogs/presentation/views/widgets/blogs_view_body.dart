import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetra/core/utils/assets/assets.dart';
import 'package:fetra/core/utils/constants.dart';
import 'package:fetra/features/blogs/presentation/views/widgets/blogs_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/shared_widgets/custom_tabs_item.dart';

class BlogsViewBody extends StatelessWidget {
  const BlogsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: AppConstants.height20(context),),
        const CustomTabsItem(categories: ["Health","General","Football"],),
        SizedBox(height: AppConstants.height20(context),),
        Expanded(
          child: ListView.separated(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
            return const BlogItem();
          }, separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: AppConstants.height20(context),);
          },),
        )
      ],
    );
  }
}
