import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindpeers_assigment/core/auth_services.dart';

GetIt getIt = GetIt.instance;

void serviceLoactor() {
  getIt.registerFactory<AuthService>(
      () => AuthService(firebaseAuth: FirebaseAuth.instance));
}
