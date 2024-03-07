
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:fetra/core/errors/failure.dart';

import 'package:fetra/features/profile/data/models/sleeping_model.dart';

import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';
import 'profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService? apiService;

  ProfileRepoImpl(this.apiService);

  @override
  Future<Either<Failure, SleepingModel>> testSleeping({required String from, required String to}) async{
    try {
      var response = await apiService!.postData(
        endPoint:  EndPoints.sleepingTest,
        data: {
          "start_time":from,
          "end_time":to,
        },
        sendToken: true
      );
      var result = SleepingModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

}
