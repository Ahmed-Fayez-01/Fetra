import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:fetra/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:fetra/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:fetra/features/blogs/data/repos/blog_repo_impl.dart';
import 'package:fetra/features/blogs/presentation/view_models/change_tabs_cubit/change_tabs_cubit.dart';
import 'package:fetra/features/blogs/presentation/view_models/get_all_categories_blog/get_all_categories_blog_cubit.dart';
import 'package:fetra/features/blogs/presentation/view_models/get_blogs_by_id/get_blogs_by_id_cubit.dart';
import 'package:fetra/features/profile/data/repos/profile_repo_impl.dart';
import 'package:fetra/features/profile/presentation/view_models/change_subscription_cubit/change_subscription_cubit.dart';
import 'package:fetra/features/profile/presentation/view_models/test_sleeping/test_sleeping_cubit.dart';
import 'package:fetra/features/store/data/repos/store_repo_impl.dart';
import 'package:fetra/features/store/presentation/view_models/get_product_details/get_product_details_cubit.dart';
import 'package:fetra/features/store/presentation/view_models/get_store_by_id/get_store_by_id_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/roots/app_router.dart';
import 'core/utils/services/local_services/cache_helper.dart';
import 'core/utils/services/local_services/cache_keys.dart';
import 'core/utils/services/remote_services/service_locator.dart';
import 'core/utils/theme/app_theme.dart';

import 'features/auth/data/repos/auth_repo_impl.dart';
import 'features/main_layout/view_model/change_nav_bar_status/change_nav_bar_status_cubit.dart';
import 'features/store/presentation/view_models/change_tabs_image_cubit/change_tabs_image_cubit.dart';
import 'features/store/presentation/view_models/get_all_categories_store/get_all_categories_store_cubit.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterError.onError = (details) {
  //   if (details.exception is! NetworkImageLoadException) throw details.exception;
  // };
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  setup();
  print("token : ${CacheKeysManger.tokenStatus()}");
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale("ar"), Locale("en")],
        saveLocale: true,
        path: "lib/core/language", // <-- change the path of the translation files
        child: const Fetra()),
  );
}

class Fetra extends StatelessWidget {
  const Fetra({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChangeNavBarStatusCubit()),
        BlocProvider(create: (context) => ChangeTabsCubit()),
        BlocProvider(create: (context) => ChangeTabsImageCubit()),
        BlocProvider(create: (context) => ChangeSubscriptionCubit()),
        BlocProvider(
            create: (context) => LoginCubit(
              getIt.get<AuthRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => GetAllCategoriesBlogCubit(
              getIt.get<BlogRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => GetBlogsByIdCubit(
              getIt.get<BlogRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => TestSleepingCubit(
              getIt.get<ProfileRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => GetAllCategoriesStoreCubit(
              getIt.get<StoreRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => GetStoreByIdCubit(
              getIt.get<StoreRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => GetProductDetailsCubit(
              getIt.get<StoreRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => RegisterCubit(
              getIt.get<AuthRepoImpl>(),
            )),
      ],
      child: MaterialApp.router(
        title: "FETRA",
        theme: themeDataLight,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
