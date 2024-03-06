import 'package:go_router/go_router.dart';
import 'package:fetra/core/utils/assets/assets.dart';
import 'package:fetra/core/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/services/local_services/cache_keys.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (CacheKeysManger.onBoardingStatus()) {
        if(CacheKeysManger.tokenStatus() != "")
          {
            GoRouter.of(context).pushReplacement("/mainLayoutView");
          }else
            {
              GoRouter.of(context).pushReplacement("/introAuthView");
            }

      } else {
        GoRouter.of(context).pushReplacement("/onBoardingView");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child:  Padding(
              padding: EdgeInsets.all(AppConstants.sp30(context)),
              child: Image.asset(
                AssetData.logo,
              ),
            )
          ),
        ),
      ],
    );
  }
}
