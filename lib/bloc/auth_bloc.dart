import 'package:bloc/bloc.dart';
import 'package:cleon_mobile/api/user_repositories.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepository userRepository;

  AuthBloc({required this.userRepository}) : super(AuthInitial()) {
    on<AppStart>((event, emit) async {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthUnauthenticated());
      }
    });
    on<LoggedIn>((event, emit) async {
      emit(AuthLoading());
      await userRepository.saveToken(event.token);
      emit(AuthAuthenticated());
    });
    on<Logout>((event, emit) async {
      emit(AuthLoading());
      bool logout = await userRepository.logout();
      if (logout) {
        emit(AuthUnauthenticated());
      }
    });
  }
}
