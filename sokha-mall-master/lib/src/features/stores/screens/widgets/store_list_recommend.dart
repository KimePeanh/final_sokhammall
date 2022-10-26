// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sokha_mall/src/features/stores/bloc/store_bloc.dart';
// import 'package:sokha_mall/src/features/stores/bloc/store_event.dart';

// import 'store_list_horizontal.dart';

// class StoreListRecommend extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => StoreBloc()..add(FetchStarted()),
//       child: Body(),
//     );
//   }
// }

// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           alignment: Alignment.centerLeft,
//           margin: EdgeInsets.only(left: 15, right: 10),
//           //alignment: Alignment.centerLeft,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Recommended",
//                   textScaleFactor: 1.3,
//                   style: TextStyle(
//                       letterSpacing: 1,
//                       color: Theme.of(context).textTheme.headline1!.color,
//                       fontWeight: FontWeight.w500)),
//               IconButton(
//                   icon: Icon(Icons.arrow_forward_outlined), onPressed: () {})
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         StoreListHorizontal(),
//       ],
//     );
//   }
// }
