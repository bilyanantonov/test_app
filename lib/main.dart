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
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State {
  List<Widget> _commentCards = [commentCard(), commentCard()];
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Column(
            children: <Widget>[
              Column(
                children: _commentCards,
              ),
              _buildButton()
            ],
          ),
        )),
      ),
    );
  }

  _buildButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Container(
        margin: EdgeInsets.only(top: 40),
        width: MediaQuery.of(context).size.width,
        height: 50,
        padding: EdgeInsets.all(0.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), border: Border.all()),
        child: FlatButton(
            padding: EdgeInsets.all(0.0),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            child: Text(
              'SEE MORE COMMENTS',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 12),
            ),
            onPressed: () {
              setState(() {
                if (!showAll) {
                  for (var i = 0; i < 3; i++) {
                    _commentCards.add(commentCard());
                  }
                  showAll = true;
                } else {
                  for (var i = 0; i < 3; i++) {
                    _commentCards.removeLast();
                  }
                  showAll = false;
                }
              });

              // ackAlert(context);
            }),
      ),
    );
  }
}

Widget commentCard() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            offset: Offset(1.0, 5.0),
            spreadRadius: 1.0)
      ],
    ),
    padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 20),
    margin: EdgeInsets.only(top: 20),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    "Nice Product",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(77, 77, 77, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  margin: EdgeInsets.only(left: 3),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Color.fromRGBO(255, 191, 0, 1),
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromRGBO(255, 191, 0, 1),
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromRGBO(255, 191, 0, 1),
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromRGBO(255, 191, 0, 1),
                        size: 18,
                      ),
                      Icon(
                        Icons.star_half,
                        color: Color.fromRGBO(255, 191, 0, 1),
                        size: 18,
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Bilyan Antonov",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(77, 77, 77, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      "October 2th 2018",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(77, 77, 77, 1),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(5),
          child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
              style: TextStyle(
                  color: Color.fromRGBO(77, 77, 77, 1), fontSize: 13)),
        )
      ],
    ),
  );
}
