import 'package:flutter/material.dart';
import 'package:pref/LoginPage.dart';
import 'package:pref/SecondPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  //ekran yönlendirmesini main üzerinden yaptığımız için 
  //material app ile scaffold u sarmalamayı unutma
  runApp(MaterialApp(
    home: MainApp(),
  ));
}

class MainApp extends StatefulWidget {

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String _userName = "";

  //set state- performans durumları gibi şeylerde build tekrar tekrar çalışabilir o nedenle 
  //tekrarlanmasını istemediğimiz olayları build içine yazmamalıyız
  //widget ilk oluşturulduğunda sadece 1 kere çalışır ve bidaha çalışmaz
  //sayfa açıldığında sadece 1 kere yapılasını istediğimiz işlemleri initState içine yazmalıyız
  @override
  void initState() {
    super.initState();
    //return işlemi yapılıp ekran çizildikten sonra bu işlemin(fonskiyon run) yapılmasını sağlayan kod
    //ekran açılır açılmaz yapılmasını istediğimiz şeyleri bunun içine yazıyoruz.
    WidgetsBinding.instance.addPostFrameCallback((_){
      _userNameControl(context);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
    );

    
  }

  void _userNameControl(BuildContext context) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    //eğer boş gelirse ?? "" değerini ata
    _userName = prefs.getString("UserName") ?? "";

    if(_userName.isEmpty){
      _openLoginPage(context);
    }else{
      _openSecondPage(context);
    }
  }

  void _openLoginPage(BuildContext context){
    _openPage(context, LoginPage());
  }

  void _openSecondPage(BuildContext context){
     _openPage(context, SecondPage(_userName));
  }

  void _openPage(BuildContext context, Widget page){
    MaterialPageRoute pageGo = MaterialPageRoute(
      builder: (BuildContext context){
        return page;
      },
    );

    Navigator.push(context, pageGo);
  }
}