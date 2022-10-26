// import 'package:flutter/material.dart';
// import 'package:flutter_clean_calendar/clean_calendar_event.dart';
// import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
// import 'package:sokha_mall/src/utils/constants/app_constant.dart';

// class Schecdule extends StatefulWidget {
//   const Schecdule({Key? key}) : super(key: key);

//   @override
//   State<Schecdule> createState() => _SchecduleState();
// }

// class _SchecduleState extends State<Schecdule> {
//   DateTime? selectedDay;
//   List<CleanCalendarEvent>? selectedEvent;

//   final Map<DateTime, List<CleanCalendarEvent>> events = {
//     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
//       CleanCalendarEvent('First Withdraw',
//           startTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day, 10, 0),
//           endTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day, 12, 0),
//           description: 'Withdraw at ${DateTime.now().toString().split(" ")[0]} 350\$',
//           color: Colors.blue),
//     ],
//     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
//       CleanCalendarEvent('First Withdraw',
//           startTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day, 10, 0),
//           endTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day, 12, 0),
//           description: 'Withdraw at ${DateTime.now().toString().split(" ")[0]} 350\$',
//           color: Colors.blue),
//     ],
//   };

//   void _handleData(date) {
//     setState(() {
//       selectedDay = date;
//       selectedEvent = events[selectedDay] ?? [];
//     });
//     print(selectedDay);
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     selectedEvent = events[selectedDay] ?? [];
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         brightness: Brightness.light,
//         // backgroundColor: Theme.of(context).primaryColor,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           "Schedule",
//           style: TextStyle(color: Colors.black),
//           textScaleFactor: 1.1,
//         ),
//         leading: InkWell(
//           child: Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//           onTap: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Column(
//         children: <Widget>[
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * 0.5,
//             child: Calendar(
//               startOnMonday: true,
//               selectedColor: Colors.red,
//               todayColor: Colors.black,
//               eventColor: Colors.green,
//               eventDoneColor: Colors.amber,
//               // bottomBarColor: Colors.deepOrange,
//               onRangeSelected: (range) {
//                 print('selected Day ${range.from},${range.to}');
//               },
//               onDateSelected: (date) {
//                 return _handleData(date);
//               },
//               events: events,
//               isExpanded: true,
//               dayOfWeekStyle: TextStyle(
//                 fontSize: 15,
//                 color: Colors.amber,
//                 fontWeight: bold,
//               ),
//               bottomBarTextStyle: TextStyle(
//                 color: Colors.black,
//               ),
//               hideBottomBar: false,
//               hideArrows: false,
//               weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
//             ),
//           ),
          
//         ],
//       ),
//     );
//   }
// }
