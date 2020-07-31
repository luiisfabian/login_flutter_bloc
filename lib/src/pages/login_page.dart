import 'package:flutter/material.dart';
import 'package:login_flutter_bloc/src/bloc/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _crearFondo(context),
        _loginForm(context),
      ],
    ));
  }

  Widget _crearFondo(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final _fondoArriba = Container(
      height: media.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(32, 166, 59, 1.0),
        Color.fromRGBO(88, 196, 110, 0.9)
      ])),
    );

    final _circulo = Container(
      height: 90.0,
      width: 90.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: [
        _fondoArriba,
        Positioned(
          child: _circulo,
          top: 90.0,
          left: 40.0,
        ),
        Positioned(
          child: _circulo,
          top: 60.0,
          right: 70.0,
        ),
        Positioned(
          child: _circulo,
          top: 180.0,
          right: 20.0,
        ),
        Container(
          padding: EdgeInsets.only(top: 60.0),
          child: Column(
            children: [
              Icon(
                Icons.person_pin_circle,
                color: Colors.black,
                size: 90.0,
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text(
                "Login Fabian Muñoz",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: "RobotoMono"),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final media = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
              child: Container(
            height: 180.0,
          )),
          Container(
            width: media.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 50.0),
            margin: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 3.0,
                      offset: Offset(0.3, 0.5),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: [
                Text(
                  "ingreso",
                  style: TextStyle(fontSize: 20.0),
                ),
                _crearEmail(bloc),
                SizedBox(
                  height: 0.5,
                ),
                _crearPassword(bloc),
                SizedBox(
                  height: 20.0,
                ),
                _crearBoton()
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text("¿olvidó su contraseña?"),
          SizedBox(
            height: 90.0,
          ),
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.green),
              labelText: "Email",
              hintText: "ejemplo@gmail.com",
              counterText: snapshot.data,
              errorText: snapshot.error,
              icon: Icon(
                Icons.email,
                color: Colors.green,
              ),
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStrem,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: TextFormField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.green),
              labelText: "Password",
              counterText: snapshot.data,
              errorText: snapshot.error,

              //  hintText: "ejemplo@gmail.com",
              icon: Icon(
                Icons.lock,
                color: Colors.green,
              ),
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearBoton() {
    return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
          child: Text("ingresar"),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 5.0,
        color: Colors.green,
        textColor: Colors.black,
        onPressed: () {});
  }
}
