import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindpeers_assigment/core/auth_services.dart';
import 'package:mindpeers_assigment/feature/authentication/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService authService;
  LoginCubit({required this.authService}) : super(LoginInit());

  void signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      emit(LoginLoading());
      await authService.login(email: email, password: password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError("Something went wrong", e.toString()));
    }
  }

  void signOut() async {
    try {
      await authService.signOut();
    } catch (e) {
      debugPrint("");
    }
  }
}
