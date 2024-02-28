import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gotfonmauser/Screen/Dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../ApiPath/Api.dart';
import '../../Helper/AppBtn.dart';
import '../../Helper/Colors.dart';
import '../../Helper/session.dart';
import '../../Model/RegisterUserModel.dart';
class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {

  void initState() {
    // TODO: implement initState
    super.initState();
    getDataProfile();

  }


  final _formKey = GlobalKey<FormState>();



  String? userTypeNew ;
  bool visible=true;
  bool isLoading=false;
  String? role;

  TextEditingController farmNameController=TextEditingController();
  TextEditingController fNameController=TextEditingController();
  TextEditingController lNameController=TextEditingController();
  TextEditingController mobileController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  RegisterUserModel? registerUserModel;


  Future<void> UpdatePofile() async {

    var parameter = {
      "user_id":userId.toString(),
      "first_name":fNameController.text,
      "last_name":lNameController.text,

    };

    apiBaseHelper.postAPICall(Uri.parse(ApiService.updateUrl), parameter).then((getData) {
      bool error = getData['error'];
      print(getData);

      if (error==false) {
        Fluttertoast.showToast(msg: "${getData['message']}");
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(),));
      }else {
        Fluttertoast.showToast(msg: "${getData['message']}");


      }
    });
  }



var userId;

  getDataProfile() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId =  prefs.getString('userId').toString();
    fNameController.text  =  prefs.getString('username').toString();
    mobileController.text  =  prefs.getString('mobile').toString();

    setState(() {
      isLoading = false;
    });

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: colors.grad1Color,
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              height: MediaQuery.of(context).size.height/1.0,
              child:Stack(
                  children:[


                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height/2.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)
                              ),
                              color:colors.primary
                          ),
                        ),

                      ],
                    ),

                    Positioned(
                      top: 50,
                      left: 0,
                      right: 0,
                      child: SingleChildScrollView(
                        child: Column(

                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Text(getTranslated(context, "UPDATE_PROFILE"),
                                    style: TextStyle(
                                        color: colors.secondary,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),),

                                  SizedBox(height: 40,),
                                ],
                              ),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(left: 20,top: 10),
                            ),

                            Container(
                              height: MediaQuery.of(context).size.height/1.4,
                              margin: EdgeInsets.all(20),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(21),
                                  child: Form(
                                    key: _formKey,
                                    child: SingleChildScrollView
                                      (
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10,),


                                          TextFormField(
                                            controller: fNameController,
                                            keyboardType: TextInputType.text,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(10),
                                            ],
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please Enter First Name';
                                              }
                                              return null;
                                            },

                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              prefixIcon: Icon(Icons.person_rounded),
                                              fillColor: Color(0x25888888),
                                              filled: true,
                                              hintText: getTranslated(context, "FIRST_NAME"),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          TextFormField(
                                            controller: lNameController,
                                            keyboardType: TextInputType.text,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(10),
                                            ],
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please Enter Last Name';
                                              }
                                              return null;
                                            },

                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              prefixIcon: Icon(Icons.person_rounded),
                                              fillColor: Color(0x25888888),
                                              filled: true,
                                              hintText: getTranslated(context, "LAST_NAME"),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          TextFormField(
                                            readOnly: true,
                                            controller: mobileController,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(10),
                                            ],
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please Enter Mobile Number';
                                              }

                                              else
                                              if (value.length<10) {
                                                return 'Please Enter Valid Mobile Number';
                                              }
                                              return null;
                                            },

                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              prefixIcon: Icon(Icons.call),
                                              fillColor: Color(0x25888888),
                                              filled: true,
                                              hintText: getTranslated(context, "MOBILE_NO"),
                                            ),
                                          ),
                                          SizedBox(height: 10,),



                                          SizedBox(height: 25,),
                                          Btn(
                                            onPress: (){
                                              if(_formKey.currentState!.validate()){
                                                print('__________fsdfsdfdsfdsf_________');
                                                UpdatePofile();
                                                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MadhuFarmScreen())) ;
                                              }else{
                                                Fluttertoast.showToast(msg: "All are Required");
                                              }
                                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MadhuFarmScreen())) ;
                                            },
                                            title: isLoading == true ?  "Please wait..":getTranslated(context, "UPDATE_PROFILE"),
                                            height: MediaQuery.of(context).size.width/8,
                                          ),
                                          SizedBox(height: 15,),

                                          // SizedBox(height: 350,)




                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 30,)
                          ],
                        ),
                      ),
                    )
                  ]
              ) ,
            ),


          ],
        ),
      ),
    );
  }
}

