import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tiny_music/models/account.dart';
import 'package:tiny_music/server_data/apis.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginChange(LoginStatus.nologin));

  final _account = Account();

  Future<bool> loginSubmit(String url, String username, String password) async {
    emit(const LoginChange(LoginStatus.loading));
    _account
      ..baseUrl = url
      ..username = username
      ..password = password;
    final res = await Apis.checkServer();
    if (res) {
      emit(const LoginChange(LoginStatus.success));
      _account.saveToHive();
    } else {
      emit(const LoginChange(LoginStatus.nologin));
      _account.resetAccount();
    }
    return res;
  }
}
