import 'package:flutter/material.dart';
import 'package:medical_desktop/screens/equations/cardio/ldl/ldl_screen.dart';
import 'package:medical_desktop/screens/equations/cardio/mean_blood_pressure/mean_blood_pressure_screen.dart';
import 'package:medical_desktop/utils/nav.dart';


Widget ldlCard(BuildContext context, int patientId){
  return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(bottom: 0.0),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white30),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        // MediaQuery.of(context).size.width - 300
                        child: Text(
                          "LDL-Colesterol", style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Divider(
                thickness: 1.0,
              )
            ],
          ),
        ),
      ),
      onTap: () => push(context, LdlScreen(patientId: patientId,)));
}