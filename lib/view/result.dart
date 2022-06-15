import 'package:final_app/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' as http;

class Result extends StatefulWidget {

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> with TickerProviderStateMixin{
  bool isPressed = false ;
  List<Model> elements;
  Future<List<Model>> fetchResults() async {
    var url = Uri.parse('https://bloodanalysisdiagnose.herokuapp.com/users/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<Model> results = modelFromJson(response.body);
      elements = [...results];
      return results;
    } else {

      throw Exception('EXCEPTION');
    }
  }

  // @override
  // void initState() {
  //
  //   fetchShops();
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {

    Future<void> as() async {
      var data = await rootBundle.load("assets/Helvetica.ttf");
      var myFont = pw.Font.ttf(data);
      var myStyle = pw.TextStyle(font: myFont,fontSize: 30,fontWeight: pw.FontWeight.bold);

      final pdf = pw.Document();
      Directory doucumentDirectory = await getApplicationDocumentsDirectory() ;
      String documentPath = doucumentDirectory.path;

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) => pw.Container(
            width: 600,
            // padding: const pw.EdgeInsets.only(left:10,top:50),
            child: pw.Center(
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.start,

                  children: [
                    // pw.Text('Breast Cancer Tracker'),
                    pw.Row(
                        children: [
                          pw.Column(
                              children: [
                                pw.Text('Name :',style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text('Identity Number :',style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text('Age :',style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text('BMI :',style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text('Glucouse :',style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text('Insuline :',style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text('Homa :',style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text('Leptin :',style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text('Adiponccetin :',style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text('Resistin :',style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text('mcp :',style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text('Classification :',style: myStyle),

                              ]
                          ),
                          pw.Column(
                              children: [
                                pw.Text(elements[elements.length-1].name,style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text(elements[elements.length-1].identitycard.toString(),style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text(elements[elements.length-1].age.toString(),style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text(elements[elements.length-1].bmi.toString(),style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text(elements[elements.length-1].glucouse.toString(),style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text(elements[elements.length-1].insuline.toString(),style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text(elements[elements.length-1].homa.toString(),style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text(elements[elements.length-1].leptin.toString(),style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text(elements[elements.length-1].adiponcetin.toString(),style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text(elements[elements.length-1].resistiin.toString(),style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text(elements[elements.length-1].mcp.toString(),style: myStyle),
                                pw.SizedBox(height: 15),
                                pw.Text(elements[elements.length-1].classification,style: myStyle),

                              ]
                          )
                        ]
                    )
                  ]
              )
            )
          ),
        ),
      );
      Future openFile(File file) async {
        final url = file.path;

        await OpenFile.open(url);
      }
      final file = File('$documentPath/example.pdf');
      await file.writeAsBytes(await pdf.save());
      openFile(file);
    } ;


    return Scaffold(
        body:  FutureBuilder<List<Model>>(
          future: fetchResults(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return         Container(
                  padding: EdgeInsets.only(top:0),
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.pink[500].withOpacity(.6),
                            Colors.pink[100].withOpacity(.5),
                          ]
                      )
                  ),
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        height:200,
                        width: 150,
                        child: Image.asset('assets/axxc.jfif',fit: BoxFit.fill,
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pink.withOpacity(.1),
                              blurRadius: .1,
                              spreadRadius: .1,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top:30),
                        // decoration: BoxDecoration(
                        //     gradient: LinearGradient(
                        //         colors: [
                        //           Colors.pink[400].withOpacity(.6),
                        //           Colors.pink[100].withOpacity(.5),
                        //
                        //         ]
                        //     )
                        // ),
                        child:Padding(
                          padding: const EdgeInsets.only(left: 1.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('With any result just ',style: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.w900),),
                              Text('believe in God and be Strong',style: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.w900),),
                              Padding(
                                padding: const EdgeInsets.only(left: 1.0),
                                // child: Text('and be Strong',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w900),),
                              ),
                            ],
                          ),
                        ) ,
                      ),
                      SizedBox(height: 40,),

                      Container(
                        padding: EdgeInsets.only(left:40,right: 40),
                        height: 50,
                        width: 30,
                        child: ElevatedButton(
                            style:ElevatedButton.styleFrom(primary: Colors.pink,elevation: 10),

                            child: Text("Show Result",style: TextStyle(fontSize: 15),),
                            onPressed: (){
                              setState(() {
                                isPressed = true ;
                              });


                            }),
                      ),
                      isPressed ? Container(
                        padding: EdgeInsets.only(top:10),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text('Name:    ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.white,)),
                                SizedBox(height: 10,),
                                Text('Identity Number:    ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.white)),
                                SizedBox(height: 10,),
                                Text('   Classification:    ',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w900,color: Colors.white)),
                                // Text(elements[m].name),
                              ],
                            ),
                            Column(
                              children: [
                                Text(elements[elements.length-1].name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.white,)),
                                SizedBox(height: 10,),
                                Text(elements[elements.length-1].identitycard.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.white)),
                                SizedBox(height: 10,),
                                Text(elements[elements.length-1].classification,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color: Colors.white)),
                                // Text(elements[m].name),
                              ],
                            ),
                          ],
                        ),) : Container(),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.only(left:40,right: 40),
                        height: 50,
                        width: 30,
                        child: ElevatedButton(
                            style:ElevatedButton.styleFrom(primary: Colors.pink,elevation: 15),
                            child: Text("Generate A PDF",style: TextStyle(fontSize: 15),),
                            onPressed: (){
                              as();

                            }),
                      ),
                    ],
                  )
              );
            } else if (snapshot.hasError) {
              return Container(
                  height: MediaQuery.of(context).size.height-300,
                  child: Center(
                      child: Text("تاكد من الاتصال بالانترنت",
                        style: TextStyle(fontWeight:FontWeight.w900
                        ),)));
            }
            // By default, show a loading spinner.
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        );


  }




}
