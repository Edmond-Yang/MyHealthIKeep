import 'package:flutter/material.dart';

class Event{
  String category = '';
  String item;
  int calories;
  DateTime time;

  String photo = '';

  Event({required this.item, required this.calories, required this.time}){

    if(time.hour >= 5 && time.hour < 17){
      photo = 'images/morning.jpg';
      category = 'White Day';
    }
    else {
      photo = 'images/evening.png';
      category = 'Black Night';
    }

  }
}