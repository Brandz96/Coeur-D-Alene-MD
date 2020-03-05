import 'package:demo_app/HomePageClone.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'HomePage.dart';
import 'package:demo_app/HomePageClone.dart';

class FeedBackPage extends StatefulWidget {
  FeedBackPage(
      {Key key, this.title, this.backGroundColor, this.tileBackGroundColor, this.counterFromPreviousPage})
      : super(key: key);

  static const String routeName = "/FeedBack";
  int counterFromPreviousPage;

  final String title;
  Color backGroundColor;
  Color tileBackGroundColor;

  @override
  _FeedBackState createState() =>
      _FeedBackState(backGroundColor, tileBackGroundColor, counterFromPreviousPage);
}

class _FeedBackState extends State<FeedBackPage> {
  final db = Firestore.instance;
  TextEditingController _customController = new TextEditingController();
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;

  _FeedBackState(this.backGroundColor, this.tileBackGroundColor, this.counterFromPreviousPage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Home())),
          onTap: () {
            Navigator.of(context).pushReplacement(new PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                new HomePageClone(backGroundColor: backGroundColor, tileBackGroundColor: tileBackGroundColor,counterFromPreviousPage: counterFromPreviousPage,),
                maintainState: true,
                opaque: true,
                transitionDuration: Duration(milliseconds: 600),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var begin = Offset(0.0, 1.0);
                  var end = Offset.zero;
                  var curve = Curves.ease;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                }));
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: new Padding(
          child: new Text(
            'Coeur D\' Alene Mobile Dictionary',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 9,
            ),
          ),
          padding: EdgeInsets.all(0),
        ),
        backgroundColor: backGroundColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Give Us Feedback!",
              style: TextStyle(
                fontSize: 19,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 8),
              child: Text(
                'We would love to hear feedback from our users, we appreciate suggestions, corrections or any comments you have for us!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            TextField(
                keyboardType: TextInputType.multiline,
                maxLength: null,
                maxLines: null,
                controller: _customController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  hintText: 'Enter your Feedback Here',
                  fillColor: Colors.grey,
                  hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                  enabledBorder: new UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                onChanged: (String) {}),
//            RaisedButton(
////              child: Text("Submit"),
////              onPressed: () async{
////            await db.collection("Feedback Storage").add({
////                'User Input': _customController.text,
////              }
////            );
////            _customController.clear();
////              },
////            )
            RaisedButton(
                color: tileBackGroundColor,
                elevation: 10,
                onPressed: () async {
                  await db.collection("Feedback Storage").add({
                    'User Input': _customController.text,
                  });
                  _customController.clear();

                  Fluttertoast.showToast(
                    msg: "Thank You!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                    textColor: Color.fromRGBO(219, 95, 95, 1),
                    backgroundColor: tileBackGroundColor,
                  );
                },
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                padding: const EdgeInsets.all(0),
                child: Ink(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Container(
                      width: 350,
                      height: 20,
                      constraints:
                          const BoxConstraints(minWidth: 40, minHeight: 40),
                      alignment: Alignment.center,
                      child: const Text(
                        "Submit",
                        textAlign: TextAlign.center,
                      ),
                    ))),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
