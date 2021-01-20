import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:floating_pullup_card/floating_pullup_card.dart';

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "CE") {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "⌫") {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 38.0;
        resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "Roeculator",
        ),
        elevation: 0.0,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            Container(
                child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Text(
                    equation,
                    style: TextStyle(
                        fontSize: equationFontSize, color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: Text(
                    result,
                    style: TextStyle(
                        fontSize: resultFontSize, color: Colors.white),
                  ),
                ),
              ],
            )),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                    color: Colors.white70,
                    boxShadow: [BoxShadow(color: Colors.white54, offset: Offset(0,-5), blurRadius: 6.0)]),
                child: Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * .70,
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: Table(
                          children: [
                            TableRow(children: [
                              buildButton("C", 1, Colors.redAccent),
                              buildButton("CE", 1, Colors.blue),
                              buildButton("÷", 1, Colors.blue),
                            ]),
                            TableRow(children: [
                              buildButton("7", 1, Colors.black54),
                              buildButton("8", 1, Colors.black54),
                              buildButton("9", 1, Colors.black54),
                            ]),
                            TableRow(children: [
                              buildButton("4", 1, Colors.black54),
                              buildButton("5", 1, Colors.black54),
                              buildButton("6", 1, Colors.black54),
                            ]),
                            TableRow(children: [
                              buildButton("1", 1, Colors.black54),
                              buildButton("2", 1, Colors.black54),
                              buildButton("3", 1, Colors.black54),
                            ]),
                            TableRow(children: [
                              buildButton(".", 1, Colors.black54),
                              buildButton("0", 1, Colors.black54),
                              buildButton("00", 1, Colors.black54),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: Table(
                          children: [
                            TableRow(children: [
                              buildButton("⌫", 1, Colors.blue),
                            ]),
                            TableRow(children: [
                              buildButton("×", 1, Colors.blue),
                            ]),
                            TableRow(children: [
                              buildButton("-", 1, Colors.blue),
                            ]),
                            TableRow(children: [
                              buildButton("+", 1, Colors.blue),
                            ]),
                            TableRow(children: [
                              buildButton("=", 2, Colors.redAccent),
                            ]),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: TextButton(
          style: TextButton.styleFrom(
            elevation: 10.0,
            shadowColor: Colors.black,
            backgroundColor: Colors.white70,
            shape: CircleBorder(
                side: BorderSide(color: Colors.white60, width: 1.0)),
            padding: EdgeInsets.all(16.0),
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          )),
    );
  }
}
