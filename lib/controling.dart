import 'package:flutter/material.dart';
import 'package:login_screen/login_screen.dart';
import 'package:login_screen/show_mail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Moving extends StatefulWidget {

  @override

  State<Moving> createState() => _MovingState();
}

class _MovingState extends State<Moving> {

  @override
  String? email ;

  getdata()async{
    SharedPreferences prefrences= await SharedPreferences.getInstance();
    email=prefrences.getString('email');
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  Widget build(BuildContext context) {
    return email == null ? Login() : ShowMail();
  }
}
