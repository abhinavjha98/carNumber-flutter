import 'package:carplate/models/pcnSummary.dart';
import 'package:carplate/utils/http-client.dart';
import 'package:flutter/material.dart';

class PastPCN extends StatefulWidget {
  PastPCN({Key? key}) : super(key: key);

  @override
  State<PastPCN> createState() => _PastPCNState();
}

class _PastPCNState extends State<PastPCN> {
  List<PCNSummary> pcnSummary = [];
  @override
  void initState() {
    // TODO: implement initState
    getPastPCNSummary();
    super.initState();
  }

  void getPastPCNSummary() async {
    dynamic data = await HttpClients().getPCNSummary();
    setState(() {
      pcnSummary = data;
    });
  }

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
          "Past PCN",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: ListView.builder(
              itemCount: pcnSummary.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    PastCard(
                      dateOfCreation: pcnSummary[index].dateOfCreation,
                      location:
                          pcnSummary[index].carDetails![index].carLocation,
                    ),
                  ],
                );
              }),
        ),
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
      ),
    );
  }
}

class PastCard extends StatefulWidget {
  final String dateOfCreation;
  final String location;
  const PastCard({
    Key? key,
    this.dateOfCreation = "",
    this.location = "",
  }) : super(key: key);

  @override
  State<PastCard> createState() => _PastCardState();
}

class _PastCardState extends State<PastCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.dateOfCreation),
            Text(widget.location),
          ],
        ),
      ),
      elevation: 8,
      shadowColor: Colors.green,
      margin: EdgeInsets.all(10),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white)),
    );
  }
}
