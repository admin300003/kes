import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Widgets/colors.dart';
import 'Widgets/langage.dart';

class partners extends StatelessWidget {
  const partners({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily:'noor',
      ),
      home: partnerspage(),
    );
  }

}

class partnerspage extends StatefulWidget {




  @override

  State<partnerspage> createState() => _partnerspage();



}

class _partnerspage extends State<partnerspage> {

  static var jsonList;

  @override
  void  initState() {
    // TODO: implement activate
    super.initState();

    getData();


  }


  Future getData() async{


    var response = await Dio().get('http://192.168.137.1:8000/api/partners');

    try{

      if(response.statusCode==200){

        setState(() {
          jsonList=response.data;


        });
      }

    }catch(e){
      print(e);
    }

  }




  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

          appBar: AppBar(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ?  Color.fromRGBO(33, 37, 25, 1)
                :  Color.fromRGBO(240, 242, 245, 1),
            elevation: 0,
            title:  Text(Language().con_us(),
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

          body:
          ListView.builder(
              padding: EdgeInsets.all(20.0),
              itemCount:jsonList==null?0: jsonList.length,
              itemBuilder: (context, int?i)=>
                  Card(
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Theme.of(context).brightness == Brightness.dark
                        ?  Color.fromRGBO(33, 37, 25, 1)
                        :  Color.fromRGBO(240, 242, 245, 1),

                    elevation: 7,
                    child:Column(
                      children: [


                        Padding(padding: EdgeInsets.all(5)),
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage('http://192.168.137.1:8000/storage/${jsonList[i]['PrntrLogo'].toString()== null?jsonList[i]['PrntrLogo'].toString():jsonList[i]['PrntrLogo'].toString()}',),

                        ),
                        Padding(padding: EdgeInsets.all(3),
                            child: Column(
                              children: [
                                Text('',textDirection: TextDirection.rtl,)


                              ],
                            )

                        )

                      ],
                    ) ,


                  )






          )
      ),
    );


  }
}