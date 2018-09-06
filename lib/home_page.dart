import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cryptick/cryptoData/crypto_data.dart';
import 'package:cryptick/modules/crypto_presenter.dart';
import 'main.dart';
import 'background.dart';
import 'dart:async';
import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';

//CODE COPYRIGHT OF 2018 SQUARED SOFTWARE LONDON
  

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class ServerStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: new Text(
          'API Server Status',
           textAlign: TextAlign.center,
            style: new TextStyle(
            color: Colors.white,
            fontSize: 27.5,
            fontFamily: 'Kanit'
          ),
        ),
      ),
      body: new Center(
          child: new Column(
          children: [
            new Divider(color: Colors.white),
            new Text(
              'News Feed: ',
              textAlign: TextAlign.center,
                style: new TextStyle(
                color: Colors.black,
                fontSize: 27.5,
                fontFamily: 'Kanit',
              ),
            ),
            new Divider(),
            new Text(
              'Crypto Feed: ',
              textAlign: TextAlign.center,
                style: new TextStyle(
                color: Colors.black,
                fontSize: 27.5,
                fontFamily: 'Kanit',
              ),
            ),
            new Divider(),
            
            new Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
              new Chip(
                backgroundColor: Colors.black,
                label: new Text(
                  '',
                  style: new TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class MoreInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final ThemeData themeData = Theme.of(context);
  final TextStyle aboutTextStyle = themeData.textTheme.body2;
  final TextStyle linkStyle = themeData.textTheme.body2.copyWith(color: themeData.accentColor);
    return new Scaffold(
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: new Text(
          'More Info',
           textAlign: TextAlign.center,
            style: new TextStyle(
            color: Colors.white,
            fontSize: 27.5,
            fontFamily: 'Kanit'
          ),
        ),
      ),
      body: new Center(
          child: new Column(
          children: [
            new Divider(color: Colors.white),
            new ListTile(
              title: new Text('',
                  style: new TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    )
                  ),
              subtitle: new Text(
                '',
                style: new TextStyle(
                  fontFamily: 'Poppins',
                  ),
                ),
              leading: new CircleAvatar(
                radius: 30.0,
                backgroundImage: new NetworkImage('https://github.com/Jak3-02/ctavatar/blob/master/sqinterlock.png')
              )
            ),
            new Divider(),
            new Text('Where do we get our information?',
                  style: new TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 16.5,
                    )
                  ),
            new Divider(color: Colors.white),
            new Text("News Feed: bit.ly/2MFpzHX",
                style: new TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.5,
                  ),
                ),
            new Divider(color: Colors.white),
            new Text("Crypto Feed: bit.ly/2iIdJht",
                style: new TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.5,
                  ),
                ),
            new Divider(color: Colors.white),
            new Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
              new Chip(
                backgroundColor: Colors.black,
                label: new Text(
                  '',
                  style: new TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HomePageState extends State<HomePage> implements CryptoListViewContract {
  CryptoListPresenter _presenter;
  List<Crypto> _currencies;
  bool _isLoading;
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];
  


  _HomePageState() {
    _presenter = new CryptoListPresenter(this);
  }


    List<String> items = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8"
  ];

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Cryp - Tick Exchange",
          style: new TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 22.5,
            ),
        ),
        iconTheme: new IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF273A48),
        elevation: 0.0,
        centerTitle: true,
      ),
      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new DrawerHeader(
              child: new CircleAvatar(
              child: new Image.asset('images/ctavatar.png'),
              ),
              decoration: new BoxDecoration(
                color: Colors.black,
              ),
            ),
            new MaterialButton(
              child: new Text(
                    'Server Status',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 27.5,
                      fontFamily: 'Kanit'
                    ),
                  ),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ServerStatusScreen()),
              );
            }
            ),
            new Divider(),
            new MaterialButton(
              child: new Text(
                    'More Info',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 27.5,
                      fontFamily: 'Kanit'
                    ),
                  ),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MoreInfoScreen()),
              );
            }
            ),
            new Divider(),
            new Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
              new Chip(
                backgroundColor: Colors.black,
                label: new Text(
                  'v0.0.1',
                  style: new TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
      body: _isLoading
            ? new Center(
          child: new CupertinoActivityIndicator(radius: 15.0)
        )
        : _allWidget()
    );
  }

  Widget _allWidget() {
  final _width = MediaQuery.of(context).size.width;
  final _height = MediaQuery.of(context).size.height;
//CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED
   final headerList = new ListView.builder(
      itemBuilder: (context, index) {
        EdgeInsets padding = index == 0?const EdgeInsets.only(
            left: 20.0, right: 10.0, top: 4.0, bottom: 30.0):const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 4.0, bottom: 30.0);
        return new Padding(
          padding: padding,
          child: new InkWell(
            onTap: () {
              print('Card selected');
            },
            child: new Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
                color: const Color(0xFF273A48),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ],
                image: new DecorationImage(
                  image: new ExactAssetImage(
                      'assets/img_${index%items.length}.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
//                                    height: 200.0,
              width: 200.0,
              child: new Stack(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.bottomCenter,
                    child: new Container(
                        decoration: new BoxDecoration(
                            color: const Color(0xFF273A48),
                            borderRadius: new BorderRadius.only(
                                bottomLeft: new Radius.circular(10.0),
                                bottomRight: new Radius.circular(10.0)
                              ),
                            ),
                        height: 30.0,
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              '${items[index%items.length]}',
                              style: new TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',  
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: _currencies.length,
    );
   
      final body = new Scaffold(
      backgroundColor: Colors.transparent,
      body: new Container(
        child: new Stack(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(top: 10.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Align(
                    alignment: Alignment.centerLeft,
                    child: new Padding(
                        padding: new EdgeInsets.only(left: 10.0,),
                        child: new Text(
                          "Trending",
                            style: new TextStyle(
                            letterSpacing: 0.8,
                            fontFamily: 'Kanit',
                            fontSize: 17.5,
                            color: Colors.white,
                          ),
                        )
                      ),
                  ),
                  new Container(
                    height: 300.0, width: _width, child: headerList),
                  new Expanded(child:
                  ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                  final int i = index;
                  final Crypto currency = _currencies[i];
                  final MaterialColor color = _colors[i % _colors.length];
                    return new ListTile(
                      title: new Column(
                        children: <Widget>[
                          new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Container(
                                height: 72.0,
                                width: 72.0,
                                decoration: new BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      new BoxShadow(
                                          color:
                                          Colors.black.withAlpha(80),
                                          offset: const Offset(2.0, 2.0),
                                          blurRadius: 15.0)
                                    ],
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(35.0)),
                                    image: new DecorationImage(
                                      image: new ExactAssetImage(
                                        "cryptoiconsBlack/"+currency.symbol.toLowerCase()+"@2x.png",
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              new SizedBox(
                                width: 8.0,
                              ),
                              new Expanded(
                                  child: new Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Text(
                                        currency.name,
                                        style: new TextStyle(
                                            fontSize: 15.0,
                                            fontFamily: 'Poppins',
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      _getSubtitleText(currency.price_usd, currency.percent_change_1h),
                                    ],
                                  )),
                             
                            ],
                          ),
                          new Divider(),
                        ],
                      ),
                    );
                  }))
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return new Container(
      decoration: new BoxDecoration(
        color: const Color(0xFF273A48),
      ),
      child: new Stack(
        children: <Widget>[
          new CustomPaint(
            size: new Size(_width, _height),
            painter: new Background(),
          ),
          body,
        ],
      ),
    );

      

  }

// CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED CRYPTO FEED


  Widget _getSubtitleText(String priceUSD, String percentageChange) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$priceUSD\n", style: new TextStyle(
          color: Colors.black,
          fontSize: 14.0,
          ));
    String percentageChangeText = "1 hour: $percentageChange%";
    TextSpan percentageChangeTextWidget;

    if (double.parse(percentageChange) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText,
          style: new TextStyle(
            color: Colors.green,
            fontFamily: 'PoppinsMediumItalic',
            ));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: new TextStyle(
            color: Colors.red,
            fontFamily: 'PoppinsMediumItalic',
            ));
    }

    return new RichText(
        text: new TextSpan(
            children: [priceTextWidget, percentageChangeTextWidget]));
  }


  //DONT TOUCH, Works with cryptoListViewContract implimentation in _MyHomePageState
    @override
  void onLoadCryptoComplete(List<Crypto> items) {
    // TODO: implement onLoadCryptoComplete

    setState(() {
      _currencies = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadCryptoError() {
    // TODO: implement onLoadCryptoError
  }
  
}
