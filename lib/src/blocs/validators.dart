

import 'dart:async';

class Validators {

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp rexEmail = new RegExp(pattern);
      if (rexEmail.hasMatch(email)){
        sink.add(email);
      } else {
        sink.addError('El formato del correo no es correcto');
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if (password != null && password.length >= 6) {
        sink.add(password);
      } else {
        sink.addError('El mínimo son 6 caracteres');
      }
    }
  );

}