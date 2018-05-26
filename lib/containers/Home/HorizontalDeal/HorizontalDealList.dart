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
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Expanded(
                  flex: 1,
                  child: new Text(
                    this.title,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.display1
                  ),
                ),
                new FlatButton(
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: new Text(I18n.getInstance().t('view_all'),
                        style:
                        new TextStyle(fontSize: 13.0, color: Colors.black54)))
              ],
            ),
        ),
        new Container(
          height: 200.0,
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
