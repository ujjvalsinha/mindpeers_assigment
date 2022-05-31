import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindpeers_assigment/core/auth_services.dart';
import 'package:get_it/get_it.dart';
import 'package:mindpeers_assigment/core/dependecy_injection/service_locator.dart';
import 'package:mindpeers_assigment/feature/authentication/cubit/login_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mindpeers_assigment/feature/landing_screen.dart';

class MindPeersMaterial extends StatefulWidget {
  const MindPeersMaterial({Key? key}) : super(key: key);

  @override
  State<MindPeersMaterial> createState() => _MindPeersMaterialState();
}

class _MindPeersMaterialState extends State<MindPeersMaterial> {
  bool _firebaseInitialized = false;
  String errorString = '';
//  bool _error = false;
  @override
  void initState() {
    super.initState();
    initializeFlutterFire();
  }

  Future<void> initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();

      serviceLoactor();

      setState(() {
        _firebaseInitialized = true;
      });
    } catch (e) {
      setState(() {
        errorString = e.toString();
        //  _error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_firebaseInitialized) {
      return MaterialApp(
        // navigatorKey: navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          body: SizedBox(),
        ),
      );
    } else {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(
              authService: GetIt.I<AuthService>(),
            ),
            child: Container(),
          )
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LandingScreen(),
        ),
      );
    }
  }
}
