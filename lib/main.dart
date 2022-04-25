import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hfu_app2/userController/authPage.dart';
import 'package:hfu_app2/userController/utils.dart';


import 'dropdownDir/contact.dart';
import 'dropdownDir/settings.dart';
import 'home.dart';
import 'menu.dart';
import 'userController/utils.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(HfuApp());
}

final messengerKey = GlobalKey<ScaffoldMessengerState>();
final navigatorKey = GlobalKey<NavigatorState>();

class HfuApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  HfuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
      //  scaffoldMessengerKey: Utils.messengerKey,
        title: 'HFU App',
        theme: ThemeData(
          primarySwatch: Colors.green,
          //  splashColor: Colors.black
        ),
        home: FutureBuilder(
            future: _fbApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('You have an error! ${snapshot.error.toString()}');
                return Text('Something went wrong!');
              } else if (snapshot.hasData) {
                return HomeScreen();
              } else {
                return Center(
                    child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ));
              }
            }));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HfuApp();
}

class _HfuApp extends State<HomeScreen> {
  int _selectedIndex = 1;
  static final List<Widget> _pages = <Widget>[AuthPage(), Home(), Menu()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  )),
            ],
            onSelected: (item) => _selectedItem(context, item),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
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
