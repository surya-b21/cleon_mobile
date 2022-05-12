import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'google_login_event.dart';
part 'google_login_state.dart';

class GoogleLoginBloc extends Bloc<GoogleLoginEvent, GoogleLoginState> {
  GoogleLoginBloc() : super(GoogleLoginInitial()) {
    on<GoogleLoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
