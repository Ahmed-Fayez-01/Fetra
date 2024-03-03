import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../model/auth_model.dart';
import '../model/countires_model.dart';

abstract class AuthRepo{
  Future<Either<Failure,AuthModel>> loginUser({String? email,String? phone,required String password});
  Future<Either<Failure,AuthModel>> registerUser({required String email,required String password,required String phone});
  Future<Either<Failure,CountriesModel>> getCountries();
}