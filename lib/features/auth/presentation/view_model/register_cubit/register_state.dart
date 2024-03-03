part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class UserRegisterLoadingState extends RegisterState {}
class UserRegisterSuccessState extends RegisterState {}
class UserRegisterErrorState extends RegisterState {
  final String errMessage;
  UserRegisterErrorState(this.errMessage);
}
