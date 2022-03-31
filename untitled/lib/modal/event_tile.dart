import 'package:flutter/material.dart';
import 'package:untitled/object/event.dart';

class EventTile extends StatelessWidget {

  final Event event;
  final textStyle = const TextStyle(fontFamily: 'Barlow', fontSize: 26.0);
  const EventTile({Key? key, required this.event}) : super(key: key);

  void showModal(BuildContext context){
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context){
          return DraggableScrollableSheet(
              initialChildSize: .75,
              maxChildSize: .75,
              minChildSize: .75,
              builder: (context, scroller){
                return ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.elliptical(30, 20),
                    topRight: Radius.elliptical(30, 20),
                  ),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
                    child: SingleChildScrollView(
                      controller: scroller,
                      child: Column(
                        children: [
                        Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              iconSize: 20.0,
                              padding: const EdgeInsets.all(1.0),
                              splashRadius: 20.0,
                              icon: const Icon(
                                Icons.close,
                              ))
                        ],),
                        const SizedBox(height: 10.0,),
                        CircleAvatar(
                          backgroundImage: AssetImage(event.photo),
                          radius: 60.0,
                        ),
                        const SizedBox(height: 50.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('category',style: textStyle,),
                            Text(event.category,style: textStyle,)
                          ],
                        ),
                          const SizedBox(height: 30.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('items',style: textStyle,),
                              Text(event.item,style: textStyle,)
                            ],
                          ),
                          const SizedBox(height: 30.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('time',style: textStyle,),
                              Text('${event.time.hour} : ${event.time.minute}',style: textStyle,)
                            ],
                          ),
                          const SizedBox(height: 30.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('calories',style: textStyle,),
                              Text(event.calories.toString() + ' cal',style: textStyle,)
                            ],
                          ),
                    ]),
                  )
                  ),
                );
              }
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (){
          showModal(context);
        },
        child: Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(event.photo),
              radius: 30.0,
            ),
            title: Text(event.item
              ,style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Barlow',
                fontSize: 20.0),),
            subtitle: Text(event.category
              ,style: const TextStyle(
                fontFamily: 'Barlow',
                fontSize: 15.0),),
            trailing: Text('${event.calories} cal'
              ,style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Barlow',
                  fontSize: 20.0),
            ),
          ),
        )
    );
  }
}
