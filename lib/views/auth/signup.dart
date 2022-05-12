// ignore_for_file: prefer_const_constructors

import 'package:cleon_mobile/bloc/auth_bloc.dart';
import 'package:cleon_mobile/bloc/register_bloc.dart';
import 'package:cleon_mobile/api/user_repositories.dart';
import 'package:cleon_mobile/views/auth/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/dashboard_cubit.dart';

class SignUp extends StatelessWidget {
  final UserRepository userRepository;
  const SignUp({Key? key, required this.userRepository}) : super(key: key);

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
      body: BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(
            authBloc: BlocProvider.of<AuthBloc>(context),
            userRepository: userRepository),
        child: RegisterForm(userRepository: userRepository),
      ),
    );
  }
}
