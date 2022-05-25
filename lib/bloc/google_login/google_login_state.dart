part of 'google_login_bloc.dart';

abstract class GoogleLoginState extends Equatable {
  const GoogleLoginState();

  @override
  List<Object> get props => [];
}

class GoogleLoginInitial extends GoogleLoginState {}
