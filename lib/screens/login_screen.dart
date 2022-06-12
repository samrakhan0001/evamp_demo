import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/resources/colors.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {

  TextEditingController email_controller =  TextEditingController();
  TextEditingController password_controller =  TextEditingController();

  final GlobalKey<FormFieldState> _emailFormKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _passFormKey = GlobalKey<FormFieldState>();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary,
        body: body_widget(),
      ),
    );
  }

  Widget body_widget(){
    return Container(
      child:ListView(
        shrinkWrap: true,
        children: [
          screen_logo(),
          welcome_text(),
          custom_email_fields("Enter You Email", email_controller, "demo@gmail.com"),
          custom_password_fields("Enter You Password", password_controller, "*******"),
          login_button(),

        ],
      )
    );
  }

  Widget screen_logo(){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 20,top: 100,bottom: 20),
        child: Image.asset("assets/images/e_logo.png",height: 200,),
      ),
    );
  }

  Widget welcome_text(){
    return Container(
      width: MediaQuery.of(context).size.width/2,
      padding: const EdgeInsets.only(left: 20,bottom: 30),
      child: Row(
        children: const [
        Expanded(child: Text("Welcome to Demo App Login",style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.w200),)),
        ],
      ),
    );

  }

  Widget custom_email_fields(text, controller, hint){
    return Container(
      padding: const EdgeInsets.only(left: 50,bottom: 20,right: 50),
      child: Column(
        children: [
          text_of_fields(text),
          const SizedBox(height: 5,),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.5, color: Colors.white),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.email,color: Colors.white,),

                const SizedBox(width: 15,),

                Expanded(
                  child: TextFormField(
                    key: _emailFormKey,
                    controller: controller,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 15.0,color: Colors.white),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        errorStyle: const TextStyle(fontSize: 13,),
                        hintText: '$hint',
                        hintStyle: const TextStyle(fontSize: 15.0,color: Colors.white)),


                    onChanged: (value) {
                      setState(() {
                        if (!_emailFormKey.currentState!
                            .validate()) {
                        }
                      });
                    },
                    validator: (value) {
                      String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regex = new RegExp(pattern);
                      return (regex.hasMatch(value!))
                          ? null
                          : 'Enter valid email';
                    },

                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }

  Widget custom_password_fields(text, controller, hint){
    return Container(
      padding: const EdgeInsets.only(left: 50,bottom: 20,right: 50),
      child: Column(
        children: [
          text_of_fields(text),
          const SizedBox(height: 5,),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.5, color: Colors.white),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.lock,color: Colors.white,),

                const SizedBox(width: 15,),

                Expanded(
                  child: TextFormField(
                    key: _passFormKey,
                    obscureText: true,
                    controller: controller,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 15.0,color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                        errorStyle: const TextStyle(fontSize: 13,),
                        hintText: '$hint',
                        hintStyle: const TextStyle(fontSize: 15.0,color: Colors.white)),

                    onChanged: (value) {
                      setState(() {
                        if (!_passFormKey.currentState!
                            .validate()) {
                        }
                      });
                    },
                    validator: (value) {
                      return (value!.length > 5)
                          ? null
                          : 'Password is too short';
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }


  Widget text_of_fields(String text){
    return Container(
      child: Row(children: [Text(text,style: const TextStyle(color: Colors.white,fontSize: 12),)]),
    );

  }

  Widget login_button(){
    return Container(
      height: 100,
      padding: EdgeInsets.only(top: 20,bottom: 20,left: 100,right: 100),
      child: ElevatedButton(
        child: Text("Login",style: TextStyle(fontSize: 20),),
        onPressed: () {
          if(_isFormValid()){

          }
        },
        style: ElevatedButton.styleFrom(
          primary: light_blue,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),
    );
  }
  bool _isFormValid() {
    return ((_emailFormKey.currentState!.isValid &&
        _passFormKey.currentState!.isValid));
  }
}
