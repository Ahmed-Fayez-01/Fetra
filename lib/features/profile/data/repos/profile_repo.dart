import 'package:dartz/dartz.dart';
import 'package:fetra/features/profile/data/models/sleeping_model.dart';
import '../../../../core/errors/failure.dart';

abstract class ProfileRepo{
  Future<Either<Failure,SleepingModel>> testSleeping({required String from,required String to});
}