import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  TextEditingController textEditingController = TextEditingController();
  String? cityName;
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: textEditingController,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: kTextFieldInputDecoration,
                    onChanged: (value) {
                      // print('onChanged: $value');
                      cityName = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is not empty";
                      }
                      return null;
                    },
                    // onSubmitted: (value) {
                    //   print('onSubmitted: $value');
                    // },
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // print('${textEditingController.text}');
                    Navigator.pop(context, cityName);
                  }

                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
