import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medical_desktop/blocs/result/result_bloc.dart';
import 'package:medical_desktop/event_bus/event_bus.dart';
import 'package:medical_desktop/models/event.dart';
import 'package:medical_desktop/models/patient.dart';
import 'package:medical_desktop/models/result.dart';
import 'package:medical_desktop/screens/categories/categories_screen.dart';
import 'package:medical_desktop/screens/result/result_card.dart';
import 'package:medical_desktop/utils/nav.dart';

class ResultScreen extends StatefulWidget {
  final Patient patient;

  ResultScreen({@required this.patient});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  Patient get patient => widget.patient;

  StreamSubscription<Event> subscription;

  ResultBloc _bloc;


  @override
  void initState() {
    super.initState();
    _bloc = ResultBloc(patientId: patient.id);

    final bus = EventBus.get(context);
    subscription = bus.stream.listen((Event e){
      print("Event $e");
      Event event = e;
      if(event.type == "resultado"){
        _bloc.fetch(patient.id);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(patient.name),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => push(context, CategoriesScreen(patientId: patient.id,)),
        child: Icon(Icons.assignment),


      ),
      body: StreamBuilder<List<Result>>(
        stream: _bloc.stream,
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.black87),
              ),
            );
          } else if (snapshot.data.length == 0){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.assignment),
                  SizedBox(height: 5,),
                  Text("Nenhum resultado cadastrado"),
                ],
              ),
            );
          }else{
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                  return resultCard(context, snapshot.data[index]);
                });
          }
        },
      )
    );
  }
}
