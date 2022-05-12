// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cleon_mobile/bloc/auth_bloc.dart';
import 'package:cleon_mobile/bloc/login_bloc.dart';
import 'package:cleon_mobile/cubit/dashboard_cubit.dart';
import 'package:cleon_mobile/repositories/user_repositories.dart';
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
        backgroundColor: Color(0xff2F2E41),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              context.read<DashboardCubit>().back();
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      backgroundColor: Color(0xff2F2E41),
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(
          userRepository: userRepository,
          authBloc: BlocProvider.of<AuthBloc>(context),
        ),
        child: LoginForm(
          userRepository: userRepository,
        ),
      ),
    );
  }
}
