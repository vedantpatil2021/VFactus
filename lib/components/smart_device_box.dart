import 'package:flutter/material.dart';
import 'package:vfactus/pages/cmpn_department.dart';
import 'package:vfactus/pages/department_page.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final String routePath;

  SmartDeviceBox({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.routePath
  });

  void routePage(context) {
    if (routePath == "DepartmentPage()"){
      Navigator.push(context,MaterialPageRoute(builder: (context) => const DepartmentPage()));
    }
    else if(routePath == "CmpnDepartment()"){
      Navigator.push(context,MaterialPageRoute(builder: (context) => const CmpnDepartment()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: InkWell(

          onTap: () {
            routePage(context);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const DepartmentPage()));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.grey[900],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // icon
                  Image.network(
                    iconPath,
                    height: 109,
                    color: Colors.white,
                  ),

                  // smart device name + switch
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
                            smartDeviceName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
