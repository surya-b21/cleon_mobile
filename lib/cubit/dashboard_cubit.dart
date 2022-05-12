import 'package:bloc/bloc.dart';
import 'package:cleon_mobile/repositories/user_repositories.dart';
part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final UserRepository userRepository;
  DashboardCubit({required this.userRepository}) : super(DashboardInitial());

  void signIn() => emit(SignInState());

  void signUp() => emit(SignUpState());

  void back() => emit(DashboardInitial());
}
