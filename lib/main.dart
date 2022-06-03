import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hfu_app2/bottomNavBar/profile.dart';
import 'package:hfu_app2/userController/utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import 'bottomNavBar/home.dart';
import 'bottomNavBar/menu.dart';
import 'dropdownDir/about-project.dart';
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


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: navigatorKey,
        title: 'HFU App',
        theme:// isDarkMode
           // ?
         ThemeData(
          colorSchemeSeed: Colors.green.shade800,
          brightness: Brightness.light,
          // splashColor: Colors.grey,
                ),
           /* : ThemeData(
          colorSchemeSeed: Colors.green.shade800,
          brightness: Brightness.dark,
        ),*/
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

 /* @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() {
    FlutterNativeSplash.remove();
  } */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: NewGradientAppBar(
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: const [
              0.3,
              0.4,
              1
            ],
            colors: [
              Colors.green.shade600,
              Colors.lightGreen.shade500,
              Colors.white30,
            ]),
        centerTitle: false,
        title: const Text(
          'HFU Mobile',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.menu_rounded),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    children: [
                      const Text('Settings      ', textAlign: TextAlign.left),
                      IconButton(
                        icon: const Icon(Icons.settings),
                        color: Colors.black,
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Settings())),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                    ],
                  )),
              PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    children: [
                      const Text('Kontakt      ', textAlign: TextAlign.left),
                      IconButton(
                        alignment: Alignment.centerRight,
                        icon: const Icon(Icons.mail),
                        color: Colors.black,
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Contact())),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                    ],
                  )),
              PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                    children: [
                      const Text('About         ', textAlign: TextAlign.left),
                      IconButton(
                        alignment: Alignment.centerRight,
                        icon: const Icon(Icons.announcement),
                        color: Colors.black,
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutProject())),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                    ],
                  )
              ),
            ],
            onSelected: (item) => _selectedItem(context, item),
          ),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profil',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.weekend), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Menü')
        ],
        currentIndex: _selectedIndex,
        onTap: _tapedItem,
      ),
    );
  }

  void _tapedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _selectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Settings()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Contact()));
        break;
      case 2:
        Navigator.of(context)
            .push(
            MaterialPageRoute(builder: (context) => const AboutProject()));
        break;
    }
  }
}
