import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _value = false;

  bool _isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            ListTile(
              title: TextFormField(
                key: Key('myUsername'),
                validator: (value) {
                  if (value.isEmpty) return 'Username required';
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter username',
                ),
              ),
            ),
            ListTile(
              title: TextFormField(
                key: Key('myPhoneNumber'),
                validator: (value) {
                  if (value.isEmpty) return 'Phone Number required';
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter phone number',
                ),
              ),
            ),
            ListTile(
              title: Text('I agree to terms & condition'),
              trailing: Switch(
                key: Key('mySwitch'),
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
            ),
            if (_isError)
              Text(
                'Please agree to T&C',
                style: TextStyle(color: Colors.red),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      key: Key('mySubmitButton'),
                      child: Text('Submit'),
                      shape: StadiumBorder(),
                      onPressed: _submitDetails,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitDetails() {
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
  }
}
