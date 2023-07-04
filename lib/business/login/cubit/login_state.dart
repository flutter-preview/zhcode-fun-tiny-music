part of 'login_cubit.dart';

enum LoginStatus {
  success,
  loading,
  nologin,
}

sealed class LoginState extends Equatable {
  const LoginState(this.loginStatus);

  final LoginStatus loginStatus;

  @override
  List<Object> get props => [loginStatus];
}

class LoginChange extends LoginState {
  const LoginChange(super.loginStatus);
}
