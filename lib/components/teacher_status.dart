import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeacherStatus extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

  //D1
  final bool powerOnone;
  void Function(bool)? onChangedone;
  //D2
  final bool powerOntwo;
  void Function(bool)? onChangedtwo;

  TeacherStatus({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,

  //  D1
    required this.powerOnone,
    required this.onChangedone,
  //  D2
    required this.powerOntwo,
    required this.onChangedtwo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.grey[900],
        ),
        child: new Row(
          children: <Widget>[
            new Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new Image.network(
                      iconPath,
                      height: 140,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: new Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        new Text(
                          smartDeviceName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    //D0
                    Row(
                      children: [
                        new Text(
                          "Present/Absent",
                          style: TextStyle(color: Colors.white),
                        ),
                        new CupertinoSwitch(
                            value: powerOntwo, onChanged: onChanged),
                      ],
                    ),
                    //D1
                    Row(
                      children: [
                        new Text(
                          "Busy",
                          style: TextStyle(color: Colors.white),
                        ),
                        new CupertinoSwitch(
                            value: powerOnone, onChanged: onChangedone),
                      ],
                    ),
                    //D2
                    Row(
                      children: [
                        new Text(
                          "Available",
                          style: TextStyle(color: Colors.white),
                        ),
                        CupertinoSwitch(value: powerOn, onChanged: onChangedtwo),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
