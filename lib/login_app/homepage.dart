import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'inheritance/signin_provider.dart';
import 'login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Provider Login Example"),
          actions: [
            IconButton(
                icon: Icon(Icons.login),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LogIn();
                    },
                  ));
                })
          ],
        ),
        body: Center(child:
        Column(
          children: [
            Consumer<SiginInProvider>(
              builder: (BuildContext ctx, value, child) {
                print("------Consumer");
                String username = value.Username;
                return Text(
                  (username == "") ? "Please Sign In" : username,
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Consumer<SiginInProvider>(
              builder: (BuildContext ctx, value, child) {
                print("------Consumer");

                return Text(
                  (value.Datesign == null) ? "Please Sign In" : "${value.Datesign}",
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Selector<SiginInProvider,DateTime>(builder:  (BuildContext ctx, datetime, child){
              print("------Selector");
              return Text(
                  (datetime == null) ? "Please Sign In" : "${datetime}",
                  style: Theme.of(context).textTheme.headline4,
                );
            },selector: (BuildContext ctx, value) {
              return value.Datesign??DateTime(1991);
            },
          ),],
        )
        )
        );
  }
}
