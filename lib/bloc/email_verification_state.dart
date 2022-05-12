part of 'email_verification_bloc.dart';

abstract class EmailVerificationState extends Equatable {
  const EmailVerificationState();

  @override
  List<Object> get props => [];
}

class EmailVerificationInitial extends EmailVerificationState {}

class EmailVerificated extends EmailVerificationState {}

class EmailUnverificated extends EmailVerificationState {}

class EmailVerificationLoading extends EmailVerificationState {}
