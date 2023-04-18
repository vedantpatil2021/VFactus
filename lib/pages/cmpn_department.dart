import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CmpnDepartment extends StatefulWidget {
  const CmpnDepartment({super.key});

  @override
  State<CmpnDepartment> createState() => _CmpnDepartment();
}

class _CmpnDepartment extends State<CmpnDepartment> {
  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;
  var outputzero = "";
  var outputone = "";
  var outputtwo = "";

  // // list of smart devices
  List mySmartDevices = [
    // [ smartDeviceName, iconPath , powerStatus ]
    ["INFT", "lib/images/air-conditioner.png", false],
  ];

  // // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    DatabaseReference D0 = FirebaseDatabase.instance.ref("/D0");
    DatabaseReference D1 = FirebaseDatabase.instance.ref("/D1");
    DatabaseReference D2 = FirebaseDatabase.instance.ref("/D2");
    fetchData() async {
      DatabaseEvent eventD0 = await D0.once();
      DatabaseEvent eventD1 = await D1.once();
      DatabaseEvent eventD2 = await D2.once();
      outputzero = eventD0.snapshot.value.toString();
      outputone = eventD1.snapshot.value.toString();
      outputtwo = eventD2.snapshot.value.toString();

      //D0
      if(outputzero == "0"){
        outputzero =  "false";
        // print("true");
      }
      else{
        outputzero = "true";
        // print("false");
      }

      //D1
      if(outputone == "0"){
        outputone =  "false";
        // print("true");
      }
      else{
        outputone = "true";
        // print("false");
      }

      //D2
      if(outputtwo == "0"){
        outputtwo =  "false";
        // print("true");
      }
      else{
        outputtwo = "true";
        // print("false");
      }
      // print(outputzero);
      // print(outputone);
      // print(outputtwo);

      setState(() {
        outputzero = outputzero;
      });
    }

    fetchData();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    'https://www.collegefunda.com/uploads/Institute/23-01-2020-AM-12-27-591179691810Vidyalankar%20Institute%20of%20Technology(VIT),Mumbai%20logo.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),



            // welcome home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Computer Engineering',
                    style: GoogleFonts.bebasNeue(fontSize: 50),
                  ),
                  Text("Total Number Of Teacher: 0",
                      style:
                      TextStyle(fontSize: 15, color: Colors.grey.shade800))
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 204, 204, 204),
              ),
            ),

            const SizedBox(height: 10),

            // Expanded(
            //   child: GridView.builder(
            //     itemCount: 1,
            //     physics: const AlwaysScrollableScrollPhysics(),
            //     padding: const EdgeInsets.all(15),
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 1,
            //       childAspectRatio: 1 / 1.3,
            //     ),
            //     itemBuilder: (context, index) {
            //       return Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: TeacherStatus(
            //               // smartDeviceName: mySmartDevices[index][0],
            //               smartDeviceName: "Vedant Patil",
            //               iconPath: "https://res.cloudinary.com/dbetnuton/image/upload/v1681147007/vedant_image_znizk3.jpg",
            //               powerOn: outputzero == "true" ? true : false,
            //               powerOnone: outputone == "true" ? true : false,
            //               powerOntwo: outputtwo == "true" ? true : false,
            //               onChanged: (value) => powerSwitchChanged(value, index),
            //               onChangedone: (value) => powerSwitchChanged(value, index),
            //               onChangedtwo: (value) => powerSwitchChanged(value, index),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: TeacherStatus(
            //               // smartDeviceName: mySmartDevices[index][0],
            //               smartDeviceName: "Shivam Raina",
            //               iconPath: "https://res.cloudinary.com/dbetnuton/image/upload/v1681810237/WhatsApp_Image_2023-04-18_at_2.57.45_PM_1_xtspyv.jpg",
            //               powerOn: false,
            //               powerOnone: false,
            //               powerOntwo: false,
            //               onChanged: (value) => powerSwitchChanged(value, index),
            //               onChangedone: (value) => powerSwitchChanged(value, index),
            //               onChangedtwo: (value) => powerSwitchChanged(value, index),
            //             ),
            //           ),
            //         ],
            //       );
            //     },
            //   ),
            // ),

            const SizedBox(height: 25),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 204, 204, 204),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
