import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import 'package:hfu_app2/bottomNavBar/homeV2.dart';
import 'package:hfu_app2/bottomNavBar/profile.dart';
import 'package:hfu_app2/userController/utils.dart';
import 'dropdownDir/contact.dart';
import 'dropdownDir/settings.dart';
import 'bottomNavBar/home.dart';
import 'bottomNavBar/menu.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(HfuApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class HfuApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  HfuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData.dark(),
        scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: navigatorKey,
        title: 'HFU App',
        theme: ThemeData(
          primarySwatch: Colors.green,
          brightness: Brightness.light,
          //  splashColor: Colors.black
        ),
        home: FutureBuilder(
            future: _fbApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('You have an error! ${snapshot.error.toString()}');
                return const Text('Something went wrong!');
              } else if (snapshot.hasData) {
                return HomeScreen();
              } else {
                return const Center(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(),
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
  State<StatefulWidget> createState() => _HfuApp();
}

class _HfuApp extends State<HomeScreen> {
  int _selectedIndex = 1;
  static final List<Widget> _pages = <Widget>[Profile(), Home(), Menu()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: NewGradientAppBar(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [
            0.3,
            0.4,
            1
          ],
          colors: [
            Colors.green.shade600,
            Colors.lightGreen.shade500,
            Colors.white30,
          ]
        ),
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
                            MaterialPageRoute(builder: (context) => Contact())),
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
            .push(MaterialPageRoute(builder: (context) => Contact()));
        break;
    }
  }
}
