import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCQ Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MCQForm(),
    );
  }
}

class MCQForm extends StatefulWidget {
  @override
  _MCQFormState createState() => _MCQFormState();
}

class _MCQFormState extends State<MCQForm> {
  final _questionController = TextEditingController();
  final _optionAController = TextEditingController();
  final _optionBController = TextEditingController();
  final _optionCController = TextEditingController();
  final _optionDController = TextEditingController();
  String _correctAnswer = 'A';
  String _latex = '';

  void _submit() {
    // Handle form submission and backend integration
    // For example, call an API to save the MCQ
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add/Edit MCQ'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _questionController,
              decoration: InputDecoration(labelText: 'Question'),
            ),
            TextField(
              controller: _optionAController,
              decoration: InputDecoration(labelText: 'Option A'),
            ),
            TextField(
              controller: _optionBController,
              decoration: InputDecoration(labelText: 'Option B'),
            ),
            TextField(
              controller: _optionCController,
              decoration: InputDecoration(labelText: 'Option C'),
            ),
            TextField(
              controller: _optionDController,
              decoration: InputDecoration(labelText: 'Option D'),
            ),
            DropdownButton<String>(
              value: _correctAnswer,
              onChanged: (String? newValue) {
                setState(() {
                  _correctAnswer = newValue!;
                });
              },
              items: <String>['A', 'B', 'C', 'D']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text('Correct Answer: $value'),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            Text('LaTeX Preview:'),
            Math.tex(
              r' \text{Your LaTeX Code Here} ',
              textStyle: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
