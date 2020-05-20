import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _value = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ListTile(
                title: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) return 'Username required';
                    return null;
                  },
                  key: Key('myUsername'),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter username',
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) return 'Phone number required';
                    return null;
                  },
                  key: Key('myPhoneNumber'),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter phone number',
                  ),
                ),
              ),
              ListTile(
                title: Text('Terms & Conditions'),
                trailing: Switch(
                  key: Key('mySwitch'),
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  value: _value,
                ),
              ),
              if (_isError)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Please agree to T&C',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        key: Key('mySubmitButton'),
                        onPressed: () {
                          setState(() {
                            _isError = false;
                          });
                          if (!_formKey.currentState.validate()) return;
                          if (!_value) {
                            setState(() {
                              _isError = true;
                            });
                            return;
                          }
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Success'),
                              content: Text('Registration successful'),
                              actions: [
                                FlatButton(
                                  key: Key('myOkayButton'),
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ),
                          );
                        },
                        child: Text('Submit'),
                        shape: StadiumBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
