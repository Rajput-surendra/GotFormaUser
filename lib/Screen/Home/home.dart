import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gotfonmauser/Helper/Colors.dart';

import '../../ApiPath/Api.dart';
import '../../Model/getCategoryModel.dart';
import '../../Model/get_slider_model.dart';
import '../sub caorgery/subcatogery.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CarouselController carouselController = CarouselController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sliderApi();
    getCat();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  getSliderModel == null
                      ? const Center(
                      child:
                      CircularProgressIndicator())
                      : CarouselSlider(
                      items:
                      getSliderModel!.data!
                          .map(
                            (item) => Stack(
                            alignment:
                            Alignment
                                .center,
                            children: [
                              Container(height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(image: NetworkImage("${item.image}",), fit: BoxFit.fill)),
                              ),
                            ]),
                      )
                          .toList(),
                      carouselController:
                      carouselController,
                      options: CarouselOptions(
                          height: 150,
                          scrollPhysics:
                          const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 1.8,
                          viewportFraction: 1,
                          onPageChanged:
                              (index, reason) {
                            setState(() {
                              _currentPost = index;
                            });
                          })),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: _buildDots(),
                  ),
                  // sliderPointers (items , currentIndex),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: SizedBox(
                height: MediaQuery.of(context).size.height/1.2,
                child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                  childAspectRatio: 3.1
                  // Number of columns
                // Spacing between rows
                ),
                 itemCount:getcalList.length,
                itemBuilder: (BuildContext context, int index){
                 return InkWell(
                   onTap: (){
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => SubCatogary(
                               catId: getcalList[index].id.toString()),
                         ));
                   },
                   child: Card(child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Center(child: Text("${getcalList[index].name}")),
                   )),
                 );
                 }
                ),
              ),
            )// Number of items in the grid

          ],
        ),
      ),
    );
  }

  int _currentPost = 0;
  _buildDots() {
    List<Widget> dots = [];
    if (getSliderModel == null) {
    } else {
      for (int i = 0; i < getSliderModel!.data!.length; i++) {
        dots.add(
          Container(
            margin: const EdgeInsets.all(1.5),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPost == i
                  ? colors.primary
                  : colors.secondary
            ),
          ),
        );
      }
    }
    return dots;
  }
  GetSliderModel? getSliderModel;
  Future<void> sliderApi() async {
    apiBaseHelper.getAPICall(Uri.parse(ApiService.getSliderApi)).then((getData) {
      bool error = getData ['error'];
      if(!error){
        getSliderModel = GetSliderModel.fromJson(getData);
        setState(() {

        });
      }else {

      }

    });

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
