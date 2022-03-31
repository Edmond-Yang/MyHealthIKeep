import 'package:flutter/material.dart';
import 'package:untitled/modal/event_tile.dart';
import 'package:untitled/object/event.dart';
import 'package:untitled/object/save_list.dart';
import 'package:provider/provider.dart';

class EventList extends StatelessWidget {

  const EventList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _list = Provider.of<Event_List>(context, listen: true);

    List<Widget> list = [];
    list.add(
        const SizedBox(height: 10.0,)
    );

    for(Event temp in _list.list){
      list.add(
        EventTile(event: temp)
      );
      list.add(
        const SizedBox(height: 10.0,)
      );
    }

    return Column(
      children: list,
    );
  }
}
