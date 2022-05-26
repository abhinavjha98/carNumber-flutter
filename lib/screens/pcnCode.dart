import 'package:carplate/models/pcnCode.dart';
import 'package:carplate/screens/summary.dart';
import 'package:carplate/utils/http-client.dart';
import 'package:flutter/material.dart';

class PCNCode extends StatefulWidget {
  final String numberPlate;
  final String carModel;
  final String carColor;
  final String carLocation;
  PCNCode(
      {Key? key,
      this.numberPlate = "",
      this.carModel = "",
      this.carColor = "",
      this.carLocation = ""})
      : super(key: key);

  @override
  State<PCNCode> createState() => _PCNCodeState();
}

class _PCNCodeState extends State<PCNCode> {
  String? _chosenValue = "select-code";
  List<PCNCODE> pcnCode = [];
  List<DropdownMenuItem<String>> pcnScheme = [];
  FocusNode pcnFocus = new FocusNode();
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    getPCNCODE();
    super.initState();
  }

  void getPCNCODE() async {
    setState(() {
      _isLoading = true;
    });
    dynamic data = await HttpClients().getPCNCode();
    setState(() {
      pcnCode = data;
    });
    getPCNCodeDropDown(pcnCode);
  }

  void getPCNCodeDropDown(List<PCNCODE> _initData) {
    List<DropdownMenuItem<String>> dropdownItemsSchemeas = [
      DropdownMenuItem<String>(
        value: 'select-code',
        child: new Text(
          'Select PCN Code',
        ),
      )
    ];
    for (int i = 0; i < _initData.length; i++) {
      dropdownItemsSchemeas.add(DropdownMenuItem<String>(
        value: _initData[i].slug,
        child: new Text(
          _initData[i].pcnCode,
        ),
      ));
    }
    setState(() {
      pcnScheme = dropdownItemsSchemeas;
    });
    setState(() {
      _isLoading = false;
    });
  }

  void selectCode(String value) {
    setState(() {
      _chosenValue = value;
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
          "PCN Codes",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: _isLoading
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(child: CircularProgressIndicator()))
          : Container(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Theme.of(context).colorScheme.onSurface,
                                width: 2),
                          ),
                        ),
                        child: DropdownButton<String>(
                            focusNode: pcnFocus,
                            value: _chosenValue,
                            underline: Container(),
                            menuMaxHeight: 300,
                            dropdownColor: Colors.white,
                            iconDisabledColor:
                                Theme.of(context).colorScheme.onSurface,
                            hint: Text(
                              "Select PCN Code",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                            isExpanded: true,
                            onChanged: (value) {
                              selectCode(value.toString());
                            },
                            items: pcnScheme),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: const TextField(
                        maxLines: 8,
                        decoration: InputDecoration(
                            labelText: "Reason/Description",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
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
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
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
                              MaterialPageRoute(
                                  builder: (context) => Summary()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
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
