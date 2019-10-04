import 'package:flutter/material.dart';


final styles = <String, dynamic>{
  'backgroundPrimaryColor'      : Color.fromRGBO(12, 113, 195, 1.0),
  'backgroundSecundaryColor'    : Color.fromRGBO(38, 96, 144, 1.0),
  'primaryColor'                : Color.fromRGBO(12, 113, 195, 1.0),
  'secundaryColor'              : Colors.purple,
  'radiusTextInput'             : 15.0,
  'panicBtnColor'               : Colors.red,
};

dynamic getStyle(String styleName) {
  return styles[styleName];
}