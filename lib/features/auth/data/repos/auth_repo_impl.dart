import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fetra/core/errors/failure.dart';
import 'package:fetra/features/auth/data/model/countires_model.dart';

import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';
import '../model/auth_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService? apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AuthModel>> loginUser(
      {String? email, String? phone, required String password}) async {
    try {
      var response = await apiService!.postData(endPoint: EndPoints.userLogin, data: {
        "email": email,
        "phone": phone,
        "password": password,
      });
      var result = AuthModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AuthModel>> registerUser(
      {required String email, required String password, required String phone}) async {
    try {
      var response = await apiService!.postData(endPoint: EndPoints.userRegister, data: {
        "email": email,
        "password": password,
        "phone": phone,
      });
      var result = AuthModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CountriesModel>> getCountries() async {
    try {
      var response = await apiService!.get(endPoint: EndPoints.getCountries);
      var result = CountriesModel.fromJson(response.data);
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
