import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_tracker_app/models/expense.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>{
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Hamburger',
      amount: 20.11,
      date: DateTime.now(),
      category: Category.food
    ),
    Expense(
      title: 'Movie',
      amount: 20.11,
      date: DateTime.now(),
      category: Category.leisure
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
            child:  ExpensesList(expenses: _registeredExpenses)),
        ],

      ),
    );
  }
}