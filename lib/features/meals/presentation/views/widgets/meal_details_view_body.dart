import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class MealDetailsViewBody extends StatelessWidget {
  const MealDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppConstants.height20(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Text("The Components :",style: TextStyle(
              fontWeight: FontWeight.w600,
              color: const Color(0xff303030),
              fontSize: MediaQuery.of(context).size.height*.019
          ),),
        ),
        SizedBox(height: AppConstants.height10(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Text("One each: tomato, cucumber, green pepper, yellow pepper, and red pepper. Three tablespoons of olive oil. black pepper. Small spoon of salt. A teaspoon of cumin",style: TextStyle(
              fontWeight: FontWeight.w500,
              color: const Color(0xff666666),
              fontSize: MediaQuery.of(context).size.height*.017
          ),),
        ),
        SizedBox(height: AppConstants.height20(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Text("How to prepare : ",style: TextStyle(
              fontWeight: FontWeight.w600,
              color: const Color(0xff303030),
              fontSize: MediaQuery.of(context).size.height*.019
          ),),
        ),
        SizedBox(height: AppConstants.height10(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Text("""Cut the tomatoes into wings and cut the cucumber, celery, green onions, and three types of bell peppers into slices.
Mix lemon juice, sesame oil, olive oil, pepper, salt, and cumin to get the seasoning.
Mix all the vegetables with green salad leaves and mushrooms to get a salad.
Mix the salad with the dressing, then put it in a serving bowl
          """,style: TextStyle(
              fontWeight: FontWeight.w500,
              color: const Color(0xff666666),
              fontSize: MediaQuery.of(context).size.height*.017
          ),),
        ),
      ],
    );
  }
}
