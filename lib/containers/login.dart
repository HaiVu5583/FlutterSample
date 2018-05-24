import 'package:flutter/material.dart';
import 'package:flutter_hello_world/locales/I18n.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:async';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _loadingLogin = false;

  _handleLoginFacebook() async {
    var facebookLogin = new FacebookLogin();
    var result = await facebookLogin.logInWithReadPermissions(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        print('Logged In: '+ result.accessToken.token);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('User Cancel');
        break;
      case FacebookLoginStatus.error:
        print('Error: ' + result.errorMessage);
        break;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: AssetImage('resources/images/login_background.jpg'),
              fit: BoxFit.cover),
        ),
        child: new Padding(
            padding: new EdgeInsets.all(32.0),
            child: new Center(
                child: new Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new SizedBox(height: 50.0),
                new Image.asset(
                  'resources/images/logo.png',
                  width: 100.0,
                  height: 70.0,
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      labelText: 'Tên đăng nhập',
                      fillColor: Colors.white),
                ),
                const SizedBox(height: 20.0),
                new TextFormField(
                  decoration: const InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      labelText: 'Mật khẩu',
                      fillColor: Colors.white),
                ),
                const SizedBox(height: 32.0),
                new Row(children: <Widget>[
                  new Expanded(
                      child: new FlatButton(
                    onPressed: () {
                      this.setState(() {
                        _loadingLogin = !_loadingLogin;
                      });
                    },
                    color: _loadingLogin ? Colors.black12 : Color(0xFFF16654),
                    child: _loadingLogin
                        ? new CircularProgressIndicator(
                            backgroundColor: Color(0xFFF16654),
                          )
                        : new Text(
                            I18n.getInstance().t('login'),
                            style: new TextStyle(color: Colors.white),
                          ),
                  ))
                ]),
                const SizedBox(height: 12.0),
                new Container(
                  child: new Column(
                      children: <Widget>[new Text(I18n.getInstance().t('or'))]),
                ),
                const SizedBox(height: 12.0),
                new Row(children: <Widget>[
                  new Expanded(
                      child: new FlatButton.icon(
                          color: Color(0xFF3B5998),
                          onPressed: _handleLoginFacebook,
                          icon: new Icon(
                              IconData(0xe945, fontFamily: 'icon-clingme-2-0'),
                              size: 24.0,
                              color: Colors.white),
                          label: new Text(
                            I18n.getInstance().t('login_with_facebook'),
                            style: new TextStyle(color: Colors.white),
                          )))
                ])
              ],
            ))),
      ),
    );
  }
}
