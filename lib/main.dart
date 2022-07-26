import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'package:hfu_app2/bottomNavBar/profile.dart';
import 'package:hfu_app2/userController/userprofile_preferences.dart';
import 'package:hfu_app2/userController/utils.dart';
import 'package:hfu_app2/widgets/appbar_widget.dart';
import 'appbar/settings_page.dart';
import 'bottomNavBar/home.dart';
import 'bottomNavBar/menu.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Settings.init(cacheProvider: SharePreferenceCache());
  await UserProfilePreferences.init();

  runApp(HfuApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class HfuApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  HfuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appName = 'HFU App';

    return ValueChangeObserver<bool>(
      cacheKey: SettingsPage.keyDarkMode,
      defaultValue: true,
      builder: (_,isDarkMode,__) => MaterialApp(
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: Utils.messengerKey,
          navigatorKey: navigatorKey,
          title: appName,
          theme: isDarkMode
          ? ThemeData(
            colorSchemeSeed: Colors.green.shade800,
            brightness: Brightness.dark,
            useMaterial3: true,

          )
          : ThemeData(
            colorSchemeSeed: Colors.green.shade800,
            brightness: Brightness.light,
            useMaterial3: true,
          ),
          home: FutureBuilder(
              future: _fbApp,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  if (kDebugMode) {
                    print('You have an error! ${snapshot.error.toString()}');
                  }
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
      ),
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
  static final List<Widget> _pages = <Widget>[const Profile(), const Home(), const Menu()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomMainAppBar(pageTitle: 'HFU Mobile', ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        backgroundColor: Colors.transparent,
        color: Theme.of(context).colorScheme.background.withAlpha(200),
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
