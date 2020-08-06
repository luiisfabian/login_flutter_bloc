import 'package:flutter/material.dart';
import 'package:login_flutter_bloc/src/models/producto_model.dart';
import 'package:login_flutter_bloc/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();

  ProductoModel producto = new ProductoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Producto"),
        actions: [
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: () {},
          ),
          IconButton(
              color: Colors.black,
              icon: Icon(Icons.add_a_photo),
              onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  _crearNombre(),
                  _crearPrecio(),
                 _crearDisponible(),
                  SizedBox(
                    height: 8.0,
                  ),
                  _crearBoton(),
                ],
              )),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: "Producto",
      ),
      onSaved: (value) => {producto.titulo = value},
      validator: (value) {
        if (value.length < 3) {
          return "ingrese el nombre del producto";
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "precio",
      ),
      onSaved: (value) => {producto.valor = double.parse(value)},
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return "Solo números";
        }
      },
    );
  }

  _crearDisponible() {
    return SwitchListTile(
      //value: true,
        value: producto.disponible,
        title: Text("Disponible"),
        activeColor: Colors.green,
        onChanged: (value) {
          setState(() {
             producto.disponible = value;
          });
        });
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      icon: Icon(Icons.save),
      onPressed: _submit,
      label: Text("Guardar"),
      color: Colors.green,
      textColor: Colors.white,
    );
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();
    print("good");
    print(producto.titulo);
    print(producto.valor);

    if (formKey.currentState.validate()) {
      //cuando el formulario es valido

    }
  }
}
