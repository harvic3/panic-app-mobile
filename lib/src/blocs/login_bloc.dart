
import 'dart:async';

import 'package:panic_app/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  //final _userController = BehaviorSubject<dynamic>();

  Stream<String> get emailStream => _emailController.stream.transform(validateEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validatePassword);
  Stream<bool> get formLoginValidStream => Observable.combineLatest2(emailStream, passwordStream, (email, password) => true);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  //Function(dynamic) get setUser => _userController.sink.add;

  String get email => _emailController.value;
  String get password => _passwordController.value;
  //dynamic get user => _userController.value;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }

}