import 'package:flutter/material.dart';
import 'package:medical_desktop/screens/equations/cardio/imc/imc_card.dart';
import 'package:medical_desktop/screens/equations/cardio/ldl/ldl_card.dart';
import 'package:medical_desktop/screens/equations/cardio/mean_blood_pressure/mean_blood_pressure_card.dart';

class CardioEquationsScreen extends StatefulWidget {
  final int patientId;

  CardioEquationsScreen({@required this.patientId});

  @override
  _CardioEquationsScreenState createState() => _CardioEquationsScreenState();
}

class _CardioEquationsScreenState extends State<CardioEquationsScreen> {

  int get patientId => widget.patientId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cardiologia"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          meanBloodPressureCard(context, patientId),
          ldlCard(context, patientId),
          imcCard(context, patientId)
        ],
      ),
    );
  }
}
