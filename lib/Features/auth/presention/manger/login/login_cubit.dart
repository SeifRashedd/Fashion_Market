import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser({required email, required password}) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        emit(const LoginFailure(errMessage: 'wrong email'));
      } else if (e.code == 'invalid-credential') {
        emit(const LoginFailure(
            errMessage: 'Wrong password provided for that user'));
      }
    } catch (e) {
      emit(const LoginFailure(
          errMessage: 'somthing went wrong please tryagin later'));
    }
  }
}
