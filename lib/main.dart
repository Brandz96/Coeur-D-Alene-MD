import 'package:flutter/material.dart';
import 'FeedBackPage.dart';
import 'RootDictionaryPage.dart';
import 'AboutPage.dart';
import 'StemPage.dart';
import 'AudioPage.dart';
import 'AffixPage.dart';
import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.



  @override
  Widget build(BuildContext context) {

    var routes = <String, WidgetBuilder>{


      RootDictionaryPage.routeName: (BuildContext context) =>
      new RootDictionaryPage(title: 'RootDictionaryPage'),

      AboutPage.routeName: (BuildContext context) =>
      new AboutPage(title: 'AboutPage',),

      StemPage.routeName: (BuildContext context) => new StemPage(title: 'StemPage',),

      AudioPage.routeName: (BuildContext context) =>
      new AudioPage(title: 'Audio'),

      AffixPage.routeName: (BuildContext context) =>
      new AffixPage(title: 'Affix'),

      FeedBackPage.routeName: (BuildContext context) =>
      new FeedBackPage(title: 'FeedBack'),
    };


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          unselectedWidgetColor: Colors.white70


      ),
      home: Home(),
      routes: routes,
    );
  }
}

//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//
//    List<Slide> slides = new List();
//
//    void initState(){
//    super.initState();
//
//    slides.add(
//      new Slide(
//        title: "Root Dictionary",
//        description: "Look through the Nicodemus root dictionary and search for words in English or Nicodemus",
//        pathImage: "images/edit2.png",
//        heightImage: 140,
//        widthImage: 140,
//        backgroundColor: Color.fromRGBO(78, 46, 114, .7),
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "Stem and Affix Lists",
//        pathImage: "images/clipboard.png",
//        heightImage: 140,
//        widthImage: 140,
//        description: "This app includes the Nicodemus Stem and Affix Lists",
//        backgroundColor: Color.fromRGBO(78, 46, 114, .9),
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "Learn or Practice Nicodemus",
//        pathImage: "images/quiz.png",
//        heightImage: 140,
//        widthImage: 140,
//        description: "Learn Nicodemus by participating in our learning activies",
//        backgroundColor: Color.fromRGBO(252, 11,106,.8),
//      ),
//    );
//
//  }
//
//  void onDonePress(){
//    Navigator.push(context,
//        MaterialPageRoute(
//            builder: (context) => Home()
//        ));
//  }
//  void onSkipPress(){
//    //go to next screen
//    Navigator.push(context,
//        MaterialPageRoute(
//            builder: (context) => Home()
//        ));
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new IntroSlider(slides:
//    this.slides,
//      onDonePress: this.onDonePress,
//      onSkipPress: this.onSkipPress,
//    );
//  }
//
//
//
//
//
//}










