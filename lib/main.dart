import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayTxt = '20';

  Widget calcButton(String btnTxt, Color btnColor, Color txtColor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          calculation(btnTxt);
        },
        child: Text(
          '$btnTxt',
          style: TextStyle(
            fontSize: 35,
            color: txtColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          primary: btnColor,
          padding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  String text = '0';
  double numOne = 0;
  double numTwo = 0;
  String result = '';
  String finalResult = '';
  String opr = '';
  String preOpr = '';

  void calculation(String btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = (numOne / 100).toString();
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.contains('.')) {
        result = result + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result = result.startsWith('-') ? result.substring(1) : '-' + result;
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(String result) {
    if (result.contains('.')) {
      List<String> splitDecimal = result.split('.');
      if (int.parse(splitDecimal[1]) > 0) {
        return result;
      } else {
        return splitDecimal[0];
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Hesap Makinesi',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 243, 158, 186),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '$text',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 100,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton('AC', Colors.grey, Colors.white),
                calcButton('+/-', Colors.grey, Colors.white),
                calcButton('%', Colors.grey, Colors.white),
                calcButton(
                    '/', Color.fromARGB(255, 248, 73, 132), Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton(
                    '7', Color.fromARGB(255, 243, 158, 186), Colors.white),
                calcButton(
                    '8', Color.fromARGB(255, 243, 158, 186), Colors.white),
                calcButton(
                    '9', Color.fromARGB(255, 243, 158, 186), Colors.white),
                calcButton(
                    'x', Color.fromARGB(255, 248, 73, 132), Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton(
                    '4', Color.fromARGB(255, 243, 158, 186), Colors.white),
                calcButton(
                    '5', Color.fromARGB(255, 243, 158, 186), Colors.white),
                calcButton(
                    '6', Color.fromARGB(255, 243, 158, 186), Colors.white),
                calcButton(
                    '-', Color.fromARGB(255, 248, 73, 132), Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton(
                    '1', Color.fromARGB(255, 243, 158, 186), Colors.white),
                calcButton(
                    '2', Color.fromARGB(255, 243, 158, 186), Colors.white),
                calcButton(
                    '3', Color.fromARGB(255, 243, 158, 186), Colors.white),
                calcButton(
                    '+', Color.fromARGB(255, 248, 73, 132), Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    calculation('0');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Color.fromARGB(255, 243, 158, 186),
                    padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                  ),
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                calcButton(
                    '.', Color.fromARGB(255, 243, 158, 186), Colors.white),
                calcButton(
                    '=', Color.fromARGB(255, 248, 73, 132), Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
