
import 'package:fetra/features/main_layout/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:fetra/features/main_layout/view_model/change_nav_bar_status/change_nav_bar_status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_widgets/exit_alert.dart';

class MainLayoutView extends StatelessWidget {
  MainLayoutView({super.key});

  List<Widget> screens = [
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    // const HomeView(),
    // const FavouritesView(),
    // const BlogsView(),
    // const CartView(),
    // const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    var cubit = ChangeNavBarStatusCubit.get(context);
    return WillPopScope(
      onWillPop: () async {
        exitDialog(context);
        return true;
      },
      child: BlocBuilder<ChangeNavBarStatusCubit, ChangeNavBarStatusState>(builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0.0), // here the desired height
              child: AppBar(
                elevation: 0,
                systemOverlayStyle:  const SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness:Brightness.dark,
                  systemNavigationBarColor: Colors.white,
                  statusBarBrightness: Brightness.light,
                ),
              ),
          ),
          body: Column(
            children: [
              Expanded(child: screens[cubit.currentIndex]),
              const BottomNavBar(),
            ],
          ),

        );
      }),
    );
    // bottomNavigationBar: const ,
  }
}
