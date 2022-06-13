import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hfu_app2/bottomNavBar/profile.dart';
import 'package:hfu_app2/userController/utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hfu_app2/widgets/appbarWidget.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import 'bottomNavBar/home.dart';
import 'bottomNavBar/menu.dart';
import 'dropdownDir/about.dart';
import 'dropdownDir/contact.dart';
import 'dropdownDir/settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(HfuApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class HfuApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  HfuApp({Key? key}) : super(key: key);
  static const keyDarkMode = 'key-dark-mode';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: navigatorKey,
        title: 'HFU App',
        theme: //isDarkMode
         //  ?
         ThemeData(
          colorSchemeSeed: Colors.green.shade800,
          brightness: Brightness.light,
          // splashColor: Colors.grey,
                ),
            //: ThemeData(
        //  colorSchemeSeed: Colors.green.shade800,
        //  brightness: Brightness.dark,
        home: FutureBuilder(
            future: _fbApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('You have an error! ${snapshot.error.toString()}');
                return const Text('Something went wrong!');
              } else if (snapshot.hasData) {
                return const HomeScreen();
              } else {
                return const Center(
                    child: SizedBox(
                  height: 20,
                  width: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        value: 0.7,
                    ),
                  ),
                )
                );
              }
            })
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _selectedIndex = 1;
  static final List<Widget> _pages = <Widget>[Profile(), Home(), const Menu()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: const CustomMainAppBar(),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Colors.transparent,
        color: Colors.white54,
        items: const [
          Icon(Icons.account_circle_rounded, size: 30,),
          Icon(Icons.weekend, size: 30,),
          Icon(Icons.apps, size: 30,)
        ],
        index: _selectedIndex,
        onTap: _tapedItem,
      )
    );
  }
  void _tapedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
