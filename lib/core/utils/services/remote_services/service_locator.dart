import 'package:dio/dio.dart';
import 'package:fetra/features/home/data/repos/home_repo_impl.dart';
import 'package:fetra/features/profile/data/repos/profile_repo_impl.dart';
import 'package:fetra/features/store/data/repos/store_repo_impl.dart';
import 'package:fetra/features/trainers/data/repos/trainer_repo_impl.dart';
import 'package:fetra/features/videos/data/repos/video_repo_impl.dart';
import 'package:get_it/get_it.dart';
import '../../../../features/auth/data/repos/auth_repo_impl.dart';
import '../../../../features/blogs/data/repos/blog_repo_impl.dart';
import 'api_service.dart';
//dependency Injection

final  getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<BlogRepoImpl>(BlogRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<ProfileRepoImpl>(ProfileRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<StoreRepoImpl>(StoreRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<VideoRepoImpl>(VideoRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<TrainerRepoImpl>(TrainerRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
}