import 'package:bhakti_sagar/utilities/auth_controller.dart';
import 'package:bhakti_sagar/widgets/colors.dart';
import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';

class AutoLoginPage extends StatefulWidget {
  const AutoLoginPage({Key? key}) : super(key: key);

  @override
  State<AutoLoginPage> createState() => _AutoLoginPageState();
}

class _AutoLoginPageState extends State<AutoLoginPage> {
  final authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          future: authController.tryAutoLogin(),
          builder: (context, authResult) {
            if (authResult.connectionState == ConnectionState.waiting ) {
              return Scaffold(
                backgroundColor: MyColor.brown,
                body: Center(
                  child: Container(
                    alignment: Alignment.center,
                    color: MyColor.darkBrown,
                    child: CircularProgressIndicator(color: MyColor.brown,),
                  )
                ),
              );
            }
            else {
              if (authResult.data == true) {
                return HomePage();
              }
              return LoginPage();
            }
          }
          );
  }
}
