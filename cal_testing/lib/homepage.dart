import 'package:flutter/material.dart';
import './operation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double result = 0;

  final _fomkey = GlobalKey<FormState>();
  final _firstController = TextEditingController();
  final _secondController = TextEditingController();

  // use to update the addition result

  void refreshCal() {
    _firstController.clear();
    _secondController.clear();
    setState(() {
      result = 0.0;
    });
  }

  void addResult() {
    setState(() {
      result = Operation.add(double.parse(_firstController.text),
          double.parse(_secondController.text));
    });
  }

  void divResult() {
    setState(() {
      result = Operation.div(double.parse(_firstController.text),
          double.parse(_secondController.text));
    });
  }

  void mulResult() {
    setState(() {
      result = Operation.mul(double.parse(_firstController.text),
          double.parse(_secondController.text));
    });
    // dispose();
  }

  // used to update the subraction result
  void subResult() {
    setState(() {
      result = Operation.sub(double.parse(_firstController.text),
          double.parse(_secondController.text));
    });
    // dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Floating Calculator'),
      ),
      body: Form(
        key: _fomkey,
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 100),
          elevation: 6,
          child: Container(
            height: 200,
            decoration: BoxDecoration(border: Border.all(width: 2)),
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Enter first number',
                    // prefixIcon: Icon(Icons.num),
                  ),
                  keyboardType: TextInputType.number,
                  controller: _firstController,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Enter second number',
                  ),
                  keyboardType: TextInputType.number,
                  controller: _secondController,
                ),
                // ElevatedButton(
                //   onPressed: addResult,
                //   child: const Text('Add'),
                // ),
                // ElevatedButton(
                //   onPressed: subResult,
                //   child: const Text('Subtract'),
                // ),
                Card(
                    margin: const EdgeInsets.all(5),
                    elevation: 5,
                    child: result < 0 || result > 0
                        ? Text(
                            'Recent Calculation Result: ${result.toString()}')
                        : const Text(
                            "Enter the numbers and choose operation!!")),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: addResult,
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: mulResult,
            child: const Text("*",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          FloatingActionButton(
            onPressed: refreshCal,
            child: const Icon(Icons.refresh),
          ),
          FloatingActionButton(
            onPressed: divResult,
            child: const Text("/",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          FloatingActionButton(
            onPressed: subResult,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
