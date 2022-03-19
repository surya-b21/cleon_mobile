// ignore_for_file: prefer_const_constructors

import 'package:cleon_mobile/cubit/dashboard_cubit.dart';
import 'package:cleon_mobile/repositories/user_repositories.dart';
import 'package:cleon_mobile/utils/logo.dart';
import 'package:cleon_mobile/views/signin.dart';
import 'package:cleon_mobile/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatelessWidget {
  final UserRepository userRepository;
  const Dashboard({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(userRepository: userRepository),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state is SignInState) {
            return SignIn(
              userRepository: userRepository,
            );
          } else if (state is SignUpState) {
            return SignUp();
          } else {
            return Scaffold(
              backgroundColor: Color(0xff2F2E41),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogoSims(),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xff696D80),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(30),
                      width: 300,
                      height: 250,
                      child: SvgPicture.asset('assets/img/dashboard.svg'),
                    ),
                    SizedBox(
                      height: 125,
                    ),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff867EBA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                        onPressed: () {
                          context.read<DashboardCubit>().signIn();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff2F2E41),
                          side: BorderSide(
                            width: 3,
                            color: Color(0xff867EBA),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 25),
                        ),
                        onPressed: () {
                          context.read<DashboardCubit>().signUp();
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
