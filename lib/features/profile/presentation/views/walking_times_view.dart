import 'package:fetra/features/profile/presentation/views/widgets/sleeping_schedules_view_body.dart';
import 'package:fetra/features/profile/presentation/views/widgets/walking_times_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/assets/assets.dart';

class WalkingTimesView extends StatelessWidget {
  const WalkingTimesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:  const SystemUiOverlayStyle(
          statusBarColor: Colors.white, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          systemNavigationBarColor: Colors.white,
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        title: const Text("Walking Times",style: TextStyle(
        ),),
        leading: InkWell(onTap: (){
          Navigator.pop(context);
        },child: SvgPicture.asset(AssetData.arrowLeft,fit: BoxFit.scaleDown,color: Colors.black,)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: const WalkingTimesViewBody(),
    );
  }
}
