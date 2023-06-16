import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static SharedPreferences? _prefs;

  static Future<bool> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs != null;
  }

  static const String _kLocationKey = 'location';

  // location
  static Future<bool> storeLocation({required String location}) async =>
      _prefs!.setString(_kLocationKey, location);
  static Future<String?> getLocation() async =>
      _prefs!.getString(_kLocationKey);
  static Future<bool> removeLocation() async => _prefs!.remove(_kLocationKey);
}
