import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<double> expense;
  final List<String> weekLabels = const [
    'Su',
    'Mo',
    'Tu',
    'we',
    'Th',
    'Fr',
    'Sa',
  ];

  const HomeScreen({Key? key, required this.expense}) : super(key: key);

  List<Widget> _buildWeekSpendingList() {
    double mostExpensive = expense.max;

    List<Widget> weeklySpendingList = [];
    for (int i = 0; i < expense.length; i++) {
      weeklySpendingList.add(
        Bar(
          label: weekLabels[i],
          amountSpent: expense[i],
          mostExpensive: mostExpensive,
        ),
      );
    }
    return weeklySpendingList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ))
        ],
        title: const Text(
          'Simple Budget',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Text(
                "Weekly Spending",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 1.2),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Text(
                    "Jun 05, 2023 - Jun 11, 2023",
                    style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600, letterSpacing: 1.2),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: _buildWeekSpendingList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;
  final double _maxBarHeight = 150.0;

  const Bar({
    Key? key,
    this.label = '',
    this.amountSpent = 0.0,
    this.mostExpensive = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: [
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Container(
          height: barHeight,
          width: 18.0,
          decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(6.0)),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(label,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ))
      ],
    );
  }
}
