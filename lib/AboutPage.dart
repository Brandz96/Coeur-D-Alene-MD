import 'package:flutter/material.dart';
import 'AffixPage.dart';
import 'HomePage.dart';
import 'package:demo_app/HomePageClone.dart';

import 'RootDictionaryPage.dart';
import 'StemPage.dart';

class AboutPage extends StatefulWidget {
  AboutPage(
      {Key key,
      this.title,
      this.backGroundColor,
      this.tileBackGroundColor,
      this.counterFromPreviousPage})
      : super(key: key);

  static const String routeName = "/AboutPage";

  final String title;

  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;

  @override
  _AboutPageState createState() => new _AboutPageState(
      backGroundColor, tileBackGroundColor, counterFromPreviousPage);
}

class _AboutPageState extends State<AboutPage> {
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;

  _AboutPageState(this.backGroundColor, this.tileBackGroundColor,
      this.counterFromPreviousPage);

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onBackPressed() {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            new HomePageClone(
                backGroundColor: backGroundColor,
                tileBackGroundColor: tileBackGroundColor,
                counterFromPreviousPage: counterFromPreviousPage),
        maintainState: true,
        opaque: true,
        transitionDuration: Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
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

  int _selectedIndex = 0;

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
                    counterFromPreviousPage: counterFromPreviousPage),
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
                    counterFromPreviousPage: counterFromPreviousPage),
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
                    counterFromPreviousPage: counterFromPreviousPage),
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
                    counterFromPreviousPage: counterFromPreviousPage),
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

  Color iconColor;

  Color setIconColor(int n){
    if(n % 2 == 0 || n == 0){
      iconColor = Colors.white;
      return iconColor;
    } else {
      iconColor = tileBackGroundColor;
      return iconColor;
    }
  }





  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: new Text(
            'Coeur D\' Alene Mobile Dictionary',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 9,
            ),
          ),
          centerTitle: true,
          leading: GestureDetector(
            // Navigator.push(context, MaterialPageRoute(builder: (context) => Home())),
            onTap: () {
              Navigator.of(context).pushReplacement(new PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      new HomePageClone(
                        backGroundColor: backGroundColor,
                        tileBackGroundColor: tileBackGroundColor,
                        counterFromPreviousPage: counterFromPreviousPage,
                      ),
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
          backgroundColor: backGroundColor,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: backGroundColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: new Icon(
                  Icons.home,
                  color: setIconColor(counterFromPreviousPage),
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.white,
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
                  color: Colors.white,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.archive, color:
              setIconColor(counterFromPreviousPage),),
              title: Text(
                'Stem',
                style: TextStyle(
                  color: Colors.white,
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
                  color: Colors.white,
                ),
              ),
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
        backgroundColor: backGroundColor,
        body: CustomPaint(
          painter: BluePainter(backGroundColor, counterFromPreviousPage),
          child: Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(top: 30)),
              new RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "\tAbout",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 32,
                    )),
                TextSpan(
                    text: " this",
                    style: TextStyle(color: Colors.white70, fontSize: 32)),
                TextSpan(
                    text: ' App',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 32)),
              ])),
              new Padding(padding: EdgeInsets.only(top: 30)),
              new Expanded(
                  child: new SingleChildScrollView(
                      padding: EdgeInsets.only(left: 32, right: 32, bottom: 10),
                      child: Text(
                        "\t\tThe Coeur d’Alene are an autonomous Native American tribe in Idaho who are exceptionally proud of their culture and language. Like many indigenous languages around the United States and the world, Salish, the language of the Coeur d’Alene, is endangered. The purpose of the Coeur d’Alene Mobile Dictionary Application, which we call COLRC Mobile after the Coeur d’Alene Online Resource Center website, is to give the tribe a way to preserve and promote their language. The application was designed to be used in classrooms, at work, and on the go in the everyday lives of tribe members. The entire dictionary is accessible even without an Internet connection without slowing down the user’s device. It is also built to be cross-platform, which means it can be used on any iOS device as well as Android devices. Additional features, such as integrated feedback submission and a robust, self-maintaining database, make this application a valuable and adaptable resource for the Coeur d’Alene. There are many more tribes and peoples like the Coeur d’Alene, and to help them replicate our results, we plan on sharing our code on open source websites so that others can easily adapt the software to other language sets. This application will make it easier to access language data anywhere at anytime, helping keep endangered languages, which are a cornerstone of many cultures, in circulation for generations to come.",
                        style: TextStyle(color: Colors.white70),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

//String sb = "The Coeur d’Alene are an autonomous Native American tribe in Idaho who are exceptionally proud of their culture and language. Like many indigenous languages around the United States and the world, Salish, the language of the Coeur d’Alene, is endangered. The purpose of the Coeur d’Alene Mobile Dictionary Application, which we call COLRC Mobile after the Coeur d’Alene Online Resource Center website, is to give the tribe a way to preserve and promote their language. The application was designed to be used in classrooms, at work, and on the go in the everyday lives of tribe members. The entire dictionary is accessible even without an Internet connection without slowing down the user’s device. It is also built to be cross-platform, which means it can be used on any iOS device as well as Android devices. Additional features, such as integrated feedback submission and a robust, self-maintaining database, make this application a valuable and adaptable resource for the Coeur d’Alene. There are many more tribes and peoples like the Coeur d’Alene, and to help them replicate our results, we plan on sharing our code on open source websites so that others can easily adapt the software to other language sets. This application will make it easier to access language data anywhere at anytime, helping keep endangered languages, which are a cornerstone of many cultures, in circulation for generations to come.";
