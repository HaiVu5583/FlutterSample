import 'package:flutter/material.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: new HomePage(title: 'Clingme'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTab = 0;

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
//                  color: Colors.blue,
                    borderRadius: new BorderRadius.circular(16.0),
                    boxShadow: [
                      new BoxShadow(
                          offset: new Offset(1.0, 2.0), color: Colors.black12)
                    ],
//                    image: new DecorationImage(
//                        image: new NetworkImage('http://rudivandenheever.com/wp-content/uploads/2016/09/18-740-pp_gallery/African-Landscape-Photography-Prints-Drakensberg-5453-1.jpg'),
//                        fit: BoxFit.cover
//                    ),
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
                    'The Text widget displays a string of text with single style. The string might break across multiple lines or might all be displayed on the same line depending on the layout constraints.',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.white,
                      fontFamily: 'Quicksand',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

//                    new Image.network(
//                      'http://rudivandenheever.com/wp-content/uploads/2016/09/18-740-pp_gallery/African-Landscape-Photography-Prints-Drakensberg-5453-1.jpg',
//                      width: 300.0,
//                      height: 200.0,
//                    )
                ),
                onTap: () {
                  print('Tapping InkWell');
                },
              ),
              new RaisedButton(
                  child: new Text('Press me'),
                  elevation: 5.0,
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    print('Pressing PressMe');
                    Scaffold
                        .of(context)
                        .showBottomSheet((BuildContext context) {
                      return new Center(
                        child: new Column(children: [
                          new Expanded(
                            child: new Text(
                              'This is Bottom Sheet',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ]),
                      );
                    });
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
                'Title 1',
                style: new TextStyle(
                    fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.deepOrange),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.add_shopping_cart),
            title: new Text('Title 2',
                style: new TextStyle(
                    fontFamily: 'Quicksand', fontWeight: FontWeight.bold)),
            backgroundColor: Colors.blue,
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.camera),
              title: new Text('Title 3',
                  style: new TextStyle(
                      fontFamily: 'Quicksand', fontWeight: FontWeight.bold))),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.local_airport),
              title: new Text('Title 4',
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
