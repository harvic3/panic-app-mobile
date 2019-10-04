import 'package:flutter/material.dart';

import 'package:panic_app/src/blocs/provider.dart';
import 'package:panic_app/src/models/event_model.dart';
import 'package:panic_app/src/styles/stylesApp.dart';
import 'package:panic_app/src/services/alert_service.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);
    EventModel event = new EventModel();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: getStyle('backgroundSecundaryColor'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {

            },
          )
        ],      
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.person_pin),
              color: getStyle('panicBtnColor'),
              iconSize: 150.0,
              onPressed: () {
                _createEvent(context, bloc);
              },
              tooltip: 'Botón de pánico',
            ),
          ],
        ),
      ),
    );
  }

  void _createEvent(BuildContext context, LoginBloc loginBloc) async {
    bool createEvent = await showAlert(context, 'Alerta', '¿Realmente desea crear el evento de pánico?', Icons.info, 'Cancelar', 'Aceptar', Colors.orange);
    if (createEvent){
      await showAlert(context, 'Información', '¡Se envió el evento de pánico!', Icons.person_pin_circle, null, 'Aceptar', Colors.red);
    }
  }
  
}