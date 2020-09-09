import 'package:coffee_team/sharedData/contants.dart';
import 'package:flutter/material.dart';

class BottomSettings extends StatefulWidget {
  @override
  _BottomSettingsState createState() => _BottomSettingsState();
}

class _BottomSettingsState extends State<BottomSettings> {
  final _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0','1','2','3','4'];

  String _currentUserName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            Text(
              'update your profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                wordSpacing: 2.0,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: textInputDecoration,
              validator: (val) => val.isEmpty ? 'Enter an email' : null,
              onChanged: (val) => setState(() => _currentUserName = val),
            ),
            SizedBox(height: 20.0),
            DropdownButtonFormField(
              decoration: textInputDecoration,
              value: _currentSugars ?? '0',
                items: sugars.map((sugar) {
                  return DropdownMenuItem(
                    value: sugar,
                    child: Text('$sugar sugars'),
                  );
                }).toList(),
              onChanged: (val) => setState(() => _currentSugars = val),
            ),
            SizedBox(height: 20.0),
            Slider(
              value: (_currentStrength ?? 100).toDouble(),
              min: 100.0,
              max: 900.0,
              divisions: 8,
              onChanged: (val) => setState(() => _currentStrength = val.round()),
              activeColor: Colors.brown[_currentStrength],
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              onPressed: () {
                print(_currentUserName);
                print(_currentSugars);
                print(_currentStrength);
              },
              color: Colors.brown[400],
              child: Text(
                'update',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
