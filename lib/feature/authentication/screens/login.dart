import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindpeers_assigment/colors.dart';
import 'package:mindpeers_assigment/core/app_configs/common_extension.dart';
import 'package:mindpeers_assigment/core/app_configs/constants.dart';
import 'package:mindpeers_assigment/core/app_configs/screen_names.dart';
import 'package:mindpeers_assigment/feature/authentication/cubit/login_cubit.dart';
import 'package:mindpeers_assigment/feature/authentication/cubit/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final TextTheme _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(
                  left: 18.0, right: 18, top: 24, bottom: 16),
              child: BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text(state.message ?? "Something Went worng")),
                    );
                  } else if (state is LoginSuccess) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      ScreenNames.landingScreen,
                      (Route<dynamic> route) => false,
                    );
                  }
                },
                child: Stack(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: _size.height * .05),
                          Image.asset(
                            Constants.userImage,
                            height: _size.height * .2,
                          ),
                          SizedBox(height: _size.height * .08),
                          Text(
                            "Let's sign you in",
                            style: _textTheme.headline5!.copyWith(
                                fontSize: 30,
                                color: Colors.white.withOpacity(.8),
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: _size.height * .01),
                          Text(
                            "Welcome Back,\nYou have been missed",
                            style: _textTheme.headline5!.copyWith(
                                fontSize: 26,
                                color: Colors.white.withOpacity(.8),
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: _size.height * .08),
                          Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: AppColors.searchBackgroundColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Colors.white.withOpacity(.5)),
                            ),
                            child: TextFormField(
                              cursorColor: Colors.white,
                              style: _textTheme.bodyText1!
                                  .copyWith(color: Colors.white),
                              controller: emailController,
                              decoration: InputDecoration(
                                labelStyle: _textTheme.bodyText2!
                                    .copyWith(color: Colors.white),
                                labelText: 'Email',
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                return value!.validateEmail();
                              },
                            ),
                          ),
                          // MindPeersTextField(
                          //   hintText: "Enter Email?",
                          //   onChanged: (value) {
                          //     value.validateEmail();
                          //   },
                          // ),
                          SizedBox(height: _size.height * .02),
                          Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: AppColors.searchBackgroundColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Colors.white.withOpacity(.5)),
                            ),
                            child: TextFormField(
                              obscureText: true,
                              cursorColor: Colors.white,
                              style: _textTheme.bodyText1!
                                  .copyWith(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: InputBorder.none,
                                labelStyle: _textTheme.bodyText2!
                                    .copyWith(color: Colors.white),
                              ),
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ),
                          // MindPeersTextField(
                          //   hintText: "Enter Password?",
                          //   obsecureText: true,
                          //   onChanged: (value) {},
                          // ),
                          SizedBox(height: _size.height * .08),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<LoginCubit>()
                                    .signInWithEmailPassword(
                                        email: emailController!.text,
                                        password: passwordController!.text);
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: _size.height * .06,
                              width: _size.width * .9,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "Sign In",
                                style: _textTheme.headline5!.copyWith(
                                    fontSize: 20,
                                    color: Colors.black.withOpacity(.8),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height,
                            width: double.infinity,
                            color:
                                AppColors.appBackgroundColor.withOpacity(0.4),
                            child: const CircularProgressIndicator(),
                          );
                        } else {
                          return Container();
                        }
                      },
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
