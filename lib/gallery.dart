import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Widgets/colors.dart';
import 'Widgets/langage.dart';
import 'con_us.dart';

class gallery extends StatelessWidget {
  const gallery({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily:'noor',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const galleryus(),
    );
  }
}

class galleryus extends StatefulWidget {
  const galleryus({Key? key}) : super(key: key);

  @override
  _galleryusState createState() => _galleryusState();
}

class _galleryusState extends State<galleryus> {
  Language _language = Language();
   static var storage;
  static var jsonList;

  @override
  void initState() {
    // TODO: implement activate
    super.initState();
    getData();

  }
  void getData() async{
    try{


      var response = await Dio().get('http://192.168.137.1:8000/api/gallery');
      storage='http://192.168.137.1:8000/storage/';



      if(response.statusCode==200){

        setState(() {
          jsonList =response.data;

        });
      }





    }catch(e){
      print(e);
    }

  }


  @override
  Widget build(BuildContext context) {


    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ?  Color.fromRGBO(33, 37, 25, 1)
                  :  Color.fromRGBO(240, 242, 245, 1),
              elevation: 0,
              title:  Text(_language.gallery(),
                  style: TextStyle(
                      color:Theme.of(context).brightness == Brightness.dark
                          ?  kwhait
                          :  kblueColor,
                      fontSize: 15)),
              leading: IconButton(
                onPressed: (){Navigator.pop(context);},
                icon: Icon( Icons.arrow_back,
                    color:Theme.of(context).brightness == Brightness.dark
                        ?  kwhait
                        :  kblueColor),),),

            backgroundColor: Theme
                .of(context)
                .brightness == Brightness.dark
                ? Color.fromRGBO(33, 37, 25, 1)
                : Color.fromRGBO(240, 242, 245, 1),



            body: CARD()
        )
    );



  }
}
class CARD extends StatefulWidget {
  CARD({Key? key}) : super(key: key);


  @override
  _CARDState createState() => _CARDState();
}



class _CARDState extends State<CARD> {

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      body: ListView.builder(
          itemCount: _galleryusState.jsonList==null?0: _galleryusState
              .jsonList.length,
          itemBuilder: (context, i) =>
              Container(padding: const EdgeInsets.all(3.0),
                child: ClipRRect(
                    child: Column(

                      children: [

                       Container(
                          child: Card(
                            color: Theme
                                .of(context)
                                .brightness == Brightness.dark
                                ? Color.fromRGBO(41, 45, 33, 1)
                                : kwhait,

                            child: Column(

                              children: [

                                Image.network('${_galleryusState.storage}${_galleryusState.jsonList[i]['PostPic'].toString()}', height: MediaQuery
                                    .of(context).size.width,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    fit: BoxFit.cover),

                                Padding(padding: EdgeInsets.all(2),
                                    child: Column(
                                      children: [
                                        Text(_galleryusState.jsonList[i]['PostTitle'].toString()
                                          , textDirection: TextDirection.rtl,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,fontFamily: 'noor'),
                                        )


                                      ],
                                    )

                                )
                              ],
                            ),
                            elevation: 7,
                            margin: const EdgeInsets.all(0.5),
                          ),


                          width: double.infinity,

                          margin: const EdgeInsets.all(0.5),


                        )

                      ],
                    )
                ),

              )



      ),);
  }
}


