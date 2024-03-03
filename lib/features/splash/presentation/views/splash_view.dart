import 'package:fetra/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
//fayez
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            elevation: 0,
            systemOverlayStyle:  const SystemUiOverlayStyle(
              statusBarColor: Color(0xff3EBF87), // <-- SEE HERE
              statusBarIconBrightness: Brightness.light, //<-- For Android SEE HERE (dark icons)
              systemNavigationBarColor: Colors.white,
              statusBarBrightness: Brightness.dark, //<-- For iOS SEE HERE (dark icons)
            ),
          )
      ),
      body: const SplashViewBody(),
    );
  }
}
