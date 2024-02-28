import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gotfonmauser/Helper/Colors.dart';
import 'package:gotfonmauser/Screen/sub%20caorgery/subcatogery.dart';

import '../../ApiPath/Api.dart';
import '../../Model/getCategoryModel.dart';

class CatScreen extends StatefulWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  State<CatScreen> createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  @override
  void initState() {
    // TODO: implement initState

    getCat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: !isLoading
            ? getcalList.isEmpty
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text("Categories Not Found"),
                    ),
                  )
                : RefreshIndicator(
                    color: colors.primary,
                    onRefresh: () async {
                      getCat();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView.builder(
                        itemCount: getcalList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SubCatogary(
                                        catId: getcalList[index].id.toString()),
                                  ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Card(
                                child: Container(
                                  height: 70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('${getcalList[index].name ?? ''}'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
            : Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: CircularProgressIndicator(
                    color: colors.primary,
                  ),
                ),
              ));
  }

  List<Catogary> getcalList = [];
  bool isLoading = false;
  void getCat() {
    setState(() {
      isLoading = true;
    });
    apiBaseHelper
        .getAPICall(
      Uri.parse(ApiService.getCatUrl),
    )
        .then((getData) async {
      print(getData);
      bool error = getData['error'];
      String msg = getData['message'];
      if (error == false) {
        setState(() {
          getcalList = GetcatogryModel.fromJson(getData).data;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }
}
