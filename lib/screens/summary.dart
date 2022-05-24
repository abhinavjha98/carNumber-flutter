import 'package:flutter/material.dart';

class Summary extends StatefulWidget {
  Summary({Key? key}) : super(key: key);

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color.fromARGB(255, 69, 131, 145),
                  Color.fromARGB(255, 69, 131, 145)
                ]),
          ),
        ),
        // backgroundColor: Color.fromARGB(255, 69, 131, 145),
        title: Text(
          "Summary",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color.fromARGB(255, 231, 243, 229),
                Color.fromARGB(255, 69, 131, 145),
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: const TextField(
                  decoration: InputDecoration(
                      labelText: "Number Plate",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      )),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: const TextField(
                  decoration: InputDecoration(
                      labelText: "Car Model",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      )),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: const TextField(
                  decoration: InputDecoration(
                      labelText: "Car Colour",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      )),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: const TextField(
                  decoration: InputDecoration(
                      labelText: "Car Location",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromARGB(255, 69, 131, 145),
                                Color.fromARGB(255, 69, 131, 145),
                              ])),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Back',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                     
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromARGB(255, 69, 131, 145),
                                Color.fromARGB(255, 69, 131, 145),
                              ])),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Save & Print',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}