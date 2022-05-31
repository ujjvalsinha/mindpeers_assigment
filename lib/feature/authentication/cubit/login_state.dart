import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInit extends LoginState {
  final String? email;
  final String? password;
  LoginInit({this.email, this.password});

  @override
  List<Object?> get props => [email, password];
}

class LoginSuccess extends LoginState {
  //final bool isNewUser;
  // LoginSuccess(
  //   //this.isNewUser
  //   //);
  @override
  List<Object> get props => [
        'LoginSuccess'
        // isNewUser
      ];
}

class LoginError extends LoginState {
  final String? title;
  final String? message;
  LoginError(this.title, this.message);
  @override
  List<Object?> get props => [title, message];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => ['LoginLoading'];
}
