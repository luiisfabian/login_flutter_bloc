import 'package:flutter/material.dart';
import 'package:login_flutter_bloc/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  final loginBloc = new LoginBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of (BuildContext context){
   return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

}
