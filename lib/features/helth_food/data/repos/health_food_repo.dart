import 'package:dartz/dartz.dart';
import 'package:fetra/features/helth_food/data/models/meals_model.dart';
import '../../../../core/errors/failure.dart';

abstract class HealthFoodRepo{
  Future<Either<Failure,MealsModel>> getFood({required String numberMeals});
}