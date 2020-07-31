import 'dart:async';
import 'package:login_flutter_bloc/src/bloc/validators.dart';

class LoginBloc  with Validators {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  //recuperar los datos del string

  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStrem => _passwordController.stream.transform(validarPassword);

  //insertar valores al stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }
}
