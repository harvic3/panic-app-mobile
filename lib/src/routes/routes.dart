import 'package:flutter/material.dart';

import 'package:panic_app/src/pages/home_page.dart';
import 'package:panic_app/src/pages/login_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder> {
    "home"    : (BuildContext context) => HomePage(),
    "login"   : (BuildContext context) => LoginPage(),
  };
}