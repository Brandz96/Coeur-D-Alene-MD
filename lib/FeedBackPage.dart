import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/HomePageClone.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'AffixPage.dart';
import 'HomePage.dart';
import 'RootDictionaryPage.dart';
import 'StemPage.dart';

// ignore: must_be_immutable
class FeedBackPage extends StatefulWidget {
  FeedBackPage({Key key, this.title, this.backGroundColor, this.tileBackGroundColor, this.counterFromPreviousPage,
    this.titleColor, this.circularFrame})
      : super(key: key);

  static const String routeName = "/FeedBack";
  int counterFromPreviousPage;

  final String title;
  Color backGroundColor;
  Color titleColor;
  Color tileBackGroundColor;
  Color circularFrame;

  @override
  _FeedBackState createState() =>
      _FeedBackState(
          backGroundColor, tileBackGroundColor, counterFromPreviousPage,
          this.titleColor, this.circularFrame);
}

class _FeedBackState extends State<FeedBackPage> {
  final db = Firestore.instance;
  TextEditingController _customController = new TextEditingController();
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;
  Color titleColor;
  Color circularFrame;

  _FeedBackState(this.backGroundColor, this.tileBackGroundColor,
      this.counterFromPreviousPage,
      this.titleColor, this.circularFrame);

  // ignore: missing_return
  Future<bool> _onBackPressed(){
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        new HomePageClone(backGroundColor: backGroundColor,
          tileBackGroundColor: tileBackGroundColor,
          counterFromPreviousPage: counterFromPreviousPage,
          titleColor: titleColor,
          circularFrame: circularFrame,),
        maintainState: true,
        opaque: true,
        transitionDuration: Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        }
    ));
  }

  int _selectedIndex = 0;

  Color iconColor;

  Color setIconColor(int n){
    if(n % 2 == 0 || n == 0){
      iconColor = tileBackGroundColor;
      return iconColor;
    } else {
      iconColor = titleColor;
      return iconColor;
    }
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print('Index' + _selectedIndex.toString());

      if (_selectedIndex == 0) {
        Navigator.of(context).pushReplacement(new PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            new HomePageClone(
              backGroundColor: backGroundColor,
              tileBackGroundColor: tileBackGroundColor,
              counterFromPreviousPage: counterFromPreviousPage,
              titleColor: titleColor,
              circularFrame: circularFrame,),
            maintainState: true,
            opaque: true,
            transitionDuration: Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(0.0, 1.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            }));
      }

      if (_selectedIndex == 1) {
        Navigator.of(context).pushReplacement(new PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            new RootDictionaryPage(
              backGroundColor: backGroundColor,
              tileBackGroundColor: tileBackGroundColor,
              counterFromPreviousPage: counterFromPreviousPage,
              titleColor: titleColor,
              circularFrame: circularFrame,),
            maintainState: true,
            opaque: true,
            transitionDuration: Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(0.0, 1.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            }));
      }
      if (_selectedIndex == 2) {
        Navigator.of(context).pushReplacement(new PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            new StemPage(
              backGroundColor: backGroundColor,
              tileBackGroundColor: tileBackGroundColor,
              counterFromPreviousPage: counterFromPreviousPage,
                titleColor: titleColor,
                circularFrame: circularFrame),
            maintainState: true,
            opaque: true,
            transitionDuration: Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(0.0, 1.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            }));
      }
      if (_selectedIndex == 3) {
        Navigator.of(context).pushReplacement(new PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            new AffixPage(
              backGroundColor: backGroundColor,
              tileBackGroundColor: tileBackGroundColor,
              counterFromPreviousPage: counterFromPreviousPage,
              titlecolor: titleColor,
              circularFrame: circularFrame,),
            maintainState: true,
            opaque: true,
            transitionDuration: Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(0.0, 1.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          centerTitle: true,
          leading: GestureDetector(
            // Navigator.push(context, MaterialPageRoute(builder: (context) => Home())),
            onTap: () {
              Navigator.of(context).pushReplacement(new PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                  new HomePageClone(backGroundColor: backGroundColor,
                    tileBackGroundColor: tileBackGroundColor,
                    counterFromPreviousPage: counterFromPreviousPage,
                    titleColor: titleColor,
                    circularFrame: circularFrame,),
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
              color: titleColor,
            ),
          ),
          title: new Padding(
            child: new Text(
              'Coeur D\' Alene Mobile Dictionary',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: titleColor,
                fontSize: 9,
              ),
            ),
            padding: EdgeInsets.all(0),
          ),
          backgroundColor: backGroundColor,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: backGroundColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: new Icon(
                  Icons.home,
                  color:  setIconColor(counterFromPreviousPage),
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: titleColor,
                  ),
                ),
                backgroundColor: backGroundColor),
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.translate,
                color: setIconColor(counterFromPreviousPage),
              ),
              title: Text(
                'Root',
                style: TextStyle(
                  color: titleColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.archive, color: setIconColor(counterFromPreviousPage),),
              title: Text(
                'Stem',
                style: TextStyle(
                  color: titleColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.assignment,
                color: setIconColor(counterFromPreviousPage),
              ),
              title: Text(
                'Affix',
                style: TextStyle(
                  color: titleColor,
                ),
              ),
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),

        body: CustomPaint(
          painter: BluePainter(backGroundColor, counterFromPreviousPage),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Give Us Feedback!",
                  style: TextStyle(
                    fontSize: 19,
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 8),
                  child: Text(
                    'We would love to hear feedback from our users, we appreciate suggestions, corrections or any comments you have for us!',
                    style: TextStyle(
                      color: titleColor,
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
                      fillColor: titleColor,
                      hintStyle: TextStyle(color: titleColor, fontSize: 15),
                      enabledBorder: new UnderlineInputBorder(
                        borderSide: BorderSide(color: titleColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: titleColor),
                      ),
                    ),
                    // ignore: non_constant_identifier_names
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
                    elevation: 3,
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
                        borderRadius: BorderRadius.circular(10)),
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
                          child: Text(
                            "Submit",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: titleColor,
                            ),
                          ),
                        ))),
              ],
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
