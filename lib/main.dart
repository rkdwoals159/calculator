import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Widget Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget {
  @override
  _WidgetExampleState createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<WidgetApp> {
  List _buttonlist = ['더하기', '빼기', '곱하기', '나누기'];
  List<DropdownMenuItem<String>> _dropDownMenuItems =
      new List.empty(growable: true);
  String? _buttonText;

  @override
  void initState() {
    super.initState();
    for (var item in _buttonlist) {
      _dropDownMenuItems.add(DropdownMenuItem(child: Text(item), value: item));
    }
    _buttonText = _dropDownMenuItems[0].value;
  }

  String sum = '';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widget Example')),
      body: Container(
          child: Center(
              child: Column(
        children: <Widget>[

          Padding(
              padding: EdgeInsets.only(top:50),
              child: Text(
                '계산기 어플',
                style: TextStyle(fontSize: 30,color: Colors.blue),
              )),

          Padding(
              padding: EdgeInsets.only(top: 30 ,left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: value1,
              )),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: value2,
              )),
          Padding(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    var value1Int = double.parse(value1.value.text);
                    var value2Int = double.parse(value2.value.text);
                    var result; //null-safety 적용대상이 아닌가요??
                    if (_buttonText == '더하기'){
                      result = value1Int + value2Int;
                    }
                    else if (_buttonText == '빼기'){
                      result = value1Int - value2Int;
                    }
                    else if (_buttonText == '곱하기'){
                      result = value1Int * value2Int;
                    }
                    else {
                      result = value1Int / value2Int;
                    }
                    sum = '$result';
                  });
                },
                child: Row(
                  children: <Widget>[Icon(Icons.add), Text(_buttonText!)],
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber)),
              )),
          Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                '결과 : $sum',
                style: TextStyle(fontSize: 30,color: Colors.green),
              )),
          Padding(
              padding: EdgeInsets.all(15),
              child: DropdownButton(
                  items: _dropDownMenuItems,
                  onChanged: (String? value) {
                    setState(() {
                      _buttonText = value;
                    });
                  },
                  value: _buttonText)),
        ],
      ))),
    );
  }
}
