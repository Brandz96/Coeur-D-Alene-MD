import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {

  AboutPage(
      {Key key, this.title, this.backGroundColor, this.tileBackGroundColor})
      : super(key: key);

  static const String routeName = "/AboutPage";

  final String title;

  Color backGroundColor;
  Color tileBackGroundColor;

  @override
  _AboutPageState createState() =>
      new _AboutPageState(backGroundColor, tileBackGroundColor);

}

class _AboutPageState extends State<AboutPage>{

  Color backGroundColor;
  Color tileBackGroundColor;

  _AboutPageState(this.backGroundColor, this.tileBackGroundColor);

  @override
  void initState(){
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: new Text ('Coeur D\' Alene Mobile Dictionary', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 9,),),
        centerTitle: true,
        backgroundColor: backGroundColor,
      ),
      backgroundColor: backGroundColor,
      body: Column(
        children: <Widget>[
          new Padding(padding: EdgeInsets.only(top: 30)),
          new RichText(
              text: TextSpan(
                  children: <TextSpan> [

                    TextSpan(text: "\tAbout", style: TextStyle(color: Colors.white60, fontSize: 32,)),
                    TextSpan(text: " this", style: TextStyle(color: Colors.white70, fontSize: 32)),
                    TextSpan(text: ' App', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 32)),
                  ]
              )),
          new Padding(padding: EdgeInsets.only(top: 30)),
          new Expanded(
              child: new SingleChildScrollView(
                  padding: EdgeInsets.only(left: 32, right: 32, bottom: 10),
                  child: Text(
                    '   This resource contains the Coeur d\'Alene Root Dictionary (Lyon and Greene-Wood 2007) with nearly 1,400 roots and about 7690 \"word\" forms, Reichard\'s 1939 Stem List with some 1,300 stems, a list of roughly 200 affixes, and over 1,200 pages of Coeur d\'Alene texts (copies of Gladys Reichard\'s 1927-1929 field notes and typed manuscripts) and English translations from Reichard 1947. Resources to help with spelling and pronunciation of Coeur d\'Alene include lists of the consonant and vowel phonemes of Coeur d\'Alene, a comparison of the three different orthographies most commonly used to write Coeur d\'Alene (Nicodemus, Reichard, and Salishan), and a guide to pronunciation. A working bibliography is also included, and will be expanded soon.'  +
                        '\n'  +
                        '   The archive also links to Ivy Doak\'s grammatical sketch of Coeur d\'Alene. Other websites with Coeur d\'Alene material include the following: The official Coeur d\'Alene website; the 1917 publication of Teit\'s Coeur d\'Alene \"tales\" which include different versions of a small number of the Coeur d\'Alene texts in the archive; and Reichard\'s 1938 grammar published in The Handbook of American Indian Languages v. 3. Reichard\'s 1947 An Analysis of Coeur d\'Alene Indian Myths is available at the University of Michigan Digital Library General Collection. Lyon\'s 2010 Lawrence Nicodemus\'s Snchitsu\'umshtsn File Card Collection in Dictionary Format is also linked from the left menu.'  +
                        '\n'  +
                        '   The original Coeur d\'Alene archive was created by Shannon Bischoff and Musa Yassin Fort in the summer of 2009. The original website was created without any prior web design/building knowledge using w3schools.com free tutorials over a period of six weeks. The site was constructed using simple html, javascript, and css code, all designed based on lessons at the site. The search mechanisms were a bit more complicated and required php, which can also be learned at the w3 schools website.  '  +
                        '\n'  +
                        '   This version of the website is being revised with the support of the National Science Foundation (award numbers BCS-1160394 and BCS-1160627), but is still being developed using these freely available, open-source, and easily learnable tools - expanded to include xml and ajax. You can find free tutorials for all of these tools at w3schools.com. Additional resources will be included, as well as further documentation about the methods used by Reichard and Nicodemus to collect many of these resources. We also will be posting our source files (for all material other than the language resources themselves) to the site, so that anyone who\'d like to make use of our code to develop their own websites may do so. If you would like to help or have questions, comments or suggestions, contact us using the "Contact Us" link on the left menu, or by emailing us directly at: crd.archive@gmail.com.' ,
                    style: TextStyle(color: Colors.white70),)
              )
          ),
        ],
      ),
    );
  }
}





