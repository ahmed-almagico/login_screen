import 'package:flutter/material.dart';
import 'package:login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowMail extends StatefulWidget {
  @override
  State<ShowMail> createState() => _ShowMailState();
}

class _ShowMailState extends State<ShowMail> {
//String mail ;
var z = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar() ,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$z', style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w900),),
          ElevatedButton(onPressed: ()async{
            SharedPreferences prefrence = await SharedPreferences.getInstance();
            prefrence.remove('email');
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
          }, child: Text('lOG OUT')) ,
          MaterialButton(onPressed: ()async{
            SharedPreferences prefrence = await SharedPreferences.getInstance();
            z=prefrence.get('email').toString();
            setState(() {

            });
          })
        ],
      )),
    );
  }
}
