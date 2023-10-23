import 'package:crash/choose_mode.dart';
import 'package:crash/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Homex extends StatefulWidget {
  const Homex({super.key});

  @override
  State<Homex> createState() => _HomexState();
}

class _HomexState extends State<Homex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 27, 28),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'AVIA',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Lottie.asset(
            "assets/lottie/x.json",
            animate: true,
            fit: BoxFit.cover,
            height: MediaQuery.sizeOf(context).width,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: InkWell(
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChooseMode()),
                );
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Start',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          //   child: InkWell(
          //     onTap: () {
          //       //settings
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => const Settings()),
          //       );
          //     },
          //     child: Container(
          //       height: 60,
          //       width: MediaQuery.of(context).size.width * 9,
          //       decoration: BoxDecoration(
          //         color: Colors.grey,
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       child: const Center(
          //         child: Text(
          //           'Settings',
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontWeight: FontWeight.bold,
          //               fontSize: 30),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
