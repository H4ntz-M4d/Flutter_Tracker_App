import 'package:flutter/material.dart';
import 'package:flutter_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_tracker_app/models/expense.dart';
import 'package:flutter_tracker_app/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Hamburger',
        amount: 20.11,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Movie',
        amount: 20.11,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  // void _openAddOverlay() {
  //   showModalBottomSheet(
  //     context: context,  
  //     builder: (ctx) => const Text('Modal Bottom Sheet'));
  // }
  //   Or you can use notasion void in bellow
  

  void _openAddOverlay() {
    showModalBottomSheet(
      context: context, 
      builder: (ctx){
        return const NewExpense();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 10, 201, 160),
        title: const Text(
          'Expenses Tracker App',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: _openAddOverlay, 
            icon: const Icon(Icons.add),),
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
