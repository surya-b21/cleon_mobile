import 'package:bloc/bloc.dart';
import 'package:cleon_mobile/bloc/auth/auth_bloc.dart';
import 'package:cleon_mobile/api/user_repositories.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;
  final AuthBloc authBloc;
  RegisterBloc({required this.userRepository, required this.authBloc})
      : super(RegisterInitial()) {
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterLoading());
      try {
        final String token = await userRepository.register(event.name,
            event.email, event.password, event.password_confirmation);
        authBloc.add(LoggedIn(token: token));
        emit(RegisterInitial());
      } catch (e) {
        emit(RegisterFailed(error: e.toString()));
      }
    });
  }
}
