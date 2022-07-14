import 'package:shared_preferences/shared_preferences.dart';

class UserProfilePreferences {
  static late SharedPreferences _preferences;

  static const _keyUserNotes = 'notes';
 // static const _keyUserStatus = 'userStatus';

  static Future init() async =>
     _preferences = await SharedPreferences.getInstance();

  static Future setNotes(String notes) async =>
      await _preferences.setString(_keyUserNotes, notes);

  static String? getNotes() => _preferences.getString(_keyUserNotes);
/*
  static Future setUserStatus(List<String> userStatus) async =>
      await _preferences.setStringList(_keyUserStatus, userStatus);

  static List<String>? getUserStatus() => _preferences.getStringList(_keyUserStatus);
*/
}
