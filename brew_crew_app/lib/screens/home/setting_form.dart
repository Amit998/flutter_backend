import 'package:async/async.dart';
import 'package:brew_crew_app/models/user.dart';
import 'package:brew_crew_app/services/database.dart';
import 'package:brew_crew_app/shared/constants.dart';
import 'package:brew_crew_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userDate,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData _userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Update Your Brew Settings',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: _userData.name,
                    decoration: textInputDecoration,
                    validator: (val) => val.isEmpty ? 'Enter An Name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  // dropdown
                  DropdownButtonFormField(
                    decoration: textInputDecoration,
                    value: _currentSugars ?? _userData.sugars,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text('$sugar Sugars'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(()=> _currentSugars = val)
                  ),
                  // slider
                  Slider(
                    value: (_currentStrength ?? _userData.strength).toDouble(),
                    min: 100.0,
                    max: 900.0,
                    activeColor:
                        Colors.brown[_currentStrength ?? _userData.strength],
                    inactiveColor:
                        Colors.brown[_currentStrength ?? _userData.strength],
                    divisions: 8,
                    onChanged: (value) =>
                        setState(() => _currentStrength = value.round()),
                  ),
                  RaisedButton(
                    color: Colors.brown[400],
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        await DatabaseService(uid: user.uid).updateUserData(
                            _currentSugars ?? _userData.sugars,
                            _currentName ?? _userData.name,
                            _currentStrength ?? _userData.strength);
                        Navigator.pop(context);
                      }
                      ;
                    },
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
