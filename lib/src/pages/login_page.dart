import 'package:flutter/material.dart';

import 'package:panic_app/src/blocs/provider.dart';
import 'package:panic_app/src/styles/stylesApp.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _createBackground(context),
          _loginForm(context),
        ],
      )
    );
  }

  Widget _createBackground(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final backgroundHeader = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            getStyle('backgroundPrimaryColor'),
            getStyle('backgroundSecundaryColor'),
          ]
        )
      ),
    );

    final circle = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );

    return Stack(
      children: <Widget>[
        backgroundHeader,
        Positioned( 
          child: circle,
          top: size.width * 0.15,
          left: 10.0,
        ),
        Positioned(
          child: circle,
          top: size.width * 0.01,
          right: -40.0,
        ),
        Positioned(
          child: circle,
          top: size.width * 0.50,
          left: 150.0,
        ),
        Container(
          padding: EdgeInsets.only(top: size.height * 0.1),
          child: Column(
            children: <Widget>[
              // DecoratedBox(
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage('assets/LogoTA.png'),
              //       fit: BoxFit.contain,
              //       alignment: Alignment.center,
              //       repeat: ImageRepeat.noRepeat,
              //       matchTextDirection: false
              //     ),
              //   )
              // ),
              Icon(Icons.pin_drop, color: Colors.white, size: 80.0 ),
              SizedBox(height: 5.0, width: double.infinity),
              Text('Panicapp', style: TextStyle(color: Colors.white, fontSize: 25.0)),
            ],
          )
        )
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    final formContainer = Container(
      width: size.width * 0.85,
      margin: EdgeInsets.symmetric( vertical: 10.0),
      padding: EdgeInsets.symmetric(vertical: 30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            offset: Offset(0.0, 5.0),
            spreadRadius: 3.0,
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          Text('Login', style: TextStyle(color: Colors.black, fontSize: 20.0,)),
          SizedBox(height: 30.0),
          _inputEmail(bloc),
          SizedBox(height: 20.0),
          _inputPassword(bloc),
          SizedBox(height: 30.0),
          _loginButton(bloc),
        ],
      ),
    );

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(child: Container(height: size.height * 0.25)),
          formContainer,
          SizedBox(height: 15.0),        
          Text('¿Olvidó la contraseña?'),
          SizedBox(height: 50.0)
        ],
      ),
    );
  }

  Widget _inputEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapShot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(getStyle('radiusTextInput'))
              ),
              hintText: 'ejemplo@email.com',
              labelText: 'Correo electrónico',
              suffixIcon: Icon(Icons.alternate_email),
              // counterText: snapShot.data,
              errorText: snapShot.error,
            ),
            onChanged: bloc.changeEmail,
          )
        );
      }
    );    
  }

  Widget _inputPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapShot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(getStyle('radiusTextInput'))
              ),
              hintText: 'Su contraseña',
              labelText: 'Contraseña',
              suffixIcon: Icon(Icons.lock),
              // counterText: snapShot.data,
              errorText: snapShot.error,
            ),
            onChanged: bloc.changePassword,
          )
        );
      }
    );    
  }

  Widget _loginButton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formLoginValidStream,
      builder: (BuildContext context, AsyncSnapshot snapShot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          color: getStyle('primaryColor'),
          elevation: 1.0,
          textColor: Colors.white,
          onPressed: !snapShot.hasData ? null : () => _login(context, bloc),
        );
      }
    );
  }

  _login (BuildContext context, LoginBloc bloc) {
    print('Email: ${bloc.email}');
    print('Password: ${bloc.password}');
    // TODO: login and go to home
    Navigator.pushReplacementNamed(context, 'home');
  }

}
