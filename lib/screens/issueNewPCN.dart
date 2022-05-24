import 'package:carplate/screens/enterManually.dart';
import 'package:flutter/material.dart';

class IssueNewPCN extends StatefulWidget {
  IssueNewPCN({Key? key}) : super(key: key);

  @override
  State<IssueNewPCN> createState() => _IssueNewPCNState();
}

class _IssueNewPCNState extends State<IssueNewPCN> {
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
          "Issue a New PCN",
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
                      'Take a Photo',
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
                    MaterialPageRoute(builder: (context) => EnterManually()),
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
                      'Enter Manually',
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
