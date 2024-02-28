import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gotfonmauser/Helper/Colors.dart';
import 'package:http/http.dart' as http;

import '../../ApiPath/Api.dart';
import '../../Helper/session.dart';
import '../../Model/faqModel.dart';
import '../Privecy Policy/privecyscreen.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  List<String> quList = [
    "How Can I Update My Profile?",
    "How Can I Change My Password?",
    "How Can I Cancel My Order?",
    "How Can I Return The Order?"
  ];
  int selected = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFaq();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(80),
                child: CustomAppbar(
                  textt: getTranslated(context, "FAQS"),
                )),
            body: !isloading
                ? SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'FAQ',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 15, top: 15),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 8,
                                ),
                                child: faqTileDetails(
                                    question:
                                        "${faqModel?.data[index].question ?? ''}",
                                    answer:
                                        '${faqModel?.data[index].answer ?? ""}',
                                    index: index + 1),
                              );
                            },
                            itemCount: faqModel?.data.length ?? 0,
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: colors.secondary,
                      ),
                    ),
                  )));
  }

  Widget faqTileDetails(
      {required String question, required String answer, required int index}) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: colors.primary),
          child: ListTile(
            onTap: () {
              setState(() {
                if (selected == index) {
                  selected = -1;
                } else {
                  selected = index;
                }
              });
            },
            title: Text(
              question,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(selected == index
                ? Icons.arrow_drop_down
                : Icons.arrow_drop_down),
          ),
        ),
        selected == index
            ? Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 5),
                color: colors.whiteTemp,
                child: Html(
                  data: answer,
                ))
            : Container(),
      ],
    );
  }

  FaqModel? faqModel;
  bool isloading = false;

  Future<void> getFaq() async {
    setState(() {
      isloading = true;
    });

    var request =
        http.Request('GET', Uri.parse('${ApiService.baseUrl}get_faqs'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalresult = jsonDecode(result);

      if (finalresult['error']) {
        setState(() {
          setState(() {
            faqModel = FaqModel.fromJson(finalresult);
          });
          setState(() {
            isloading = false;
          });
        });
      } else {
        setState(() {
          isloading = false;
        });
      }
    } else {
      print(response.reasonPhrase);
    }
  }
}
