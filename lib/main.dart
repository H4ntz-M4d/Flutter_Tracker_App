import 'package:flutter/material.dart';
import 'package:flutter_tracker_app/widgets/expenses.dart';

void main(){
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Expenses(),
    )
  );
}