import 'package:flutter/material.dart';
import 'package:flutter_hello_world/locales/I18n.dart';
import 'package:share/share.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'data.dart';
import 'HorizontalDeal/HorizontalDealItem.dart';
import 'HorizontalDeal/HorizontalDealList.dart';

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
      appBar: new AppBar(title: const Text('Clingme')),
      body: new Builder(builder: (BuildContext context) {
        return new Column(
          children: <Widget>[
            new HorizontalDealList(
                id: 53,
                title: 'Dành cho tín đồ trà sữa',
                content: [
                  {
                    "id": 193482,
                    "title": "Tặng 30% TocoToco Bubble Tea",
                    "imageUrl":
                        "https://storage.clingme.vn/dev5/0/000/614/0000614166.fid",
                    "name": "Trà sữa TocoToco",
                    "address": "4B Hàng Bài, Quận Hoàn Kiếm, Hà Nội",
                    "distance": 0.19515058,
                    "promotionTitle": "Hoàn tiền 30%",
                    "priority": 0
                  },
                  {
                    "id": 180418,
                    "title": "Mở thẻ HSBC: Nhận đến 3 triệu",
                    "imageUrl":
                        "https://storage.clingme.vn/dev2/0/000/577/0000577104.fid",
                    "name": " Ngân hàng HSBC - PGD Hoàn Kiếm",
                    "address":
                        "Tòa nhà Asian, 6 Nhà Thờ, Quận Hoàn Kiếm, Hà Nội",
                    "distance": 0.43521473,
                    "promotionTitle": "Hoàn tiền 3.000.000đ",
                    "priority": 0
                  },
                  {
                    "id": 193439,
                    "title": "Ưu đãi làm đẹp với TrueSkin Spa",
                    "imageUrl":
                        "https://storage.clingme.vn/dev2/0/000/614/0000614011.fid",
                    "name": "Trueskin Spa",
                    "address":
                        "Tầng 3, Toà nhà Coalimex, 33 Tràng Thi, Quận Hoàn Kiếm, Hà Nội",
                    "distance": 0.5144776,
                    "promotionTitle": "Hoàn tiền 5%",
                    "priority": 0
                  },
                  {
                    "id": 193513,
                    "title": "Tặng 30% TocoToco Bubble Tea",
                    "imageUrl":
                        "https://storage.clingme.vn/dev1/0/000/614/0000614198.fid",
                    "name": "Trà sữa TocoToco",
                    "address": "42F Lý Thường Kiệt, Quận Hoàn Kiếm, Hà Nội",
                    "distance": 0.5222123,
                    "promotionTitle": "Hoàn tiền 30%",
                    "priority": 0
                  },
                  {
                    "id": 193507,
                    "title": "Tặng 30% TocoToco Bubble Tea",
                    "imageUrl":
                        "https://storage.clingme.vn/dev1/0/000/614/0000614182.fid",
                    "name": "Trà sữa TocoToco",
                    "address": "114 Cầu Gỗ, Quận Hoàn Kiếm, Hà Nội",
                    "distance": 0.65670407,
                    "promotionTitle": "Hoàn tiền 30%",
                    "priority": 0
                  },
                  {
                    "id": 193519,
                    "title": "Tặng 30% TocoToco Bubble Tea",
                    "imageUrl":
                        "https://storage.clingme.vn/dev1/0/000/614/0000614198.fid",
                    "name": "Trà sữa TocoToco",
                    "address": "57 Cầu Gỗ, Quận Hoàn Kiếm, Hà Nội",
                    "distance": 0.65916616,
                    "promotionTitle": "Hoàn tiền 30%",
                    "priority": 0
                  },
                  {
                    "id": 180735,
                    "title": "Mở thẻ HSBC: Nhận đến 3 triệu",
                    "imageUrl":
                        "https://storage.clingme.vn/dev2/0/000/577/0000577104.fid",
                    "name": " Ngân hàng HSBC - PGD Phan Chu Trinh ",
                    "address":
                        "Tòa nhà Mặt Trời Sông Hồng, 23 Phan Chu Trinh, Quận Hoàn Kiếm, Hà Nội",
                    "distance": 0.6901527,
                    "promotionTitle": "Hoàn tiền 3.000.000đ",
                    "priority": 0
                  },
                  {
                    "id": 193489,
                    "title": "Tặng 30% TocoToco Bubble Tea",
                    "imageUrl":
                        "https://storage.clingme.vn/dev5/0/000/614/0000614166.fid",
                    "name": "Trà sữa TocoToco",
                    "address": "2 Nguyễn Văn Tố, Quận Hoàn Kiếm, Hà Nội",
                    "distance": 0.92176914,
                    "promotionTitle": "Hoàn tiền 30%",
                    "priority": 0
                  },
                  {
                    "id": 180422,
                    "title": "Mở thẻ HSBC: Nhận đến 3 triệu",
                    "imageUrl":
                        "https://storage.clingme.vn/dev2/0/000/577/0000577104.fid",
                    "name": " Ngân hàng HSBC - Chi nhánh Lý Thường Kiệt ",
                    "address":
                        "Pacific Place, 83B Lý Thường Kiệt, Quận Hoàn Kiếm, Hà Nội",
                    "distance": 1.0942891,
                    "promotionTitle": "Hoàn tiền 3.000.000đ",
                    "priority": 0
                  },
                  {
                    "id": 194408,
                    "title": "Klever: Kiwi Oscar Pháp chỉ 129k",
                    "imageUrl":
                        "https://storage.clingme.vn/dev3/0/000/591/0000591975.fid",
                    "name": "Klever Fruits",
                    "address": "196 Bà Triệu, Quận Hai Bà Trưng, Hà Nội",
                    "distance": 1.3416873,
                    "promotionTitle": "Hoàn tiền 7%",
                    "priority": 0
                  },
                  {
                    "id": 193483,
                    "title": "Tặng 30% TocoToco Bubble Tea",
                    "imageUrl":
                        "https://storage.clingme.vn/dev5/0/000/614/0000614166.fid",
                    "name": "Trà sữa TocoToco",
                    "address": "19 Khâm Thiên, Quận Đống Đa, Hà Nội",
                    "distance": 1.6919826,
                    "promotionTitle": "Hoàn tiền 30%",
                    "priority": 0
                  },
                  {
                    "id": 193443,
                    "title": "Ưu đãi làm đẹp với TrueSkin Spa",
                    "imageUrl":
                        "https://storage.clingme.vn/dev2/0/000/614/0000614011.fid",
                    "name": "Trueskin Spa",
                    "address":
                        "Tầng 4, TTTM Vincom 2, 191 Bà Triệu, Quận Hai Bà Trưng, Hà Nội",
                    "distance": 1.7674694,
                    "promotionTitle": "Hoàn tiền 5%",
                    "priority": 0
                  },
                  {
                    "id": 193501,
                    "title": "Tặng 30% TocoToco Bubble Tea",
                    "imageUrl":
                        "https://storage.clingme.vn/dev1/0/000/614/0000614182.fid",
                    "name": "Trà sữa TocoToco",
                    "address": "25 Lê Đại Hành, Quận Hai Bà Trưng, Hà Nội",
                    "distance": 1.8661708,
                    "promotionTitle": "Hoàn tiền 30%",
                    "priority": 0
                  },
                  {
                    "id": 193480,
                    "title": "Tặng 30% TocoToco Bubble Tea",
                    "imageUrl":
                        "https://storage.clingme.vn/dev5/0/000/614/0000614166.fid",
                    "name": "Trà sữa TocoToco",
                    "address": "92 Cửa Bắc, Quận Ba Đình, Hà Nội",
                    "distance": 2.0372734,
                    "promotionTitle": "Hoàn tiền 30%",
                    "priority": 0
                  },
                  {
                    "id": 193506,
                    "title": "Tặng 30% TocoToco Bubble Tea",
                    "imageUrl":
                        "https://storage.clingme.vn/dev1/0/000/614/0000614182.fid",
                    "name": "Trà sữa TocoToco",
                    "address": "59 Tôn Đức Thắng, Quận Đống Đa, Hà Nội",
                    "distance": 2.0752504,
                    "promotionTitle": "Hoàn tiền 30%",
                    "priority": 0
                  },
                  {
                    "id": 194409,
                    "title": "Klever: Kiwi Oscar Pháp chỉ 129k",
                    "imageUrl":
                        "https://storage.clingme.vn/dev3/0/000/591/0000591979.fid",
                    "name": "Klever Fruits",
                    "address": "75 Tôn Đức Thắng, Quận Đống Đa, Hà Nội",
                    "distance": 2.1056333,
                    "promotionTitle": "Hoàn tiền 7%",
                    "priority": 0
                  },
                  {
                    "id": 193496,
                    "title": "Tặng 30% TocoToco Bubble Tea",
                    "imageUrl":
                        "https://storage.clingme.vn/dev1/0/000/614/0000614182.fid",
                    "name": "Trà sữa TocoToco",
                    "address": "Tầng 5 Mipec Long Biên, Quận Long Biên, Hà Nội",
                    "distance": 2.4686785,
                    "promotionTitle": "Hoàn tiền 30%",
                    "priority": 0
                  },
                  {
                    "id": 193504,
                    "title": "Tặng 30% TocoToco Bubble Tea",
                    "imageUrl":
                        "https://storage.clingme.vn/dev1/0/000/614/0000614182.fid",
                    "name": "Trà sữa TocoToco",
                    "address": "259 Bạch Mai, Quận Hai Bà Trưng, Hà Nội",
                    "distance": 2.6598673,
                    "promotionTitle": "Hoàn tiền 30%",
                    "priority": 0
                  },
                  {
                    "id": 180944,
                    "title": "Ưu đãi tại Hòa Hương Restaurant",
                    "imageUrl":
                        "https://storage.clingme.vn/dev3/0/000/554/0000554426.fid",
                    "name": "Hòa Hương Restaurant",
                    "address": "6 Thụy Khuê, Quận Tây Hồ, Hà Nội",
                    "distance": 2.7116702,
                    "promotionTitle": "Hoàn tiền 15%",
                    "priority": 0
                  },
                  {
                    "id": 193486,
                    "title": "Tặng 30% TocoToco Bubble Tea",
                    "imageUrl":
                        "https://storage.clingme.vn/dev5/0/000/614/0000614166.fid",
                    "name": "Trà sữa TocoToco",
                    "address": "95 Đội Cấn, Quận Ba Đình, Hà Nội",
                    "distance": 2.754815,
                    "promotionTitle": "Hoàn tiền 30%",
                    "priority": 0
                  }
                ]),
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

    return new Scaffold(
      body: new Builder(builder: (BuildContext context) {
        return new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new SizedBox(height: 50.0),
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
        ));
//        );
      }),
    );
  }
}
