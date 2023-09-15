import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesrnprovider/mycounter.dart';
import 'package:provider/provider.dart';

class second extends StatelessWidget {
  const second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("second"),
      ),
      body: Center(
        child: Consumer<mycounter>(
          builder: (context, mycounter, child) {
            return Column(children: [
              Text(
                '${mycounter.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              IconButton(
                  onPressed: () {
                    mycounter.inc();
                  },
                  icon: Icon(Icons.add))
            ]);
          },
        ),
      ),
    );
  }
}
