import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/calculator_view_model.dart';

class CalculatorScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CalculatorViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('String Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter numbers',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                viewModel.calculate(_controller.text);
              },
              child: Text('Calculate'),
            ),
            ElevatedButton(
              onPressed: () {
                _controller.clear();
                viewModel.clear();
              },
              child: Text('Clear'),
            ),
            SizedBox(height: 20),
            if (viewModel.result.isNotEmpty)
              Text(viewModel.result, style: TextStyle(fontSize: 18)),
            if (viewModel.error.isNotEmpty)
              Text(viewModel.error, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
