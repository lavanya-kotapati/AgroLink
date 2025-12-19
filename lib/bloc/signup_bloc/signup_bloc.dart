import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_my_idea/bloc/signup_bloc/signup_event.dart';
import 'package:make_my_idea/bloc/signup_bloc/signup_service.dart';
import 'package:make_my_idea/bloc/signup_bloc/signup_state.dart';

class SignupBloc extends Bloc<SignedupEvent, SignupState> {
  final SupabaseAuthService _Authservice;
  SignupBloc(this._Authservice) : super(SignupLoadingState()) {
    on<SignedupEvent>(_userSignUp);
  }
  Future<void> _userSignUp(
    SignedupEvent event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoadingState());
    if (event.password != event.confirmPassword) {
      emit(
        SignupErrorState(
          'The passwords you entered do not match. Please try again!',
        ),
      );
      return;
    }
    if (event.email.isEmpty || event.password.isEmpty || event.name.isEmpty) {
      emit(SignupErrorState('Please fill all the fields!'));
      return;
    }
    try {
      await _Authservice.Signup(
        email: event.email,
        password: event.password,
        name: event.name,
      );
      emit(SignupLoadedState());
    } catch (e) {
      emit(SignupErrorState(e.toString()));
    }
  }
}
