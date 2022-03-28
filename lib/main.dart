// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:cleon_mobile/app.dart';
import 'package:cleon_mobile/bloc/auth_bloc.dart';
import 'package:cleon_mobile/repositories/user_repositories.dart';
import 'package:cleon_mobile/routes.dart';
import 'package:cleon_mobile/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print(error);
  }
}

void main() {
  final UserRepository userRepository = UserRepository();
  BlocOverrides.runZoned(
      () => runApp(BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(userRepository: userRepository)..add(AppStart()),
            child: MyApp(
              userRepository: userRepository,
            ),
          )),
      blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp({Key? key, required this.userRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final routeGenerator = RouteGenerator();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cleon Mobile',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return App();
          }
          if (state is AuthUnauthenticated) {
            return Dashboard(
              userRepository: userRepository,
            );
          }
          if (state is AuthLoading) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text("Loading"),
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Text("Loading"),
                ],
              ),
            ),
          );
        },
      ),
      onGenerateRoute: routeGenerator.generate,
    );
  }
}
