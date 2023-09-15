import 'package:flutter/material.dart';
import 'package:lesrnprovider/mycounter.dart';
import 'package:lesrnprovider/second.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<mycounter>(
      create: (context) => mycounter(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'counter'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 10;

  // late Timer time;
  bool clicked = false;

//   void startTimer() async {
//     counter = 4;
//     time = await Timer.periodic(Duration(seconds: 1), (timer) async {
//       if (counter > 1) {
//         setState(() {
//           counter--;
//           clicked = true;
//         });
//       } else {
// // Navigator.of(context).pop();
//
//          Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => second(),
//         ));
//         time.cancel();
//         await Future.delayed(Duration(seconds: 1));
//         setState(() {
//           clicked = false;
//         });
//       }
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(
                  Icons.arrow_circle_right,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => second(),
                  ));
                },
              ),
            ],
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: Consumer<mycounter>(
              builder: (context, mycounter, child) {
                return Text(
                    this.widget.title + " " + mycounter.counter.toString());
              },
            )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Consumer<mycounter>(
                builder: (context, mycounter, child) {
                  return Text(
                    '${mycounter.counter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
              Consumer<mycounter>(
                builder: (context, mycounter, child) {
                  return FloatingActionButton(
                    child: clicked == true
                        ? Text(
                            '${counter}',
                            style: Theme.of(context).textTheme.headlineMedium,
                          )
                        : Icon(Icons.add),
                    onPressed: () async {
                      mycounter.inc();
                      // startTimer();

                      // await Future.delayed(Duration(seconds: 2));
                    },
                  );
                },
              ),
              Consumer<mycounter>(
                builder: (context, mycounter, child) {
                  return Text(
                    '${mycounter.counter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Consumer<mycounter>(
          builder: (context, mycounter, child) {
            return FloatingActionButton(
              onPressed: () {
                mycounter.clear();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.cleaning_services),
            );
          },
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
