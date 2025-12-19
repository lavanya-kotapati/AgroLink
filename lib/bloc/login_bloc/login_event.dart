import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class LoggedinEvent extends LoginEvent {
  final String email;
  final String password;
  LoggedinEvent(this.email, this.password);
  @override
  List<Object> get props => [];
}
