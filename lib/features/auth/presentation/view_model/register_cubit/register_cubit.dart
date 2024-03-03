import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../core/utils/services/local_services/cache_helper.dart';
import '../../../data/repos/auth_repo.dart';


part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  AuthRepo? authRepo;
  Future<void> registerUser({required String email,required String password,required String phone}) async {
    emit(UserRegisterLoadingState());
    var result = await authRepo!.registerUser(email: email, password: password, phone: phone);
    return result.fold((failure) {
      emit(UserRegisterErrorState(failure.errMessage));
    }, (data) {
      CacheHelper.saveData(key: "token", value: data.data!.token);
      emit(UserRegisterSuccessState());
    });
  }
}
