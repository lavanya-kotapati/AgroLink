import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_my_idea/bloc/signup_bloc/signup_event.dart';
import 'package:make_my_idea/bloc/signup_bloc/signup_service.dart';
import 'package:make_my_idea/bloc/signup_bloc/signup_state.dart';

class SignupBloc extends Bloc<SignedupEvent, SignupState> {
  final SupabaseAuthService _Authservice;
  SignupBloc(this._Authservice) : super(SignupLoadingState());
}
