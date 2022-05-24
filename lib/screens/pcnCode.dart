import 'package:carplate/screens/summary.dart';
import 'package:flutter/material.dart';

class PCNCode extends StatefulWidget {
  PCNCode({Key? key}) : super(key: key);

  @override
  State<PCNCode> createState() => _PCNCodeState();
}

class _PCNCodeState extends State<PCNCode> {
  String? _chosenValue = "Select PCN Code";
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
          "PCN Codes",
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: DropdownButton<String>(
                  isExpanded: true,
                  focusColor: Colors.white,
                  value: _chosenValue,
                  elevation: 15,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  iconEnabledColor: Colors.black,
                  items: <String>[
                    'Select PCN Code',
                    'IOS',
                    'Flutter',
                    'Node',
                    'Java',
                    'Python',
                    'PHP',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    "Please choose a langauage",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _chosenValue = value;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: const TextField(
                  maxLines: 8,
                  decoration: InputDecoration(
                      labelText: "Reason/Description",
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Summary()),
                      );
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
                          'Next',
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
