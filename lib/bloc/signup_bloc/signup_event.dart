import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
  @override
  List<Object?> get props => [];
}

class SignedupEvent extends SignupEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  const SignedupEvent(
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
  );
  @override
  List<Object?> get props => [];
}
