import 'package:flutter/material.dart';
import 'HorizontalDealItem.dart';
import 'package:flutter_hello_world/locales/I18n.dart';

class HorizontalDealList extends StatelessWidget {
  const HorizontalDealList({Key key, this.content, this.id, this.title})
      : super(key: key);

  final List content;
  final int id;
  final String title;

  Widget build(context) {
    return new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0) ,
                child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Text(
          this.title,
          style: new TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
              color: Colors.black87
          ),
        ),
        new FlatButton(
            onPressed: (){},
            child: new Text(
                I18n.getInstance().t('view_all'),
                style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.black87)
            )
        )
      ],
    )
            ),
            new Container(
              height: 190.0,
              child: new ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    HorizontalDealItem(data: content[index]),
                itemCount: content.length,
                scrollDirection: Axis.horizontal,
              ),
            )

          ],
        );
  }
}
