import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerUser({required String email,required String username,required String password}) async {
    try {
      emit(RegisterLoading());
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await userCredential.user!.updateProfile(displayName: username);

      await userCredential.user!.reload();
      User? updatedUser = FirebaseAuth.instance.currentUser;

      if (updatedUser != null) {
        username = updatedUser.displayName!;
      }
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(const RegisterFailure(errMessage: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(const RegisterFailure(errMessage: 'email-already-in-use'));

      } else {}
    }
  }
}
