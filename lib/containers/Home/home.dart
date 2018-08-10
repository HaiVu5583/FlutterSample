import 'dart:async';
import 'dart:math' as Math;

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hello_world/locales/I18n.dart';
import 'package:share/share.dart';
import 'HorizontalDeal/HorizontalDealList.dart';
import 'data.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int _currentTab = 0;
  String _connectionStatus = '';
  AnimationController _animationController;
  final Connectivity _connectivity = new Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  static const List<IconData> icons = [
    IconData(0xe913, fontFamily: 'icon-clingme-2-0'),
    IconData(0xe965, fontFamily: 'icon-clingme-2-0'),
    IconData(0xe912, fontFamily: 'icon-clingme-2-0'),
    IconData(0xe959, fontFamily: 'icon-clingme-2-0'),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
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
    _animationController.dispose();
    _connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Builder(builder: (BuildContext context) {
        return new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Column(
            children: <Widget>[
              new SizedBox(height: 25.0),
              new Card(
                  elevation: 2.0,
                  child: new TextFormField(
                      decoration: const InputDecoration(
                    contentPadding: const EdgeInsets.all(12.0),
                    border: InputBorder.none,
                    filled: false,
                    hintText: 'Ưu đãi, tiện ích, địa điểm...',
                    fillColor: Colors.white,
                    prefixIcon: const Padding(
                      padding: const EdgeInsets.only(right: 7.0),
                      child: const Icon(
                        IconData(0xe901, fontFamily: 'icon-clingme-2-0'),
                        size: 24.0,
                        color: Colors.black38,
                      ),
                    ),
                  ))),
              new HorizontalDealList(
                id: 53,
                title: 'Dành cho tín đồ trà sữa',
                content: blockData,
              ),
              new SizedBox(height: 24.0),
              new RaisedButton(
                  child: new Text(I18n.getInstance().t('press_me')),
                  elevation: 5.0,
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    handlePressBtn(context);
                  }),
            ],
          ),
        );
      }),
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(IconData(0xe904, fontFamily: 'icon-clingme-2-0')),
              title: new Text(
                I18n.getInstance().t('home'),
                style: new TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.deepOrange),
          new BottomNavigationBarItem(
              icon: new Icon(IconData(0xe954, fontFamily: 'icon-clingme-2-0')),
              title: new Text(I18n.getInstance().t('mark_deal'),
                  style: new TextStyle(fontWeight: FontWeight.bold))),
          new BottomNavigationBarItem(
            icon: new Icon(IconData(0xe948, fontFamily: 'icon-clingme-2-0')),
            title: new Text(I18n.getInstance().t('notification'),
                style: new TextStyle(fontWeight: FontWeight.bold)),
            backgroundColor: Colors.blue,
          ),
          new BottomNavigationBarItem(
              icon: new Icon(IconData(0xe908, fontFamily: 'icon-clingme-2-0')),
              title: new Text(I18n.getInstance().t('profile'),
                  style: new TextStyle(fontWeight: FontWeight.bold)))
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
          color: Theme.of(context).accentColor,
          alignment: Alignment.center,
          child: new Text(
            'Drawer Header',
            style: new TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
//        floatingActionButton: new Row(
//            mainAxisSize: MainAxisSize.min,
//            children: new List<Widget>.generate(icons.length, (int index) {
//              return new ScaleTransition(
//                scale: new CurvedAnimation(
//                  parent: _animationController,
//                  curve: new Interval(0.0, 1.0 - index / icons.length / 2.0,
//                      curve: Curves.easeOut),
//                ),
//                child: new Padding(
//                  padding: EdgeInsets.only(right: 5.0),
//                  child: FloatingActionButton(
//                    child: new Icon(icons[index],
//                        size: 24.0, color: Theme.of(context).primaryColor),
//                    onPressed: () {
//                      _animationController.reverse();
//                    },
//                  ),
//                ),
//              );
//            }).toList()
//              ..add(new FloatingActionButton(
//                child: new AnimatedBuilder(
//                  animation: _animationController,
//                  builder: (BuildContext context, Widget child) {
//                    return new Transform(
//                        transform: new Matrix4.rotationZ(
//                            _animationController.value * 0.5 * Math.PI),
//                        alignment: FractionalOffset.center,
//                        child: new Icon(
//                          _animationController.isDismissed
//                              ? IconData(0xe926, fontFamily: 'icon-clingme-2-0')
//                              : IconData(0xe910,
//                                  fontFamily: 'icon-clingme-2-0'),
//                          size: 24.0,
//                          color: _animationController.isDismissed
//                              ? Theme.of(context).primaryColor
//                              : Theme.of(context).disabledColor,
//                        ));
//                  },
//                ),
//                onPressed: () {
//                  if (_animationController.isDismissed) {
//                    _animationController.forward();
//                  } else {
//                    _animationController.reverse();
//                  }
//                },
//              )))
    );
  }
}
