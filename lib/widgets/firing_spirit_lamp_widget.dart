import 'package:flutter/material.dart';

class FiringSpiritLampWidget extends StatefulWidget {
  const FiringSpiritLampWidget({Key? key, required this.lamp})
      : super(key: key);

  final bool lamp;

  @override
  State<FiringSpiritLampWidget> createState() => _FiringSpiritLampWidgetState();
}

class _FiringSpiritLampWidgetState extends State<FiringSpiritLampWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 20,
          width: 10,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  widget.lamp ? "assets/images/fire.png" : "assets/images/fireWhite.png",
                ),
                fit: BoxFit.fill),
          ),
        ),
        Container(
          height: 60,
          width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  widget.lamp
                      ? "assets/images/spiritLamp.png"
                      : "assets/images/spiritLampWhite.png",
                ),
                fit: BoxFit.fill),
          ),
        ),
      ],
    );
  }
}
