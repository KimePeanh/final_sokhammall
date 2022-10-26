import 'package:flutter/material.dart';
import 'package:sokha_mall/src/utils/constants/app_constant.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.95,
      // height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(standardBorderRadius),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/6072812.jpg"))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "សម្រាប់អ្នកវិនិយោគទិញភាគហ៊ុនក្នុង 1 ហ៊ុនតម្លៃ 1000\$",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'kh'),
              textScaleFactor: 1,
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "- ក្នុង 1ឆ្នាំ ក្រុមហ៊ុនផ្តល់ប្រាក់ចំណេញ 400\$ ",
              style: TextStyle(
                color: Colors.white,fontFamily: 'kh'
              ),
              textScaleFactor: 1,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "- ប្រាក់ដើម + ប្រាក់ចំណេញក្នុង 1ឆ្នាំ = ប្រាក់សរុប",
              style: TextStyle(
                color: Colors.white,fontFamily: 'kh'
              ),
              textScaleFactor: 1,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "* 1000\$ + 400\$ សរុប = 1400\$",
              style: TextStyle(
                color: Colors.white,fontFamily: 'kh'
              ),
              textScaleFactor: 1,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "- ការបើកប្រាក់ប្រចាំខែ = ប្រាក់សរុបចែកនឹង 12ខែ",
              style: TextStyle(
                color: Colors.white,fontFamily: 'kh'
              ),
              textScaleFactor: 1,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "1400\$ ចែក 12 = 116\$ ក្នុង 1ខែ",
              style: TextStyle(
                color: Colors.white,fontFamily: 'kh'
              ),
              textScaleFactor: 1,
            ),
          )
        ],
      ),
    );
  }
}
