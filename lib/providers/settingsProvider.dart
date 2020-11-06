import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier{
  String _units;
  List<String> _flavors;

  SettingsProvider() {
    _units = 'Plain';
    _flavors = ['Chocolate', 'Strawberry'];
    loadPreferences();
  }

  // Getter

  String get units => _units;
  List<String> get flavors => _flavors;

  // Setter

  void setUnits (String units) {
    _units = units;
    notifyListeners();
    savePreferences();
  }

  void _setFlavors (List<String>flavors) {
    _flavors = flavors;
    notifyListeners();
  }

  void addFlavors (String flavors) {
    if(_flavors.contains(flavors) == false) {
      _flavors.add(flavors);
      notifyListeners();
      savePreferences();
    }
  }

  void removeFlavors (String flavors) {
    if(_flavors.contains(flavors) == true) {
      _flavors.remove(flavors);
      notifyListeners();
      savePreferences();
    }
  }
  
  savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("units", _units);
    prefs.setStringList("flavors", _flavors);
  }
  
  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String units = prefs.getString("units");
    List<String> flavors = prefs.getStringList("flavors");
    
    if(units != null) {
      return setUnits(units);
    }
    if(flavors != null) {
      return _setFlavors(flavors);
    }
  }
}