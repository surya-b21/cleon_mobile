import 'package:bloc/bloc.dart';
import 'package:cleon_mobile/api/google_signin_api.dart';
import 'package:cleon_mobile/api/user_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
      final _storage = const FlutterSecureStorage();
      if (await _storage.read(key: 'google-account') != null) {
        await GoogleSignInApi.logout();
      }

      bool logout = await userRepository.logout();
      if (logout) {
        emit(AuthUnauthenticated());
      }
    });
  }
}
