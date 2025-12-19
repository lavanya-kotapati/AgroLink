import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_my_idea/bloc/login_bloc/login_event.dart';
import 'package:make_my_idea/bloc/login_bloc/login_service.dart';
import 'package:make_my_idea/bloc/login_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginService loginService;
  LoginBloc(this.loginService) : super(LoginEventLoadingState()) {
    on<LoggedinEvent>(userlogin);
  }
  Future<void> userlogin(LoggedinEvent event, Emitter<LoginState> emit) async {
    emit(LoginEventLoadingState());
    try {
      await loginService.loginwithpassword(
        email: event.email,
        password: event.password,
      );
      emit(LoginEventLoadedState());
    } catch (e) {
      emit(LoginEventErrorState(e.toString()));
    }
  }
}
