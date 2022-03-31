import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/object/event.dart';
import 'package:untitled/object/save_list.dart';
import 'package:untitled/shared/event_list.dart';

void main() {
  runApp(MaterialApp(
    home: MultiProvider(
        providers: [ChangeNotifierProvider.value(value: Event_List())],
        child: const MyApp()),
  )
  );
}


class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  showModal(BuildContext context){

    String items = '';
    String calories = '';

    final _formKey = GlobalKey<FormState>();
    final list = Provider.of<Event_List>(context, listen: false);

    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context){
          return Form(
            key: _formKey,
            child: DraggableScrollableSheet(
                initialChildSize: .85,
                maxChildSize: .85,
                minChildSize: .85,
                builder: (context, scroller){
                  return ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.elliptical(30, 20),
                      topRight: Radius.elliptical(30, 20),
                    ),
                    child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(top: 5.0, left: 30.0, right: 30.0),
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

                                const SizedBox(height: 20.0,),
                                const Text('items',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Barlow',
                                    fontSize: 20.0),),
                                TextFormField(
                                  autofocus: true,
                                  validator: (value) {
                                    return value == null
                                        ? 'Please Enter Items'
                                        : null;
                                  },
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Barlow',
                                      fontSize: 20.0),
                                  onChanged: (value) {

                                      items = value;
                                  },
                                ),
                                const SizedBox(height: 15.0,),
                                const Text('calories',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Barlow',
                                        fontSize: 20.0)),
                                TextFormField(
                                      validator: (value) {
                                        return value == null
                                            ? 'Please Enter Calories'
                                            : int.tryParse(value) == null
                                            ? 'Please Enter Integer'
                                            : null;
                                      },
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Barlow',
                                        fontSize: 20.0),
                                      onChanged: (value) {
                                        calories = value;
                                      },
                                    ),

                                const SizedBox(height: 30.0,),
                                TextButton.icon(
                                    onPressed: (){
                                      if (_formKey.currentState!.validate()){
                                        list.listAdd(Event(
                                          item: items,
                                          calories: int.parse(calories),
                                          time: DateTime.now()
                                        ));
                                        Navigator.pop(context);
                                      }
                                    },
                                    icon: const Icon(Icons.upload,size: 20.0,),
                                    label: const Text('Upload',
                                      style: TextStyle(
                                        fontFamily: 'Barlow',
                                        fontSize: 20.0),)),
                              ]),
                        )
                    ),
                  );
                }
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<Event_List>(context, listen: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Calories Bank',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Barlow',
                  fontSize: 30.0,
              ),),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/background.jpg'),
                    fit: BoxFit.cover
                )
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children : [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 10.0,),
                        Text('Total :  ${list.total} cal',
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Barlow',
                              fontSize: 30.0),),
                        const SizedBox(width: 10.0,),
                      ],
                    ),
                    EventList(),
              ]),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              showModal(context);
            },
            child: const Icon(Icons.add),
          ),
        ));
  }
}

