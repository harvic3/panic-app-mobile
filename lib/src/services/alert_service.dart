import 'package:flutter/material.dart';
import 'package:panic_app/src/styles/stylesApp.dart';

Future<dynamic> showAlert(BuildContext context, String title, String message, IconData icon, [ String txtCancelBtn, String txtOkBtn, Color iconColor ]) async {
  return showDialog(context: context, barrierDismissible: true, builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Text(title != null ? title : 'Alerta'),
        //content: Text('El cotenido'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, color: iconColor != null ? iconColor : getStyle('backgroundSecundaryColor'), size: 50.0),
            SizedBox(height: 10.0),
            Text(message != null ? message : ''),
          ],
        ),
        actions: <Widget>[
          txtCancelBtn != null ? FlatButton(
            child: Text('Cancelar'),
            onPressed: () => Navigator.of(context).pop(false),
          ) : null,
          FlatButton(
            child: Text(txtOkBtn != null ? txtOkBtn : 'Aceptar'),
            onPressed: () => Navigator.of(context).pop(true),
          )
        ],
      );
    }
  );
}