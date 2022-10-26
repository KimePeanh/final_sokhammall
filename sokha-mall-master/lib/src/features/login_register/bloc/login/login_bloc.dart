import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sokha_mall/src/features/category/models/category.dart';
import 'package:sokha_mall/src/features/login_register/bloc/login/login_event.dart';
import 'package:sokha_mall/src/features/login_register/bloc/login/login_state.dart';
import 'package:sokha_mall/src/features/login_register/repositories/login_register_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late List<Category> category;
  LoginRegisterRepository _loginRegisterRepository = LoginRegisterRepository();
  @override
  LoginBloc() : super(Initializing());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginPressed) {
      yield Logging();
      try {
        final String _token = await _loginRegisterRepository.login(
            phone: event.phoneNumber, password: event.password);
        yield Logged(token: _token);
      } catch (e) {
        yield ErrorLogin(error: e.toString());
      }
    }
  }
}
