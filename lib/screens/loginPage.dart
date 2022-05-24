import 'package:carplate/screens/optionPage.dart';
import 'package:carplate/utils/http-client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode emailFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final _storage = FlutterSecureStorage();

  Future checkLogin() async {
    if (_formKey.currentState?.validate() == true) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState?.save();

      dynamic status = await HttpClients()
          .login(emailController.text, passwordController.text);
      print(status);
      if (status["status"] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OptionPage()),
        );
      }
    }
  }

  @override
  void initState() {
    getLoginStatus();
    super.initState();
  }

  getLoginStatus() async {
    setState(() {
      _isLoading = true;
    });
    dynamic data = await HttpClients().checkLogin();
    print(data);
    if (data == true) {
      setState(() {
        _isLoading = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OptionPage()),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
    }
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
          "Login Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: _isLoading
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(child: CircularProgressIndicator()))
          : Container(
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 69, 131, 145),
                          radius: 70,
                          child: Text(
                            "Car Plate",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: TextField(
                          focusNode: emailFocusNode,
                          controller: emailController,
                          decoration: InputDecoration(
                              labelText: "Email Address",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              )),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: TextField(
                          focusNode: passwordFocusNode,
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(

                              //suffix: Icon(FontAwesomeIcons.eyeSlash,color: Colors.red,),
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // checkLogin();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OptionPage()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          alignment: Alignment.center,
                          width: 250,
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
                              'Login',
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
            ),
    );
  }
}
