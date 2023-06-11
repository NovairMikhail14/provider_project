import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/moviesapp/provider/movieprovider.dart';

class MyList extends StatelessWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var watch = context.watch<MovieProvider>();
    return Scaffold(
      appBar: (AppBar(
        title: Text("My List( ${watch.Mylist.length} )"),
      )),
      body: ListView.builder(
        itemCount: watch.Mylist.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 15,
            borderOnForeground: true,
            child: ListTile(
              title: Text(watch.Mylist[index].title),
              subtitle: Text(watch.Mylist[index].runtime),
              trailing: InkWell(
                borderRadius: BorderRadius.circular(15),
                radius: 15,
                customBorder:
                    RoundedRectangleBorder(side: BorderSide(width: 10)),
                child: Text(
                  "Remove",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  watch.removemylist(select: watch.Mylist[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
