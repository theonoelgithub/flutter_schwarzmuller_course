import 'package:flutter/material.dart';

import './products.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String _loginValue = "";
  String _passwordValue = "";
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Please authenticate'),
        ),
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) {
                  setState(() {
                    _loginValue = value;
                  }
                );
              }),
              TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                maxLines: 4,
                onChanged: (String value) {
                  setState(() {
                    _passwordValue = value;
                  }
                );
              }),
              SwitchListTile(
                value: _acceptTerms,
                onChanged: (bool value) {
                  setState(() {
                    _acceptTerms = value;
                  });
                },
                title: Text('Accept Terms'),
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                child: Text('Log in'),
                onPressed: () {
                  print(_loginValue);
                  print(_passwordValue);
                  Navigator.pushReplacementNamed(context, '/products');
                  },
              )
            ],
          ),
        )
      );
  }
}