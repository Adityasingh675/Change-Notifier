import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:providerexmp_app/providers/settingsProvider.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Units'),
                DropdownButton<String>(
                  value: settingsProvider.units,
                  onChanged: (String value) {
                    settingsProvider.setUnits(value);
                  },
                  items: <String>['Plain', 'Mix']
                      .map<DropdownMenuItem<String>>(
                        (value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Flavors'),
                Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: [
                      FilterChip(
                          label: Text(
                            'Chocolate',
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                          selected: (settingsProvider.flavors.contains('Chocolate')) ? true : false,
                          onSelected: (bool value) {
                            if(value == true) {
                              settingsProvider.addFlavors('Chocolate');
                            } else {
                              settingsProvider.removeFlavors('Chocolate');
                            }
                          },
                      ),
                      FilterChip(
                          label: Text(
                            'Strawberry',
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                          selected: (settingsProvider.flavors.contains('Strawberry')) ? true : false,
                          onSelected: (bool value) {
                            if(value == true) {
                              settingsProvider.addFlavors('Strawberry');
                            } else {
                              settingsProvider.removeFlavors('Strawberry');
                            }
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
