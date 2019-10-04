import 'package:flutter/material.dart';
import 'package:panic_app/src/blocs/provider.dart';

import 'package:panic_app/src/routes/routes.dart';
import 'package:panic_app/src/styles/stylesApp.dart';

void main() => runApp(PanicApp());
 
class PanicApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Panic App',
        debugShowCheckedModeBanner: false,
        initialRoute: "login",
        routes: getApplicationRoutes(),
        theme: ThemeData(
          primaryColor: getStyle('primaryColor'),
        )
        // onGenerateRoute: (RouteSettings settings) {
        //   return MaterialPageRoute(
        //     builder: (BuildContext context) => HomePage()
        //   );
        // },
      )
    );    
  }
}