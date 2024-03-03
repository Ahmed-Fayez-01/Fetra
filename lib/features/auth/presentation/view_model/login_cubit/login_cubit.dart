import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fetra/core/utils/services/local_services/cache_helper.dart';
import '../../../data/repos/auth_repo.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  AuthRepo? authRepo;
  Future<void> loginUser({String? email,String? phone,required String password}) async {
    emit(UserLoginLoadingState());
    var result = await authRepo!.loginUser(email: email,phone: phone ,password: password);
    return result.fold((failure) {
      emit(UserLoginErrorState(failure.errMessage));
    }, (data) {
      CacheHelper.saveData(key: "token", value: data.data!.token);
      emit(UserLoginSuccessState());
    });
  }
}
