import 'package:flutter/material.dart';

class HorizontalDealItem extends StatelessWidget {
  const HorizontalDealItem(
      {Key key,
      this.data})
      : super(key: key);

  final Map<String, dynamic> data;

  Widget build(context) {
    return new InkWell(
      child: Card(
        elevation: 2.0,
        child: Column(
          children: <Widget>[
            new Image.network(
              data['imageUrl'],
              width: 200.0,
              height: 112.0,
              fit: BoxFit.cover,
            ),
            new SizedBox(
              width: 200.0,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      data['title'],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.display2,
                    ),
                    new Text(
                      data['promotionTitle'],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: new TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor),
                    ),
                    new Text(
                      data['address'],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style:
                          new TextStyle(fontSize: 12.0, color: Colors.black45, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
