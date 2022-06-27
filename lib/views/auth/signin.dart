// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cleon_mobile/bloc/auth/auth_bloc.dart';
import 'package:cleon_mobile/bloc/google_login/google_login_bloc.dart';
import 'package:cleon_mobile/bloc/login/login_bloc.dart';
import 'package:cleon_mobile/cubit/dashboard/dashboard_cubit.dart';
import 'package:cleon_mobile/api/user_repositories.dart';
import 'package:cleon_mobile/views/auth/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  final UserRepository userRepository;
  const SignIn({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2A2F4A),
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                context.read<DashboardCubit>().back();
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        backgroundColor: Color(0xff2A2F4A),
        body: MultiBlocProvider(
          providers: [
            BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(
                  userRepository: userRepository,
                  authBloc: BlocProvider.of<AuthBloc>(context)),
            ),
            BlocProvider<GoogleLoginBloc>(
                create: (context) => GoogleLoginBloc(
                    authBloc: BlocProvider.of<AuthBloc>(context)))
          ],
          child: LoginForm(userRepository: userRepository),
        )
        // BlocProvider<LoginBloc>(
        //   create: (context) => LoginBloc(
        //     userRepository: userRepository,
        //     authBloc: BlocProvider.of<AuthBloc>(context),
        //   ),
        //   child: LoginForm(
        //     userRepository: userRepository,
        //   ),
        // ),
        );
  }
}
