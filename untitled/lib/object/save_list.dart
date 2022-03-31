import 'package:flutter/foundation.dart';
import 'package:untitled/object/event.dart';

class Event_List with ChangeNotifier{

  int _total = 0;
  List<Event> _list = [];

  int get total => _total;
  List get list => _list;

  listAdd(Event temp) {
    _list.add(temp);
    _total += temp.calories;
    notifyListeners();
  }

}