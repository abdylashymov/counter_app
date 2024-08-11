import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  int san = 0;

  void koshuu() {
    setState(() {
      san++;
    });
  }

  void kemituu() {
    setState(() {
      if (san > 0) san--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tapshyrma 01',
            style: TextStyle(color: Colors.black, fontSize: 30.0),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SecondPage(number: san);
                }));
              },
              child: Container(
                // onPressed: (){},
                // onTap : () {},
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                width: 360,
                height: 60,
                child: Center(
                  child: Center(
                    child: Text(
                      ' San : $san',
                      style: const TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: kemituu,
                    child: const Icon(
                      Icons.remove,
                      size: 50,
                    )),
                ElevatedButton(
                    onPressed: koshuu,
                    child: const Icon(
                      Icons.add,
                      size: 50,
                    )),
              ],
            ),
          ]),
        ));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Тапшырма 2',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
            width: 360,
            height: 60,
            child: Center(
              child: Text(
                'Сан: $number',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
