import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {
  const SignupState();
  @override
  List<Object?> get props => [];
}

// class SignupInitialState extends SignupState {
//   const SignupInitialState();
// }

class SignupLoadingState extends SignupState {
  const SignupLoadingState();
}

class SignupLoadedState extends SignupState {
  const SignupLoadedState();
}

class SignupErrorState extends SignupState {
  final String message;
  const SignupErrorState(this.message);
  @override
  List<Object?> get props => [];
}
