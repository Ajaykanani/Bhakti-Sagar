import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
    );
    final sendRequestButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: MyColor.brown,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            sendRequest(emailController.text);
          },
          child: Text(
            "Send Request",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: MyColor.white, fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
      backgroundColor: MyColor.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: MyColor.brown),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: MyColor.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/images/logo.png",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 35),
                    sendRequestButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void sendRequest(String email) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .sendPasswordResetEmail(email: email)
            .then((value) => {
          Fluttertoast.showToast(msg: "successfully send email for changing password"),
          Navigator.of(context).pop()
        });
      } on FirebaseAuthException catch (error) {
        Fluttertoast.showToast(toastLength: Toast.LENGTH_LONG,msg: error.code);
        print(error.code);
      }
    }
  }
}
