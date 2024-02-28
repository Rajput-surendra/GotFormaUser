import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gotfonmauser/Helper/Colors.dart';
import '../../Helper/session.dart';
import '../Home/home.dart';
import '../Profile/profileScreen.dart';
import '../catogery Screen/catogery_screen.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState
  }
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    CatScreen(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Confirm Exit"),
                  content: const Text("Are you sure you want to exit?"),
                  actions: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colors.primary),
                      child: const Text("YES"),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colors.primary),
                      child: const Text("NO"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
          return true;
        },
        child: Scaffold(
          key: openDrawer,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(_selectedIndex == 2 ? 0 : 80),
              child:
              _selectedIndex==2?SizedBox():
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration:  BoxDecoration(
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
                       SizedBox(width: 20,),
                        _selectedIndex == 0
                            ?  Text(
                          getTranslated(context, "HOME")
                         ,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: colors.whiteTemp,
                              fontSize: 20),
                        )
                            :

                        _selectedIndex == 1
                            ?  Text(

                          getTranslated(context, "CATEGORIESS"),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: colors.whiteTemp,
                              fontSize: 20),
                        ):


                            Center(
                              child:  Text(


                                getTranslated(context, "MYPROFILE"),

                                style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: colors.whiteTemp,
                                fontSize: 20),
                        ),
                            ),



                       Padding(
                         padding: const EdgeInsets.only(right: 5),
                         child: SizedBox(

                           child: Icon(Icons.notifications,color: colors.secondary,),
                         ),
                       )
                      ],
                    ),
                  ),
                ),
              )),

          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                      height: 30,
                      width: 30,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == 0
                              ? colors.primary
                              : Colors.white),

                      child: Icon(
                        Icons.home,
                        size: 15,
                        color:
                        _selectedIndex == 0 ? Colors.white : Colors.black,
                      )),
                ),
                label:  getTranslated(context, "HOME"),
              ),
              BottomNavigationBarItem(
                icon: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                      height: 30,
                      width: 30,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == 1
                              ?colors.primary
                              : Colors.white),
                      child: Icon(
                        Icons.line_style_outlined,
                        size: 15,
                        color:
                        _selectedIndex == 1 ? Colors.white : Colors.black,
                      )),
                ),
                label: getTranslated(context, "CATEGORIESS"),
              ),
              BottomNavigationBarItem(
                icon: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                      height: 30,
                      width: 30,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == 2
                              ? colors.primary
                              : Colors.white),
                      child: Icon(
                        Icons.person_2_outlined,
                        size: 15,
                        color:
                        _selectedIndex == 2 ? Colors.white : Colors.black,
                      )),
                ),
                label:  getTranslated(context, "MYPROFILE"),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: colors.primary,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> openDrawer = GlobalKey();
  int _selectedIndex = 0;
  int currentIndex = 99;

  String? name;
  String? email;
  String? profile;
  String? userid ;
  String? role ;




}
