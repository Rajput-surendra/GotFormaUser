import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Helper/Colors.dart';
import '../../Helper/CustomCard.dart';
import '../../Helper/session.dart';
import '../../main.dart';
import '../Auth/LoginScreen.dart';
import '../Faq/faqs.dart';
import '../Privecy Policy/privecyscreen.dart';
import '../Term and Condition/termsandCondition.dart';
import '../Update Profile/updateprofile.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}




class _ProfileState extends State<Profile> {

  @override
  void initState() {
    new Future.delayed(Duration.zero, () {
      languageList = [
        getTranslated(context, 'ENGLISH_LAN'),
        getTranslated(context, 'HINDI_LAN'),
        getTranslated(context, 'MARATAHI'),
      ];
    });
    super.initState();
     getDataProfile();

  }
  String? userId ;
  String? uName  ;
  String? uMobile  ;
  String? uImage  ;
  String? purchase;
  List<String> moduleList = [];



  getDataProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId  =  prefs.getString('userId');
    uName  =  prefs.getString('username');
    uMobile  =  prefs.getString('mobile');

    setState(() {

    });

  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return


Scaffold(
        backgroundColor: colors.grad1Color,
        body:



        SingleChildScrollView(
          child: SizedBox(
            child: Stack(
              children: [
                Container(
                  height: size.height / 2,
                  width: size.width / 1,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    color: colors.primary,
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 6,
                        child: Container(
                         // height: size.height / 1.3,
                          width: size.width / 1.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$uName",
                                      style: const TextStyle(
                                          color: colors.blackTemp,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5),
                                    ),

                                  ],
                                ),
                                Text(
                                  "${getTranslated(context, "MOBILE_NO")}: $uMobile",
                                  style: const TextStyle(
                                      fontSize: 11, color: colors.blackTemp,fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  // height: size.height / 2.5,
                                  child: Column(
                                    children: [

                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateProfile(),));

                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "UPDATE_PROFILE"),
                                          icon: Icons.arrow_forward_ios_rounded,
                                        ),
                                      ),

                                      GestureDetector(
                                        onTap: () {

                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "MYORDER"),
                                          icon: Icons.arrow_forward_ios_rounded,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const privacy_policy(),));
                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "PRIVECYPOLICY"),
                                          icon: Icons.arrow_forward_ios_rounded,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsCondition(),));

                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "TERMCONDITION"),
                                          icon: Icons.arrow_forward_ios_rounded,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const FaqPage(),));

                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "FAQS"),
                                          icon: Icons.arrow_forward_ios_rounded,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Future.delayed(const Duration(seconds: 0),(){
                                            return openChangeLanguageBottomSheet();
                                          });

                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "LANGUAGE"),
                                          icon: Icons.arrow_forward_ios_rounded,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {

                                          showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text("Confirm LogOut"),
                                                  content: const Text("Are you sure you want to LogOut?"),
                                                  actions: <Widget>[
                                                    ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor: colors.primary),
                                                      child: const Text("YES"),
                                                      onPressed: () {
                                                        setState(() async {
                                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                                          prefs.clear();
                                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));

                                                        });
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

                                        },
                                        child: CustomCard(
                                          title: getTranslated(context, "LOG_OUT"),
                                          icon: Icons.arrow_forward_ios_rounded,
                                        ),

                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      );
  }

  List<String> langCode = ["en", "hi","mr"];
  final List<String> getLang = ['English', 'Hindi', 'Marathi'];
  List<String?> languageList = [];
  String? langData ;
  int? selectLan;

  final GlobalKey<FormState> _changePwdKey = GlobalKey<FormState>();

  void openChangeLanguageBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0))),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Form(
                  key: _changePwdKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      bottomSheetHandle(),
                      bottomsheetLabel("CHOOSE_LANGUAGE_LBL"),
                      StatefulBuilder(
                        builder:
                            (BuildContext context, StateSetter setModalState) {
                          return SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: getLngList(context, setModalState)),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }


  Widget getHeading(String title) {
    print("here is title value ${title}");
    return Text(
      getTranslated(context, title).toString(),
      style: Theme.of(context).textTheme.headline6!.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black),
    );
  }


  Widget bottomSheetHandle() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.black),
        height: 5,
        width: MediaQuery.of(context).size.width * 0.3,
      ),
    );
  }

  Widget bottomsheetLabel(String labelName) => Padding(
    padding: const EdgeInsets.only(top: 30.0, bottom: 20),
    child: getHeading(labelName),
  );

  List<Widget> getLngList(BuildContext ctx, StateSetter setModalState) {
    return languageList
        .asMap()
        .map(
          (index, element) => MapEntry(
          index,
          InkWell(
            onTap: () {
              if (mounted)
                setState(() {
                  selectLan = index;
                  _changeLan(langCode[index], ctx);
                });
              setModalState((){});
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 25.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectLan == index
                                ? Colors.grey
                                : Colors.white,
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: selectLan == index
                              ? const Icon(
                            Icons.check,
                            size: 17.0,
                            color: Colors.black,
                          )
                              : const Icon(
                              Icons.check_box_outline_blank,
                              size: 15.0,
                              color:Colors.white
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsetsDirectional.only(
                            start: 15.0,
                          ),
                          child: Text(
                            languageList[index].toString(),
                            style: Theme.of(this.context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                color: Colors.black),
                          ))
                    ],
                  ),

                  // index == languageList.length - 1
                  //     ? Container(
                  //         margin: EdgeInsetsDirectional.only(
                  //           bottom: 10,
                  //         ),
                  //       )
                  //     : Divider(
                  //         color: Theme.of(context).colorScheme.lightBlack,
                  //       ),
                ],
              ),
            ),
          )),
    )
        .values
        .toList();
  }


  void _changeLan(String language, BuildContext ctx) async {
    Locale _locale = await setLocale(language);
    MyApp.setLocale(ctx, _locale);
  }

  void _showBottomSheet(BuildContext context,) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              ListTile(

                title: Padding(padding: const EdgeInsets.only(right: 40,left: 0),
                  child: Text(getTranslated(context, "SUPPLEMENT_RECORD"),style: const TextStyle(color: Colors.black ,fontWeight: FontWeight.w500)),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>SupplementRecord()));

                },
              ),
              ListTile(

                title: Text(getTranslated(context, "SUPPLEMENT_DUE_RECORD"),style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>SupplementDueRecord()));

                },
              ),
            ],
          ),
        );

      },
    );
  }

  void _showBottomSheet2(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20),

              ListTile(

                title: Padding(padding: const EdgeInsets.only(right: 40,left: 0),
                  child: Text(getTranslated(context, "MEDICINE_RECORD"),style: const TextStyle(color: Colors.black ,fontWeight: FontWeight.w500)),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>MedicineRecord()));

                },
              ),
              ListTile(

                title: Padding(padding: const EdgeInsets.only(right: 40,left: 0),
                  child: Text(getTranslated(context, "MEDICINE_SCHEDULE"),style: const TextStyle(color: Colors.black ,fontWeight: FontWeight.w500)),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>MedicineScheduleRecord()));

                },
              ),
              ListTile(

                title: Text(getTranslated(context, "MEDICINE_DUE_RECORD"),style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>MedicineDueRecord()));

                },
              ),
            ],
          ),
        );

      },
    );
  }

  void _showBottomSheet3(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [



              ListTile(

                title: Padding(padding: const EdgeInsets.only(right: 40,left: 0),
                  child: Text(getTranslated(context, "PUNCH_IN_/_OUT"),style: const TextStyle(color: Colors.black ,fontWeight: FontWeight.w500)),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>PunchInScreen()));

                },
              ),
              ListTile(

                title: Padding(padding: const EdgeInsets.only(right: 40,left: 0),
                  child: Text(getTranslated(context, "ATTENDANCE"),style: const TextStyle(color: Colors.black ,fontWeight: FontWeight.w500)),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>AttendanceRecord()));

                },
              ),
              ListTile(

                title: Text(getTranslated(context, "SALARY_SLIP"),style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>SalaryRecord()));
                },
              ),
            ],
          ),
        );

      },
    );
  }
}