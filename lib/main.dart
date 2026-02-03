import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _expression = '';
  String _display = '';

  void _press(String value) {
    setState(() {
      if (value == 'C') {
        _expression = '';
        _display = '';
      } else if (value == '=') {
        try {
          final exp = Expression.parse(_expression);
          final evaluator = ExpressionEvaluator();
          final result = evaluator.eval(exp, {});
          _display = '$_expression = $result';
          _expression = result.toString();
        } catch (e) {
          _display = 'Error';
          _expression = '';
        }
      } else {
        _expression += value;
        _display = _expression;
      }
    });
  }

  Widget _button(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _press(text),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ardenis Calculator')),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerRight,
            child: Text(
              _display,
              style: const TextStyle(fontSize: 24),
            ),
          ),
          Row(children: [_button('7'), _button('8'), _button('9'), _button('/')]),
          Row(children: [_button('4'), _button('5'), _button('6'), _button('*')]),
          Row(children: [_button('1'), _button('2'), _button('3'), _button('-')]),
          Row(children: [_button('0'), _button('C'), _button('='), _button('+')]),
        ],
      ),
    );
  }
}
