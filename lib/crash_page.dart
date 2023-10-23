import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import 'homex.dart';

String setstablish(String input, int shift) {
  StringBuffer result = StringBuffer();
  for (int i = 0; i < input.length; i++) {
    int charCode = input.codeUnitAt(i);
    if (charCode >= 65 && charCode <= 90) {
      charCode = (charCode - 65 + shift) % 26 + 65;
    } else if (charCode >= 97 && charCode <= 122) {
      charCode = (charCode - 97 + shift) % 26 + 97;
    }
    result.writeCharCode(charCode);
  }
  return result.toString();
}

class CrashPage extends StatefulWidget {
  const CrashPage({Key? key}) : super(key: key);

  @override
  State<CrashPage> createState() => _CrashPageState();
}

class _CrashPageState extends State<CrashPage> {
  final TextEditingController _controller = TextEditingController(text: "0");

  double _multiplier = 1.0;
  bool _gameOver = false;
  late Timer _timer = Timer(Duration.zero, () {});
  bool _animate = false;

  bool _isStarted = false;
  bool _isInProgress = false;

  double _generateMultiplier() {
    return double.parse(((Random().nextDouble() * 9) + 1).toStringAsFixed(2));
  }

  void _start(double generatedMultiplier) {
    _multiplier = 1;
    _timer.cancel(); // Отменяем предыдущий таймер, если есть
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        _animate = true;
        _isInProgress = true;
        _gameOver = false;
        _multiplier += 0.01;

        if (double.parse(_multiplier.toStringAsFixed(2)) ==
            double.parse(generatedMultiplier.toStringAsFixed(2))) {
          _animate = false;
          _isStarted = false;
          _isInProgress = false;
          _gameOver = true;

          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 27, 28),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: StreamBuilder(
              stream:
                  RxSharedPreferences.getInstance().getDoubleStream("balance"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 150),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  ' ${snapshot.data!.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                const Icon(
                                  Icons.money_outlined,
                                  color: Colors.yellow,
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Homex()),
                                (route) => false,
                              );
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 8, 176, 28),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                  child: Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 30,
                              )),
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: MediaQuery.sizeOf(context).width,
                        width: MediaQuery.sizeOf(context).width,
                        child: Stack(
                          children: [
                            Lottie.asset(
                              "assets/lottie/sky.json",
                              animate: true,
                              fit: BoxFit.cover,
                              height: MediaQuery.sizeOf(context).width,
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: ClipPath(
                                clipper: DiagonalClipper(),
                                child: AnimatedContainer(
                                  width: _animate
                                      ? MediaQuery.sizeOf(context).width - 75
                                      : 80,
                                  height: _animate
                                      ? MediaQuery.sizeOf(context).width / 2
                                      : 80,
                                  decoration: BoxDecoration(
                                    color: _animate
                                        ? Colors.red.withOpacity(0.75)
                                        : Colors.transparent,
                                    borderRadius: _animate
                                        ? const BorderRadius.vertical(
                                            bottom: Radius.circular(20.0),
                                          )
                                        : BorderRadius.zero,
                                  ),
                                  duration: Duration(seconds: _animate ? 8 : 1),
                                  curve: Curves.easeInOut,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: AnimatedAlign(
                                alignment: _animate
                                    ? Alignment.centerRight
                                    : Alignment.bottomLeft,
                                duration: Duration(seconds: _animate ? 8 : 1),
                                curve: Curves.easeInOut,
                                child: Lottie.asset(
                                  "assets/lottie/x.json",
                                  height: 120,
                                  width: 120,
                                  animate: _animate,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                '${_multiplier.toStringAsFixed(2)}x',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: _controller,
                          style: const TextStyle(color: Colors.white),
                          readOnly: true,
                          decoration: const InputDecoration(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 226, 53, 41),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: CupertinoButton(
                          onPressed: () {
                            _controller.text = "0.00";
                          },
                          child: const Text(
                            "Clear",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color.fromARGB(255, 55, 12, 186),
                            ),
                            child: CupertinoButton(
                              onPressed: () {
                                if (_controller.text.isEmpty) {
                                  if (snapshot.data! < 5) {
                                    _controller.text = "0.00";
                                  } else {
                                    _controller.text = "5.00";
                                  }
                                } else {
                                  if ((double.parse(_controller.text) - 5) <=
                                      snapshot.data!) {
                                    _controller.text =
                                        (double.parse(_controller.text))
                                            .toStringAsFixed(2);
                                  }
                                }
                              },
                              child: const Text(
                                "-",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: const Color.fromARGB(255, 101, 198, 86),
                            ),
                            child: CupertinoButton(
                              onPressed: () {
                                if (_controller.text.isEmpty) {
                                  if (snapshot.data! < 5) {
                                    _controller.text = "0.00";
                                  } else {
                                    _controller.text = "5.00";
                                  }
                                } else {
                                  if ((double.parse(_controller.text) + 5) <=
                                      snapshot.data!) {
                                    _controller.text =
                                        (double.parse(_controller.text) + 5)
                                            .toStringAsFixed(2);
                                  }
                                }
                              },
                              child: const Text(
                                "+",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: _isStarted
                              ? const Color.fromARGB(255, 187, 30, 38)
                              : const Color.fromARGB(255, 46, 212, 24),
                        ),
                        child: CupertinoButton(
                          onPressed: () {
                            if (_isStarted) {
                              if (!_gameOver) {
                                setState(() {
                                  _isStarted = false;
                                });
                                RxSharedPreferences.getInstance().setDouble(
                                    "balance",
                                    snapshot.data! +
                                        (double.parse(_controller.text) *
                                            _multiplier));
                              }
                            } else {
                              if (!_isInProgress) {
                                if (_controller.text.isEmpty ||
                                    double.parse(_controller.text) == 0) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.red,
                                      content:
                                          Center(child: Text("Balance is low")),
                                    ),
                                  );
                                } else if (snapshot.data! <
                                    double.parse(_controller.text)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Center(
                                          child: Text(
                                              "Balance is lower than the bet")),
                                    ),
                                  );
                                } else {
                                  RxSharedPreferences.getInstance().setDouble(
                                      "balance",
                                      snapshot.data! -
                                          double.parse(_controller.text));
                                  setState(() {
                                    _isStarted = true;
                                  });

                                  _start(_generateMultiplier());
                                }
                              }
                            }
                          },
                          child: Text(
                            _isStarted ? "Stop" : "Start",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  );
                } else {
                  return const CupertinoActivityIndicator();
                }
              }),
        ),
      ),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.moveTo(0, height);
    path.lineTo(width, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
