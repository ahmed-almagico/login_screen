import 'package:flutter/material.dart';
import 'package:login_screen/show_mail.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool visible = true;
  var formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
            Image.network(
                'https://cdn2.iconfinder.com/data/icons/user-interface-line-vol-1/52/account__login__LCD__screen-512.png' ,
              height:200 ,
              width: double.infinity,
            ) ,
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'you Should type Your email';
                    }
                    return null;
                  },
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'you Should type Your Password';
                    }
                    return null;
                  },
                  obscureText: visible,
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visible ? visible = false : visible = true;
                        });
                      },
                      icon: visible
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    height: 50,
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {

                    if(formkey.currentState!.validate()){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShowMail(/*mail: email.text,*/),));
                    }
                    setdata();
                      },
                      child: Text('Login'),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }



  setdata()async{
    SharedPreferences prefrences = await SharedPreferences.getInstance();
    prefrences.setString('email', email.text);
    prefrences.setString('pass', password.text);
  }

}
