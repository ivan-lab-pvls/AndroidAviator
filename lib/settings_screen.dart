// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class Settings extends StatefulWidget {
//   const Settings({super.key});

//   @override
//   State<Settings> createState() => SeetingsS();
// }

// class SeetingsS extends State<Settings> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 29, 27, 28),
//       body: ListView(
//         children: [
//           Row(
//             children: [
//               const SizedBox(
//                 width: 10,
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Icon(
//                   Icons.arrow_back_ios,
//                   color: Colors.white,
//                 ),
//               ),
//               const Spacer(),
//             ],
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           const Center(
//             child: Text(
//               'Settings',
//               style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25),
//             ),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 40.0, right: 40.0),
//             child: InkWell(
//               onTap: () {
//                 // about app
//               },
//               child: Container(
//                 height: 50,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'About app',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 25),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 40.0, right: 40.0),
//             child: InkWell(
//               onTap: () {
//                 // about app
//               },
//               child: Container(
//                 height: 50,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Privacy & Policy',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 25),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 40.0, right: 40.0),
//             child: InkWell(
//               onTap: () {
//                 // about app
//               },
//               child: Container(
//                 height: 50,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Terms & Conditions',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 25),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 40.0, right: 40.0),
//             child: InkWell(
//               onTap: () {
//                 // about app
//               },
//               child: Container(
//                 height: 50,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Rate app',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 25),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//         ],
//       ),
//     );
//   }
// }
