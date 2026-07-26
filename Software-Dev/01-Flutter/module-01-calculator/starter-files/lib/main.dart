import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String _display = '0';
  String _previousValue = '';
  String _operator = '';
  bool _resetDisplay = false;

  void _inputDigit(String digit) {
    setState(() {
      if (_resetDisplay) {
        _display = digit;
        _resetDisplay = false;
      } else {
        _display = _display == '0' ? digit : _display + digit;
      }
    });
  }

  void _inputDecimal() {
    setState(() {
      if (_resetDisplay) {
        _display = '0.';
        _resetDisplay = false;
      } else if (!_display.contains('.')) {
        _display += '.';
      }
    });
  }

  void _inputOperator(String op) {
    setState(() {
      _previousValue = _display;
      _operator = op;
      _resetDisplay = true;
    });
  }

  void _calculate() {
    setState(() {
      final double prev = double.parse(_previousValue);
      final double current = double.parse(_display);
      double result = 0;

      switch (_operator) {
        case '+':
          result = prev + current;
          break;
        case '-':
          result = prev - current;
          break;
        case '*':
          result = prev * current;
          break;
        case '/':
          if (current == 0) {
            _display = 'Error';
            _previousValue = '';
            _operator = '';
            _resetDisplay = true;
            return;
          }
          result = prev / current;
          break;
        default:
          result = current;
      }

      _display = result.toStringAsFixed(result.truncate() == result ? 0 : 2);
      _previousValue = '';
      _operator = '';
      _resetDisplay = true;
    });
  }

  void _clear() {
    setState(() {
      _display = '0';
      _previousValue = '';
      _operator = '';
      _resetDisplay = false;
    });
  }

  Widget _buildButton(String text, VoidCallback onTap, {Color? color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[850],
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text(
                _display,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    _buildButton('C', _clear, color: Colors.red),
                    _buildButton('(', () {}),
                    _buildButton(')', () {}),
                    _buildButton('/', _inputOperator.bind('/'), color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('7', () => _inputDigit('7')),
                    _buildButton('8', () => _inputDigit('8')),
                    _buildButton('9', () => _inputDigit('9')),
                    _buildButton('*', _inputOperator.bind('*'), color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('4', () => _inputDigit('4')),
                    _buildButton('5', () => _inputDigit('5')),
                    _buildButton('6', () => _inputDigit('6')),
                    _buildButton('-', _inputOperator.bind('-'), color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('1', () => _inputDigit('1')),
                    _buildButton('2', () => _inputDigit('2')),
                    _buildButton('3', () => _inputDigit('3')),
                    _buildButton('+', _inputOperator.bind('+'), color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('0', () => _inputDigit('0')),
                    _buildButton('.', _inputDecimal),
                    _buildButton('=', _calculate, color: Colors.blue),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}