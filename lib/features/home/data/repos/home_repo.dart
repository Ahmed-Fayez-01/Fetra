import 'package:dartz/dartz.dart';
import 'package:fetra/features/home/data/models/slider_model.dart';
import '../../../../core/errors/failure.dart';

abstract class HomeRepo{
  Future<Either<Failure,SliderModel>> getSlider();
}