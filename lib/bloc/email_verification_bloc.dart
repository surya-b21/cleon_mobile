import 'package:bloc/bloc.dart';
import 'package:cleon_mobile/api/user_repositories.dart';
import 'package:equatable/equatable.dart';

part 'email_verification_event.dart';
part 'email_verification_state.dart';

class EmailVerificationBloc
    extends Bloc<EmailVerificationEvent, EmailVerificationState> {
  final UserRepository userRepository;

  EmailVerificationBloc({required this.userRepository})
      : super(EmailVerificationInitial()) {
    on<CheckingVerificationStatus>((event, emit) async {
      final bool verificated = await userRepository.cekVerifikasiEmail();

      if (verificated) {
        emit(EmailVerificated());
      } else {
        emit(EmailUnverificated());
      }
    });
    on<SendVerificationLink>((event, emit) async {
      emit(EmailVerificationLoading());
      await userRepository.cekVerifikasiEmail();
      emit(EmailUnverificated());
    });
    on<VerifyingEmail>((event, emit) async {
      await userRepository.verifyEmail(event.uri);
    });
  }
}
