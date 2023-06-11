import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/Start_Provider/My_Count.dart';

class MyHomePage extends StatelessWidget {

  MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    var read = context.read<MyCount>();
    var watch =  context.watch<MyCount>();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${watch.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){watch.incCounter();},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
