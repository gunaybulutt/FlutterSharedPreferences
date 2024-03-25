import 'package:flutter/material.dart';
import 'package:pref/SecondPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
  
}

class LoginPageState extends State<LoginPage> {

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(child: 
      
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            TextField(controller: _controller,),
            ElevatedButton( 
              child: Text("Giriş Yap",style: TextStyle(fontSize: 22),),
              onPressed: (){
                _login(context);
              }
            
            ),

          ],
        ),
        
      ),
    );
  }

  void _login(BuildContext context) async{
    //küçük bir yapıda olsa local'e kayıt işlemi gerçekleştirildiği için future yapısı 
    //döndürüyor ve asenkron olması gerekiyor
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("UserName",_controller.text);

    _openSecondPage(context);
  }

  void _openSecondPage(BuildContext context){
    MaterialPageRoute pageGo = MaterialPageRoute(
      builder: (BuildContext context){
        return SecondPage(_controller.text);
      },
    );

    Navigator.push(context, pageGo);

  }

}