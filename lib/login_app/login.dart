import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'inheritance/signin_provider.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    var siginincontroller = TextEditingController();
    var passwordcontroller = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: siginincontroller,
                  decoration: InputDecoration(contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
                    hintText: "User Name",border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  controller:passwordcontroller,  
                  decoration: InputDecoration(hintText: "Password",border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text("Sign In"),
                  onPressed: (){
                    context.read<SiginInProvider>().SiginIn(siginincontroller.text);
                  },
                  style: ButtonStyle(fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width,double.infinity*2))),
                ),
                ElevatedButton(
                  child: Text("Set Time"),
                  onPressed: (){
                    context.read<SiginInProvider>().SetTime();
                  },
                  style: ButtonStyle(fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width,double.infinity*2))),
                ),
                ElevatedButton(
                  child: Text("Back"),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width,double.infinity*2))),
                )
              ],
            ),
          ),
        ),
    );
  }
}

