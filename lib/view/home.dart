import 'dart:convert';

import 'package:final_app/components/drawaer_widget.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List images = ['assets/blo.jpg','assets/blood.jpg','assets/mamo.jpg','assets/sampl.jfif'];
  List names = ['Blood Analysis','FNA','Mammo Graphic','Sample'];
  List imgList = ['assets/6.png','assets/2.png','assets/3.png','assets/4.png','assets/5.png',];
  var _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: DrawerWidget(),
        appBar: AppBar(

          centerTitle: true,
          title: Text('Breast Cancer Tracker',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
          backgroundColor: Colors.pink[200],
          elevation: 0.0,
          // leading: Image.asset('assets/logo.jfif'),

        ),

        body: ListView(
            children: [
            Container(
              height: 180,
              width:MediaQuery.of(context).size.width-50 ,
              child: CarouselSlider(
                items: ['assets/6.png','assets/2.png','assets/3.png','assets/4.png','assets/5.png',].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,

                          child: Image.asset(i)
                      );
                    },
                  );
                }).toList(),

          carouselController: _controller,
              options: CarouselOptions(
                autoPlayInterval: Duration(seconds: 4),
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
          ),
            ),

        Container(
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 5.0,
                  height: 5.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ),

              SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Container(
                  height: 225,
                  width: 400,
                  child: GestureDetector(
                  child: Stack(
                    children: [
                      Container(
                        height: 175,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white,width: 5), boxShadow:  [
                          BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            blurRadius: 7.0,
                            spreadRadius: 5.0,
                          )
                        ],
                            shape: BoxShape.circle,
                            image:    DecorationImage(
                                image: AssetImage('assets/blo.jpg'),
                                fit: BoxFit.fill
                            )
                        ) ,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 200,
                          height: 70, //
                          decoration: BoxDecoration(
                            color: Colors.pink[200],
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15.0),
                              bottomLeft: Radius.circular(60.0),
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(60.0),
                            ),
                            border: Border.all(
                                color: Colors.white, width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(1),
                                blurRadius: 1.0,
                                spreadRadius: 1.0,
                              )
                            ],
                          ),
                          child: Center(
                            child: Text('Blood Analysis',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: (MediaQuery.of(context).size.width < 400) ? 14 : (MediaQuery.of(context).size.width > 500) ? 20 : 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),),
                          ),
                        ),
                      ),

                    ],
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, 'Blood Analysis',arguments: 'assets/blo.jpg');
                  },

              ),
                ),)
            ],
          ),

    );
  }
}
