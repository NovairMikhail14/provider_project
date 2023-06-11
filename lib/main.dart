import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/Start_Provider/MyHomePage.dart';
import 'package:provider_project/Start_Provider/My_Count.dart';
import 'package:provider_project/login_app/homepage.dart';
import 'package:provider_project/login_app/inheritance/signin_provider.dart';
import 'package:provider_project/moviesapp/provider/movieprovider.dart';
import 'package:provider_project/moviesapp/screen/EcommerceHomePage.dart';

void main() {
  runApp(
    //------- Start_Provider
    // const MyApp()


    //------- login app
  // ChangeNotifierProvider(create: (context) {
  //       return SiginInProvider();
  //     },
  //       child: MyApp(),)
 ChangeNotifierProvider(create: (context) {
        return MovieProvider();
      }, child:MyApp(),)
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: EcomHomePage()
      //------- Start_Provider
      // ChangeNotifierProvider(create: (context) {
      //       return MyCount();
      //     },child: MyHomePage(title: "My Homepage",)),
    );
  }
}




