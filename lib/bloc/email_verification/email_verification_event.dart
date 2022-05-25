part of 'email_verification_bloc.dart';

abstract class EmailVerificationEvent extends Equatable {
  const EmailVerificationEvent();

  @override
  List<Object> get props => [];
}

class SendVerificationLink extends EmailVerificationEvent {}

class CheckingVerificationStatus extends EmailVerificationEvent {}

class VerifyingEmail extends EmailVerificationEvent {
  final Uri uri;

  const VerifyingEmail({required this.uri});

  @override
  List<Object> get props => [uri];

  @override
  String toString() => 'Verifying to ' + uri.toString();
}
