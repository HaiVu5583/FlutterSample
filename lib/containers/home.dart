import 'package:flutter/material.dart';
import 'package:flutter_hello_world/locales/I18n.dart';
import 'package:share/share.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTab = 0;
  String _connectionStatus = '';
  final Connectivity _connectivity = new Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() => _connectionStatus = result.toString());
    });
  }

  Future<Null> checkConnection() async {
    String connectionStatus;
    try {
      connectionStatus = (await _connectivity.checkConnectivity()).toString();
    } on PlatformException catch (e) {
      print(e.toString());
      connectionStatus = 'Failed to get connectivity.';
    }
    setState(() {
      _connectionStatus = connectionStatus;
    });
  }

  handlePressBtn(BuildContext context) async {
    print('Pressing PressMe');
    final RenderBox box = context.findRenderObject();
    Share.share('(^人^)',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  void dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Builder(builder: (BuildContext context) {
        return new SingleChildScrollView(
          child: new Center(
              child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new InkWell(
                child: new Container(
                  padding: new EdgeInsets.all(16.0),
                  margin: new EdgeInsets.all(20.0),
                  alignment: Alignment.center,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(16.0),
                    boxShadow: [
                      new BoxShadow(
                          offset: new Offset(1.0, 2.0), color: Colors.black12)
                    ],
                    gradient: new LinearGradient(
                      begin: const Alignment(-1.0, 0.0),
                      end: const Alignment(0.6, 0.0),
                      colors: <Color>[
                        const Color(0xffff7e5f), // ##4ECDC4
                        const Color(0xfffeb47b), // ##4ECDC4
                      ],
                    ),
                  ),
                  child: new Text(
                    I18n.getInstance().t('some_text'),
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.white,
                      fontFamily: 'Quicksand',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                onTap: () {
                  print('Tapping InkWell');
                },
              ),
              new Text(_connectionStatus),
              new RaisedButton(
                  child: new Text(I18n.getInstance().t('press_me')),
                  elevation: 5.0,
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    handlePressBtn(context);
                  }),
              new Padding(
                padding: new EdgeInsets.only(top: 24.0, bottom: 24.0),
                child: new CircularProgressIndicator(
                  backgroundColor: Colors.pinkAccent,
                  strokeWidth: 5.0,
                ),
              ),
              new Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: new BoxDecoration(
                    color: Colors.purpleAccent,
                    borderRadius: new BorderRadius.vertical(
                        top: new Radius.circular(20.0),
                        bottom: new Radius.circular(0.0)),
                    border: new Border.all(
                      width: 10.0,
                      color: Colors.cyan,
                    ),
                  ))
            ],
          )),
        );
      }),
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.account_box),
              title: new Text(
                I18n.getInstance().t('home'),
                style: new TextStyle(
                    fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.deepOrange),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.add_shopping_cart),
            title: new Text(I18n.getInstance().t('cart'),
                style: new TextStyle(
                    fontFamily: 'Quicksand', fontWeight: FontWeight.bold)),
            backgroundColor: Colors.blue,
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.camera),
              title: new Text(I18n.getInstance().t('camera'),
                  style: new TextStyle(
                      fontFamily: 'Quicksand', fontWeight: FontWeight.bold))),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.local_airport),
              title: new Text(I18n.getInstance().t('flight'),
                  style: new TextStyle(
                      fontFamily: 'Quicksand', fontWeight: FontWeight.bold)))
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentTab,
        onTap: (value) {
          print('Tapping BottomBar' + value.toString());
          setState(() {
            _currentTab = value;
          });
        },
      ),
      drawer: new Drawer(
        child: new Container(
          color: Colors.deepOrangeAccent,
          alignment: Alignment.center,
          child: new Text(
            'Drawer Header',
            style: new TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
      floatingActionButton: new Builder(builder: (BuildContext context) {
        return FloatingActionButton(
          onPressed: () {
            print('Pressing FAB');
            final snackBar =
                new SnackBar(content: new Text('This is a alert Text'));
            Scaffold.of(context).showSnackBar(snackBar);
          },
          tooltip: 'FAB',
          child: new Icon(Icons.add),
        );
      }),
    );
  }
}
