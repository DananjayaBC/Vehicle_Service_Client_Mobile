import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vehicle_service_app/widgets/custom_dialog.dart';

class FirstView extends StatelessWidget {
  final primaryColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.car,
                      color: Color.fromRGBO(245, 48, 111, 1.0),
                      size: 60.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'VEHICLE',
                          style: TextStyle(
                            fontSize: 38.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(245, 48, 111, 1.0),
                          ),
                        ),
                        Text(
                          'SERVICE',
                          style: TextStyle(
                            fontSize: 38.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 55.0,
                    ),
                  ],
                ),
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 44, color: Colors.black),
                ),
                SizedBox(height: _height * 0.05),
                // AutoSizeText(
                //   "Let’s start buying your Train ticket",
                //   maxLines: 2,
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 40,
                //     color: Colors.white,
                //   ),
                // ),
                SizedBox(height: _height * 0.15),
                RaisedButton(
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/signIn');
                  },
                ),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
            ],
          ),
        ),
      ),
    );
  }
}
