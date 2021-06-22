import 'package:flutter/material.dart';


class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Homepage> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  double _meter = 0.0;
  double _result = 0.0;
  String _finalResultPrint = "";
  String _doneResult = "";

  bool _isInterstitialAdLoaded = false;


  void _clear() {
    setState(() {
      _ageController.clear();
      _weightController.clear();
      _heightController.clear();
    });
  }

  void _bmiValue() {
    setState(() {
      double age = double.parse(_ageController.text);
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text);
      height = height / 100;

      if ((_ageController.text.isNotEmpty || age > 0) &&
          ((_heightController.text.isNotEmpty || height > 0) &&
              (_weightController.text.isNotEmpty || weight > 0))) {
        _result = weight / (height * height);
      } else {
        print("Error");
      }

      if ((double.parse(_result.toStringAsFixed(1)) <= 18.9)) {
        _finalResultPrint = "You are: UnderWeight";
        print(_finalResultPrint);
      } else if (double.parse(_result.toStringAsFixed(1)) > 18.9 &&
          (double.parse(_result.toStringAsFixed(1)) <= 25.0)) {
        _finalResultPrint = "You are: Normal";
        print(_finalResultPrint);
      } else if ((double.parse(_result.toStringAsFixed(1)) > 25.0) &&
          (double.parse(_result.toStringAsFixed(1))) < 30.0) {
        _finalResultPrint = "You are: OverWeight";
        print(_finalResultPrint);
      } else if ((double.parse(_result.toStringAsFixed(1)) > 30.0) &&
          (double.parse(_result.toStringAsFixed(1))) < 40.0) {
        _finalResultPrint = "You are: Obesity";
        print(_finalResultPrint);
      } else if ((double.parse(_result.toStringAsFixed(1))) >= 40.0) {
        _finalResultPrint = "You are: Severe Obesity";
        print(_finalResultPrint);
      }
    });

    _doneResult = "Your BMI ==> ${_result.toStringAsFixed(2)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //AppBar
      appBar: new AppBar(
        title: new Text("Body Mass Index Calculator"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),

      //Body
      body: new Container(
        margin: new EdgeInsets.symmetric(horizontal: 15.0),
        child: new ListView(
          children: <Widget>[
            new Center(
              child: new Column(
                children: <Widget>[
                  new Image.asset(
                    "assets/images/screen.png",
                    width: 200.0,
                    height: 200.0,
                  ),

                  //TextField
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      filled: true,
                      hintText: "Enter an age between 1-150 years",
                      labelText: "Age",
                      icon: Icon(Icons.person),
                    ),
                  ),

                  new Container(
                    margin: new EdgeInsets.symmetric(vertical: 5.0),
                  ),

                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      filled: true,
                      hintText: "Enter a weight between 5-300 kg",
                      labelText: "Weight",
                      icon: Icon(Icons.line_weight),
                    ),
                  ),

                  new Container(
                    margin: new EdgeInsets.symmetric(vertical: 5.0),
                  ),

                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      filled: true,
                      hintText: "Enter an height between 50-250 cm",
                      labelText: "Height",
                      icon: Icon(Icons.healing),
                    ),
                  ),

                  new Padding(padding: EdgeInsets.all(5.0)),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        child: SizedBox(
                            width: 110.0,
                            height: 40.0,
                            child: new RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(color: Colors.black)),
                                color: Colors.red,
                                child: new Text(
                                  "Calculate",
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                                onPressed: () {
                                  _bmiValue();
                                 
                                })),
                      ),
                      new Container(
                        margin: new EdgeInsets.symmetric(horizontal: 5.0),
                      ),
                      new Container(
                        child: SizedBox(
                            width: 110.0,
                            height: 40.0,
                            child: new RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(color: Colors.black)),
                                color: Colors.red,
                                child: new Text(
                                  "Clear",
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                                onPressed: () {
                                  _clear();
                                })),
                      ),
                    ],
                  ),
                  new Container(
                    margin: new EdgeInsets.symmetric(vertical: 3.0),
                  ),
                  new Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.red),
                    child: new Text(
                      '$_doneResult',
                      style: new TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                  ),
                  new Container(
                    margin: new EdgeInsets.symmetric(vertical: 3.0),
                  ),
                  new Container(
                      margin: new EdgeInsets.symmetric(horizontal: 25.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.red,
                      ),
                      child: new Text(
                        "$_finalResultPrint",
                        style: new TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
