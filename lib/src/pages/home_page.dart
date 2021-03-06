
import 'package:flutter/material.dart';
import 'package:login_flutter_bloc/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(

      ),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearBoton(BuildContext context){
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.green,
      onPressed: (){
        Navigator.pushNamed(context, "producto");
      }
    );
  }
}
