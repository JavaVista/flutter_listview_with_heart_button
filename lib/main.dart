import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo ListView with Button'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class SongDetail {
  String strTitle;
  var isFavorite = false;

  SongDetail (this.strTitle, this.isFavorite);
}

class _MyHomePageState extends State<MyHomePage> {

  List<SongDetail> arrSongList = [
    new SongDetail("strTitle1", true),
    new SongDetail("strTitle2", false),
    new SongDetail("strTitle3", true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
        ListView.builder(
          itemCount: arrSongList.length,
          itemBuilder: (BuildContext context, int index) {
            return new GestureDetector(
              onTap: () {
                print('on tap clicked on ' + arrSongList[index].strTitle);
              },
              child: Container(
                height: 45.0,
                decoration: BoxDecoration(),
                child: new Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Container(
                            child: Text(
                              arrSongList[index].strTitle,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 10.0),
                              maxLines: 1,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))
                            ),
                          ),
                          new GestureDetector(
                            onTap: () {
                              setState(() {
                                arrSongList[index].isFavorite =! arrSongList[index].isFavorite;
                              });
                              print('clicked on heart ' + arrSongList[index].strTitle);
                            },
                            child: new Container(
                              margin: const EdgeInsets.all(0.0),
                              child: new Icon(
                                arrSongList[index].isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: Colors.red,
                                size: 30.0,
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ),
            );
          },
        ),
    );
  }
}
