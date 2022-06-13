import 'dart:convert';

import 'package:final_app/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void didChangeDependencies() {
    //init provider

    super.didChangeDependencies();
  }
String test ='';
  int m = 0;
  List elements = [];
  Future<List<Model>> fetchShops() async {
    var url = Uri.parse('https://bloodanalysisdiagnose.herokuapp.com/users/');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<Model> Shops = modelFromJson(response.body);
      for(var i=0;i<Shops.length;i++){
        if (Shops[i].identitycard == id ){
          setState(() {
            m = i;
          });
        }
        else{
          setState(() {
            test = 'No Record For This Identity Card';
          });
        }
        // elements[i] = Shops[i];
      }
      return Shops;
    } else {

      throw Exception('EXCEPTION');
    }
  }
// @override
//   void initState() {
//   fetchShops();
//   int cat = ModalRoute.of(context).settings.arguments;
//   super.initState();
//
//   }
  final TextEditingController searchController = TextEditingController();
  var id = 0;
  bool pressed = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.only(top:0.0),
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 270.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(75.0)),
                    color: Colors.pink[300],
                  ),
                ),
                Container(
                  height: 210.0,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(65.0)),
                      color: Colors.pink[200]),
                ),
                Container (
                  padding: EdgeInsets.only(top: 45.0, left: 15.0),
                  child: Text(
                    'Good Afternoon!',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 23.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 100.0, left: 15.0),
                  child: Text(
                    'Fight Like A Girl',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 175.0, left: 15.0,right: 35.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25.0),
                          bottomLeft: Radius.circular(5.0),
                          topLeft: Radius.circular(5.0),
                        )),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        //   contentPadding: EdgeInsets.only(top: 14.0),
                        hintText: 'Search By Identitycard ',
                        hintStyle: TextStyle(fontFamily: 'Montserrat', fontSize: 14.0),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                      ),
                      textInputAction: TextInputAction.search,
                      controller: searchController,
                      onSubmitted: (value) {
                        setState(() {
                          pressed = true;
                          id = int.parse(searchController.text);
                        });
                      },
                    ),
                  ),
                )

              ],
            ),
            FutureBuilder<List<Model>>(
              future: fetchShops(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      pressed==true ?
                      m>0?Container(
                        padding: EdgeInsets.only(top:150),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text('Name:    ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Colors.black,)),
                                SizedBox(height: 10,),
                                Text('Identity Number:    ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Colors.black)),
                                SizedBox(height: 10,),
                                Text('   Classification:    ',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color: Colors.black)),
                                // Text(elements[m].name),
                              ],
                            ),
                            Column(
                              children: [
                                Text(snapshot.data[m].name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Colors.black,)),
                                SizedBox(height: 10,),
                                Text(snapshot.data[m].identitycard.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Colors.black)),
                                SizedBox(height: 10,),
                                Text(snapshot.data[m].classification,style: TextStyle(fontSize: 28,fontWeight: FontWeight.w900,color: Colors.black)),
                                // Text(elements[m].name),
                              ],
                            ),
                          ],
                        ),
                      ):Container(
                        child: Center(
                          child: Text(test)
                        ),
                      ):Column(
                        children: [
                          SizedBox(height:220),
                          // IconButton(icon: Icon(Icons.search_off), onPressed: (){}),
                          Container(
                            child: Icon(Icons.search,color: Colors.pink[200],size: 80,),
                            height: 100,
                          )
                        ],
                      )


                    ],
                  );
                }
                else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return  Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ),
      ),


    );
  }
}
