import 'package:flutter/material.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/constants.dart';
import '../meal_details_view.dart';
import 'meal_item.dart';

class MealsViewBody extends StatelessWidget {
  const MealsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppConstants.height20(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Text("Recipes for Salad dishes:",style: TextStyle(
            fontWeight: FontWeight.w600,
            color: const Color(0xff303030),
            fontSize: MediaQuery.of(context).size.height*.019
          ),),
        ),
        SizedBox(height: AppConstants.height20(context),),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppConstants.width30(context)),
                child:  Row(
                  children: [
                    Expanded(child: MealItem(backColor: const Color(0x1AF8A44C), borderColor:  const Color(0xB2F8A44C), title: 'Healthy Salad', icon: AssetData.healthSalad, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const MealDetailsView(title: 'Healthy Salad',)));
                    },)),
                    SizedBox(width: AppConstants.width20(context),),
                    Expanded(child: MealItem(backColor: const Color(0x1A53B175), borderColor:  const Color(0xB253B175), title: 'Vegetable Salad', icon: AssetData.vegitablesSalad, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const MealDetailsView(title: 'Vegetable Salad',)));
                    },)),
                  ],
                ),
              ),
              SizedBox(height: AppConstants.height20(context),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppConstants.width30(context)),
                child:  Row(
                  children: [
                    Expanded(child: MealItem(backColor: const Color(0x40F7A593), borderColor:  const Color(0xffF7A593), title: 'Green Salad', icon: AssetData.greenSalad, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const MealDetailsView(title: 'Green Salad',)));
                    },)),
                    SizedBox(width: AppConstants.width20(context),),
                    Expanded(child: MealItem(backColor: const Color(0x40D3B0E0), borderColor:  const Color(0xffD3B0E0), title: 'Falafel Salad', icon: AssetData.paperSalad, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const MealDetailsView(title: 'Falafel Salad',)));

                    },)),
                  ],
                ),
              ),
              SizedBox(height: AppConstants.height20(context),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppConstants.width30(context)),
                child:  Row(
                  children: [
                    Expanded(child: MealItem(backColor: const Color(0xffE6F0F5), borderColor:  const Color(0xffB7DFF5), title: 'Fruit Salad', icon: AssetData.fruitSalad, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const MealDetailsView(title: 'Fruit Salad',)));

                    },)),
                    SizedBox(width: AppConstants.width20(context),),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ),
              SizedBox(height: AppConstants.height20(context),),
            ],
          ),
        )
      ],
    );
  }
}
