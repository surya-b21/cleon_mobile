part of 'google_login_bloc.dart';

abstract class GoogleLoginState extends Equatable {
  const GoogleLoginState();

  @override
  List<Object> get props => [];
}

class GoogleLoginInitial extends GoogleLoginState {}

class GoogleLoginLoading extends GoogleLoginState {}

class GoogleLoginFailure extends GoogleLoginState {
  final String error;

  const GoogleLoginFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
