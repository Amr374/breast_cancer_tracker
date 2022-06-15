import 'dart:convert';

import 'package:final_app/components/cutsom.dart';
import 'package:final_app/models/formval.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class BloodAnalysis extends StatefulWidget {

  @override
  _BloodAnalysisState createState() => _BloodAnalysisState();
}

class _BloodAnalysisState extends State<BloodAnalysis> with TickerProviderStateMixin {
  bool press = true;
  final GlobalKey<FormState> _formKeyValue =  GlobalKey<FormState>();
  FormVal formVal = FormVal();
  Future uploadData(name,identity,age,bmi,glucose,insuline,homa,leptin,adiponcetin,resistine,mcp,context) async {
    var url = Uri.parse('https://bloodanalysisdiagnose.herokuapp.com/users/');
    final http.Response response = await http.post( url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "name": name,
        "identitycard": identity,
        "age": age,
        "bmi": bmi,
        "glucouse": glucose,
        "insuline": insuline,
        "homa": homa,
        "leptin": leptin,
        "adiponcetin": adiponcetin,
        "resistiin": resistine,
        "mcp": mcp,
        "classification": ""
      }),

    );
    if(response.statusCode == 201){
      Navigator.pushNamed(context, 'Result');
    }else{
      setState(() {
        press = false;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text('Blood Analysis',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red[200],
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.red[200],
          statusBarIconBrightness: Brightness.dark,
        ),
      ),

        body: ListView(
              children: <Widget>[
                Stack(
                  children: [
                    Container(height:MediaQuery.of(context).size.height-89,
                        child: Image.asset('assets/blo.jpg',fit: BoxFit.fill,
                        ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.9),
                            blurRadius: 50.0,
                            spreadRadius: 50.0,
                          )
                        ],
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:50.0),
                      child: Form(
                          key: _formKeyValue,
                          autovalidate: true,
                          child: GridView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.8,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 1,
                                // childAspectRatio: 2,
                              ),
                              padding: const EdgeInsets.all(5),
                            children: [
                              CustomTextField(onClick:(val) => formVal.name = val,hint: 'Name',input:'String'),
                              CustomTextField(onClick:(val) => formVal.identitycard = int.parse(val) ,hint: 'Identity Card',),
                              CustomTextField(onClick:(val) => formVal.age = int.parse(val),hint: 'Age',),
                              CustomTextField(onClick:(val) => formVal.bmi = double.parse(val),hint: 'BMI',),
                              CustomTextField(onClick:(val) => formVal.glucouse = double.parse(val),hint: 'Glucouse',),
                              CustomTextField(onClick:(val) => formVal.insuline = double.parse(val),hint: 'Insuline',),
                              CustomTextField(onClick:(val) => formVal.homa = double.parse(val),hint: 'Homa',),
                              CustomTextField(onClick:(val) => formVal.leptin = double.parse(val),hint: 'Leptin',),
                              CustomTextField(onClick:(val) => formVal.adiponcetin = double.parse(val),hint: 'Adiponcetin',),
                              CustomTextField(onClick:(val) => formVal.resistiin = double.parse(val),hint: 'Resistin',),
                              CustomTextField(onClick:(val) => formVal.mcp = double.parse(val),hint: 'mcp',),
                            ],


                          )

                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height-110,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 70,
                          width: 150,
                          child: press?RaisedButton(
                            onPressed: (){
                            // fetchData(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11);
                            final FormState formStateVal = _formKeyValue.currentState;
                            if(formStateVal.validate()){
                              formStateVal.save();
                              print('Form validated and saved');
                              // print('Name :${formVal.age}');
                              // print('Phone :${formVal.name}');
                              // print('Email :${formVal.mcp}');
                              uploadData(formVal.name,formVal.identitycard,formVal.age,formVal.bmi,formVal.glucouse,formVal.insuline,formVal.homa,formVal.leptin,formVal.adiponcetin,formVal.resistiin,formVal.mcp,context);

                              // CustomTextField().controller.clear();



                            }
                            else{
                              return null;
                            }
                          },
                            shape: const RoundedRectangleBorder(

                                borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                side: BorderSide( color: Colors.white,
                                  width: 3,)
                            ),
                            color: Colors.pink[200],
                            child: Text('Diagnose',style: TextStyle(fontSize: 15,color: Colors.white),),


                          ):CircularProgressIndicator(),
                        ),
                      ),
                    )
                  ],
                ),
              ]),

    );
  }
}
