import 'package:carplate/screens/issueNewPCN.dart';
import 'package:carplate/screens/pastPCN.dart';
import 'package:flutter/material.dart';

class OptionPage extends StatefulWidget {
  OptionPage({Key? key}) : super(key: key);

  @override
  State<OptionPage> createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {
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
          "Option Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IssueNewPCN()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  alignment: Alignment.center,
                  width: 250,
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
                      'Issue a New PCN',
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
                    MaterialPageRoute(builder: (context) => PastPCN()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  alignment: Alignment.center,
                  width: 250,
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
                      'Past PCN',
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
        ),
      ),
    );
  }
}
