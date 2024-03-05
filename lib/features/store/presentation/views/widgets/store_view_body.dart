import 'package:fetra/features/store/presentation/views/widgets/store_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/shared_widgets/custom_tabs_categories_with_image.dart';
import '../../../../../core/shared_widgets/default_text_form_field.dart';
import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';

class StoreViewBody extends StatefulWidget {
  const StoreViewBody({super.key});

  @override
  State<StoreViewBody> createState() => _StoreViewBodyState();
}

class _StoreViewBodyState extends State<StoreViewBody> {
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
        SizedBox(height: AppConstants.height10(context),),
        const CustomTabsCategoriesWithImage(categories: ["vegetables","baked goods"],),
        SizedBox(height: AppConstants.height10(context),),
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
                  childAspectRatio: 0.66),
              itemBuilder: (context, index) {
                return const StoreItem();
              }),
        ),
      ],
    );
  }
}
