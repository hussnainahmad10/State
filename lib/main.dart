import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:state_manegement/counter_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ChangeNotifierProvider(
        create: (_) => CounterProvider(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Build new");
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Consumer(
          builder: (ctx, _, __) {
            print("Consumer");
            return Text(
              // "${Provider.of<CounterProvider>(ctx, listen: true).getcounter()}",
              "${ctx.watch<CounterProvider>().getcounter()}",
              style: TextStyle(fontSize: 25),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Provider.of<CounterProvider>(
          //   context,
          //   listen: false,
          // ).incrementCounter();
          context.read<CounterProvider>().incrementCounter();
          // setState(() {

          // });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
