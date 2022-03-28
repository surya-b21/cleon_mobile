part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStart extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final String token;

  const LoggedIn({required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class Logout extends AuthEvent {}
