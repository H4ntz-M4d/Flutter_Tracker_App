import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense>{
  // var _enteredTitle = '';

  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker(){
    final dateNow = DateTime.now();
    final firstDate = DateTime(dateNow.year - 1, dateNow.month);
    showDatePicker(
      context: context, 
      initialDate: dateNow, 
      firstDate: firstDate, 
      lastDate: dateNow);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title')
            ),
          ),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount')
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Selected Date'),
                    IconButton(
                      onPressed: _presentDatePicker, 
                      icon: const Icon(Icons.calendar_month))
                  ],
                )
              ),
            ],
          ),
          
          Row(
            children: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: const Text('Cancel')),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                }, 
                child: const Text('Save'))
            ],
          )
        ],
      ),
    );
  }
}