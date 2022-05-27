import 'package:carplate/screens/pcnCode.dart';
import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class EnterManually extends StatefulWidget {
  EnterManually({Key? key}) : super(key: key);

  @override
  State<EnterManually> createState() => _EnterManuallyState();
}

class _EnterManuallyState extends State<EnterManually> {
  FocusNode numberPlateFocusNode = new FocusNode();
  TextEditingController numberPlateController = new TextEditingController();
  FocusNode carModelFocusNode = new FocusNode();
  TextEditingController carModelController = new TextEditingController();
  FocusNode carColorFocusNode = new FocusNode();
  TextEditingController carColorController = new TextEditingController();
  FocusNode carLocationNode = new FocusNode();
  TextEditingController carLocationController = new TextEditingController();
  GlobalKey<FormState> _mobileFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void checkData() async {
    if (_mobileFormKey.currentState?.validate() == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PCNCode(
                  numberPlate: numberPlateController.text,
                  carModel: carModelController.text,
                  carLocation: carLocationController.text,
                  carColor: carColorController.text,
                )),
      );
    } else {}
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
          "Enter Manually",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _mobileFormKey,
        child: Container(
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
                  child: TextFormField(
                    focusNode: numberPlateFocusNode,
                    controller: numberPlateController,
                    validator: Validators.compose(
                      [
                        Validators.required('Number Plate is required'),
                      ],
                    ),
                    decoration: InputDecoration(
                        labelText: "Number Plate",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    focusNode: carModelFocusNode,
                    controller: carModelController,
                    decoration: InputDecoration(
                        labelText: "Car Model",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        )),
                    validator: Validators.compose(
                      [
                        Validators.required('Car Model is required'),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    focusNode: carColorFocusNode,
                    controller: carColorController,
                    decoration: InputDecoration(
                        labelText: "Car Colour",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        )),
                    validator: Validators.compose(
                      [
                        Validators.required('Car Colour is required'),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    focusNode: carLocationNode,
                    controller: carLocationController,
                    decoration: InputDecoration(
                        labelText: "Car Location",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        )),
                    validator: Validators.compose(
                      [
                        Validators.required('Car Location is required'),
                      ],
                    ),
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
                        checkData();
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
      ),
    );
  }
}
