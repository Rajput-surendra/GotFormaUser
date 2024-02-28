import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gotfonmauser/Helper/Colors.dart';

import '../../ApiPath/Api.dart';
import '../../Model/subCatModel.dart';

class SubCatogary extends StatefulWidget {
  String? catId;

  SubCatogary({Key? key, this.catId}) : super(key: key);

  @override
  State<SubCatogary> createState() => _SubCatogaryState();
}

class _SubCatogaryState extends State<SubCatogary> {
  @override
  void initState() {
    // TODO: implement initState

    getsubcat();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: colors.whiteTemp,
                              )),
                        ),
                        Center(
                          child: const Text(
                            'Subcategories',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: colors.whiteTemp,
                                fontSize: 20),
                          ),
                        ),
                        SizedBox()
                      ],
                    ),
                  ),
                ),
              )),
          body: !isLoading
              ? getSubcalList.isEmpty
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text("Subcategories Not Found"),
                      ),
                    )
                  : RefreshIndicator(
                      color: colors.primary,
                      onRefresh: () async {
                        getsubcat();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: ListView.builder(
                          itemCount: getSubcalList.length,
                          itemBuilder: (context, index) {
                            return Padding(
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
                                        Text(
                                            '${getSubcalList[index].name ?? ''}'),
                                      ],
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
                )),
    );
  }

  List<SubCatList> getSubcalList = [];
  bool isLoading = false;

  void getsubcat() {
    setState(() {
      isLoading = true;
    });
    var parapeter = {
      'parent_id': widget.catId.toString(),
    };
    apiBaseHelper
        .postAPICall(Uri.parse(ApiService.getSubCatUrl), parapeter)
        .then((getData) async {
      print(getData);
      bool error = getData['error'];
      String msg = getData['message'];
      if (error == false) {
        setState(() {
          getSubcalList = GetSubcatogryModel.fromJson(getData).data ?? [];
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
