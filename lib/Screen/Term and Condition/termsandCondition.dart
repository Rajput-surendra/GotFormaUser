import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gotfonmauser/Helper/Colors.dart';
import 'package:http/http.dart' as http;

import '../../Helper/session.dart';
import '../../Model/privecyModel.dart';
import '../Privecy Policy/privecyscreen.dart';

class TermsCondition extends StatefulWidget {
  const TermsCondition({super.key});

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getprivecy();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(80),
                child:

                CustomAppbar(
                  textt: getTranslated(context, "TERMCONDITION"),
                )),
            body:





            !isloading?


            SingleChildScrollView(
              child: Column(
                children: [


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:
                    Html(
                      data:'${getPrivecyModel?.data.termsConditions.first??''}',
                    ),
                  ),


                ],
              ),
            ):
            Container(height: MediaQuery.of(context).size.height,

              width: MediaQuery.of(context).size.width,

              child: Center(child: CircularProgressIndicator(color: colors.primary,),),
            )


        )
    );
  }



  GetprivecyModel?getPrivecyModel;
  bool isloading=false;
  Future<void> getprivecy() async {
    setState(() {

      isloading=true;
    });

    var headers = {
      'Cookie': 'ci_session=4063608a40d8c2d70ca45f7ea68cde8c417c13fa'
    };
    var request = http.Request('POST', Uri.parse('https://developmentalphawizz.com/goat_farm/app/v1/api/get_settings'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(request.url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var result=await response.stream.bytesToString();
      var finalresult=jsonDecode(result);

      if(!finalresult['error']){

        setState(() {


          setState(() {
            getPrivecyModel=GetprivecyModel.fromJson(finalresult);
          });
          setState(() {

            isloading=false;
          });
        });


      }
      else{
        setState(() {

          isloading=false;
        });

      }
    }
    else {
      print("catch");

      print(response.reasonPhrase);
    }

  }
}







