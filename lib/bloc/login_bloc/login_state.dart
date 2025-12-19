import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginEventLoadingState extends LoginState {
  const LoginEventLoadingState();
  @override
  List<Object> get props => [];
}

class LoginEventLoadedState extends LoginState {
  const LoginEventLoadedState();
  @override
  List<Object> get props => [];
}

class LoginEventErrorState extends LoginState {
  final String errorString;
  const LoginEventErrorState(this.errorString);
  @override
  List<Object> get props => [errorString];
}
