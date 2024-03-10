import 'package:fetra/features/helth_food/data/models/meals_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class FoodItem extends StatefulWidget {
  const FoodItem({super.key, required this.instance});
  final Meal instance;

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  int qty=0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:AppConstants.width20(context),vertical: AppConstants.height30(context)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D000000),
                blurRadius: 8,
                spreadRadius: 0,
              )
            ]
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.instance.name!,style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height*.017,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff181818)
                  ),),
                  Text("Weight : ${widget.instance.weight!}",style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height*.015,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff4CAD73)
                  ),),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                    qty++;
                });
              },
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.height*.018,
                backgroundColor: const Color(0xff23AA49),
                child: const Icon(Icons.add,color: Colors.white,),
              ),
            ) ,
            SizedBox(width: AppConstants.width20(context),),
            Text("$qty",style: TextStyle(
              fontSize: MediaQuery.of(context).size.height*.02,
              fontWeight: FontWeight.w600,
            ),),
            SizedBox(width: AppConstants.width20(context),),
            InkWell(
              onTap: (){
                setState(() {
                  if(qty>0)
                    {
                      qty--;
                    }
                });
              },
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.height*.018,
                backgroundColor: const Color(0xffF3F5F7),
                child: const Icon(Icons.remove,color: Color(0xff979899),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
