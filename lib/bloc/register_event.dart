// ignore_for_file: non_constant_identifier_names

part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterButtonPressed extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String password_confirmation;

  const RegisterButtonPressed({
    required this.name,
    required this.email,
    required this.password,
    required this.password_confirmation,
  });

  @override
  List<Object> get props => [name, email, password, password_confirmation];

  @override
  String toString() =>
      'RegisterButtonPressed { name : $name, email : $email, password : $password, password_confirmation : $password_confirmation }';
}
