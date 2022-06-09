import 'package:bloc/bloc.dart';
import 'package:cleon_mobile/api/google_signin_api.dart';
import 'package:cleon_mobile/bloc/auth/auth_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'google_login_event.dart';
part 'google_login_state.dart';

class GoogleLoginBloc extends Bloc<GoogleLoginEvent, GoogleLoginState> {
  final AuthBloc authBloc;
  GoogleLoginBloc({required this.authBloc}) : super(GoogleLoginInitial()) {
    on<GoogleButtonOnPressed>((event, emit) async {
      emit(GoogleLoginLoading());
      var auth = await event.account.authentication;
      try {
        String jwt = await GoogleSignInApi.getToken(auth.accessToken);
        authBloc.add(LoggedIn(token: jwt));
        emit(GoogleLoginInitial());
      } catch (e) {
        emit(GoogleLoginFailure(error: e.toString()));
      }
    });
  }
}
