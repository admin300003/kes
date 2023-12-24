import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:flutter/widgets.dart';
import 'Widgets/colors.dart';
import 'Widgets/langage.dart';

class con_us extends StatelessWidget {
  const con_us({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily:'noor',
      ),
      home:  cobutton(),
    );
  }
}
class cobutton extends StatefulWidget {
  const cobutton({Key? key}) : super(key: key);

  @override
  _cobutton createState() => _cobutton();
}






class _cobutton extends State<cobutton> {
  Language _language = Language();

  static var jsonList;


  @override
  void  initState() {
    // TODO: implement activate
    super.initState();

    getData();

  }

  Future getData() async{


    var response = await Dio().get('http://192.168.137.1:8000/api/info');



    try{

      if(response.statusCode==200){

        setState(() {
          jsonList = response.data;


        });
      }

    }catch(e){
      print(e);
    }

  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(
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


      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 1),

        children: [

          Center(
            child: Material(
                color: Theme
                    .of(context)
                    .brightness == Brightness.dark
                    ? Color.fromRGBO(41, 45, 33, 1)
                    : kwhait,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        hoverColor: greenColor,
                        onTap: () {
                          launcher.launchUrl(
                            Uri.parse('tel:${jsonList[0]['PhoneNo']}'),
                            mode: launcher.LaunchMode.externalApplication,);

                        },
                        child: Column(
                          children: [

                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                //  border: Border.all(color: kblueColor),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15)),
                              ),
                              child:

                              Icon(FontAwesomeIcons.phone, color: kblueColor,),
                              // Ink.image(image: AssetImage("images/found.png"),
                              height: 90,
                              width: 130,
                              // fit: BoxFit.cover,
                            ),

                            Text(
                              _language.call(),style: TextStyle(fontSize: 15,color: kblueColor),
                            ),

                            SizedBox(height: 7,)

                          ],
                        )


                    ),


                  ],
                )
            ),
          ), //phone
          Center(
            child: Material(
                color: Theme
                    .of(context)
                    .brightness == Brightness.dark
                    ? Color.fromRGBO(41, 45, 33, 1)
                    : kwhait,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        hoverColor: greenColor,
                        // splashColor: Colors.black26,
                        onTap: () {
                          launcher.launchUrl(
                            Uri.parse('tel:${jsonList[0]['CSPhoneNo']}'),
                            mode: launcher.LaunchMode.externalApplication,);

                          // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddFound()));
                          // Navigator.pushNamed(context, "AddFound");
                        },
                        child: Column(
                          children: [

                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                //  border: Border.all(color: kblueColor),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15)),
                              ),
                              child:

                              Icon(HeroIcons.hand_thumb_up, color: kblueColor,),
                              // Ink.image(image: AssetImage("images/found.png"),
                              height: 90,
                              width: 130,
                              // fit: BoxFit.cover,
                            ),
                            Text(
                              _language.supp(),style: TextStyle(fontSize: 15,color: kblueColor),
                            ),

                            SizedBox(height: 7,)

                          ],
                        )


                    ),


                  ],
                )
            ),
          ), //sms
          Center(
            child: Material(
                color: Theme
                    .of(context)
                    .brightness == Brightness.dark
                    ? Color.fromRGBO(41, 45, 33, 1)
                    : kwhait,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        hoverColor: greenColor,
                        // splashColor: Colors.black26,
                        onTap: () {
                          launcher.launchUrl(
                            Uri.parse('mailto:${jsonList[0]['Email']}'),
                            mode: launcher.LaunchMode.externalApplication,);

                          // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddFound()));
                          // Navigator.pushNamed(context, "AddFound");
                        },
                        child: Column(
                          children: [

                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                //  border: Border.all(color: kblueColor),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15)),
                              ),
                              child:

                              Icon(HeroIcons.envelope, color: kblueColor,),
                              // Ink.image(image: AssetImage("images/found.png"),
                              height: 90,
                              width: 130,
                              // fit: BoxFit.cover,
                            ),

                            Text(
                              _language.mail(),style: TextStyle(fontSize: 15,color: kblueColor),
                            ),
                            SizedBox(height: 7,)
                          ],
                        )


                    ),


                  ],
                )
            ),
          ),
          //emil
          Center(
            child: Material(
                color: Theme
                    .of(context)
                    .brightness == Brightness.dark
                    ? Color.fromRGBO(41, 45, 33, 1)
                    : kwhait,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        hoverColor: greenColor,
                        // splashColor: Colors.black26,
                        onTap: () {
                          launcher.launchUrl(
                            Uri.parse('https://${jsonList[0]['FBURL']}'),
                            mode: launcher.LaunchMode.externalApplication,);

                          // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddFound()));
                          // Navigator.pushNamed(context, "AddFound");
                        },
                        child: Column(
                          children: [

                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                //  border: Border.all(color: kblueColor),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15)),
                              ),
                              child:

                              Icon(FontAwesomeIcons.facebook, color: kblueColor,),
                              // Ink.image(image: AssetImage("images/found.png"),
                              height: 90,
                              width: 130,
                              // fit: BoxFit.cover,
                            ),
                            Text(
                              _language.FB(),style: TextStyle(fontSize: 15,color: kblueColor),
                            ),

                            SizedBox(height: 7,)

                          ],
                        )


                    ),


                  ],
                )
            ),
          ),

          //fb
          Center  (
            child: Material(
                color: Theme
                    .of(context)
                    .brightness == Brightness.dark
                    ? Color.fromRGBO(41, 45, 33, 1)
                    : kwhait,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        hoverColor: greenColor,
                        // splashColor: Colors.black26,
                        onTap: () {
                          launcher.launchUrl(
                            Uri.parse('https://${jsonList[0]['TWURL']}'),
                            mode: launcher.LaunchMode.externalApplication,);

                          // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddFound()));
                          // Navigator.pushNamed(context, "AddFound");
                        },
                        child: Column(
                          children: [

                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                //  border: Border.all(color: kblueColor),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15)),
                              ),
                              child:

                              Icon(FontAwesomeIcons.x, color: kblueColor,),
                              // Ink.image(image: AssetImage("images/found.png"),
                              height: 90,
                              width: 130,
                              // fit: BoxFit.cover,
                            ),
                            Text(
                              _language.X(),style: TextStyle(fontSize: 15,color: kblueColor),
                            ),

                            SizedBox(height: 7,)

                          ],
                        )


                    ),


                  ],
                )
            ),
          ), //tw

          Center  (
            child: Material(
                color: Theme
                    .of(context)
                    .brightness == Brightness.dark
                    ? Color.fromRGBO(41, 45, 33, 1)
                    : kwhait,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        hoverColor: greenColor,
                        // splashColor: Colors.black26,
                        onTap: () {
                          launcher.launchUrl(
                            Uri.parse('https://${jsonList[0]['YTURL'].toString()}'),
                            mode: launcher.LaunchMode.externalApplication,);


                        },
                        child: Column(
                          children: [

                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15)),
                              ),
                              child:

                              Icon(FontAwesomeIcons.youtube, color: kblueColor,),
                              // Ink.image(image: AssetImage("images/found.png"),
                              height: 90,
                              width: 130,
                              // fit: BoxFit.cover,
                            ),
                            Text(
                              _language.youtube(),style: TextStyle(fontSize: 15,color: kblueColor),
                            ),

                            SizedBox(height: 7,)

                          ],
                        )


                    ),


                  ],
                )
            ),
          ), //tw

        ],
      ),
    );
  }
}
