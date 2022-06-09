part of 'google_login_bloc.dart';

abstract class GoogleLoginEvent extends Equatable {
  const GoogleLoginEvent();

  @override
  List<Object> get props => [];
}

class GoogleButtonOnPressed extends GoogleLoginEvent {
  final GoogleSignInAccount account;

  const GoogleButtonOnPressed({required this.account});

  @override
  List<Object> get props => [account];

  @override
  String toString() => 'Google Account : $account';
}
