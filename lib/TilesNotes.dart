import 'main.dart';
import 'package:flutter/material.dart';

class Note{

  String title;
  String text;
  String root;
  String stem;
  String affix;

  Note(this.title, this.text, this.root, this.stem, this.affix);


  Note.fromJson(Map<String, dynamic> json){




    title = json['nicodemus'];
    text = json['english'];
    root = json['root'];
    stem = json['stem'];
    affix = json['affix'];
  }

}


class StemNote{
  String stem;
  StemNote.fromJson(Map<String, dynamic> json){
    stem = json['stem'];
  }
}
class AffixNote{

  String affix;
  AffixNote.fromJson(Map<String, dynamic> json){
    affix = json['affix'];
  }


}