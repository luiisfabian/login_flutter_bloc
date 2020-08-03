import 'package:flutter/material.dart';

class ProductoPage extends StatelessWidget {
  const ProductoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Producto"),
        actions: [
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: (){},
          ),
          IconButton(
              color: Colors.black,
              icon: Icon(Icons.add_a_photo),
              onPressed: (){}
              )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
           
            child: Column(
              children: [
                _crearNombre(),
                _crearPrecio(),
                SizedBox(height: 8.0,),
                _crearBoton(),
              ],
            )
            ),
        ),
      ),
    );
  }
  Widget _crearNombre(){
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: "Producto",


      ),
    );
  }
  Widget _crearPrecio(){
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "precio",
        
      ),
    );
  }
  Widget _crearBoton(){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      icon: Icon(Icons.save),
      onPressed: (){},
      label: Text("Guardar"),
      color: Colors.green,
      textColor: Colors.white,
      
    );
  }
}
