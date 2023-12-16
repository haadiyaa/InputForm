import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.blue.shade200,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width * .8,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 6,
                          offset: Offset(5, 3))
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 188, 238, 253),
                  ),
                  child: const Center(
                    child: Text(
                      'WELOME',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Silkscreen',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () =>
                    Navigator.pop(context),
                child: const Text(
                  'Go back',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
