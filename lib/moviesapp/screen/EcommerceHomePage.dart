import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/moviesapp/model/moviedata.dart';
import 'package:provider_project/moviesapp/provider/movieprovider.dart';
import 'package:provider_project/moviesapp/screen/MyListView.dart';

class EcomHomePage extends StatelessWidget {
  const EcomHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color likecolor = Colors.red;
    Color unlikecolor = Colors.white;
    var watch = context.watch<MovieProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Amit Ecommerce"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return MyList();
              },));
            },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    fixedSize: MaterialStateProperty.all(Size(MediaQuery
                        .of(context)
                        .size
                        .width, 40))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.favorite, color: Colors.white),
                    Text(
                      " Go to my List ( ${watch.Mylist.length} )", style: TextStyle(color: Colors.white,fontSize: 20),)
                  ],
                )),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: watch.AllList.length,
                  itemBuilder: (context, index) {
                  return Card(
                    elevation: 10,
                    color: Colors.orange,
                    child: ListTile(
                      style:ListTileStyle.list,
                      trailing: IconButton(icon: Icon(Icons.favorite,color: watch.AllList[index].color),onPressed: (){
                        if(watch.AllList[index].like){
                          watch.removeAlllist(index: index);
                        }
                        else{
                          watch.AddMyList(title: watch.AllList[index].title, runtime: watch.AllList[index].runtime,index: index);
                        }
                      },),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                      title: Text(watch.AllList[index].title),
                      subtitle: Text(watch.AllList[index].runtime),),
                  );
                },),
              ),
            )
          ],
        ),
      ),
    );
  }
}
