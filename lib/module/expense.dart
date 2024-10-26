import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category { travel, food, leisure, work }

const categoryIcons = {
  Category.travel: Icons.flight_takeoff,
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseCategory {
  ExpenseCategory({required this.expenses, required this.category});

  ExpenseCategory.forCategory(List<Expense> allExpense, this.category)
      : expenses = allExpense
            .where((expense) => expense.category == category)
            .toList();

  List<Expense> expenses;
  final Category category;

  double get totalExpense{
    double sum=0;
    for(int i=0;i<expenses.length;i++){
      sum=sum+expenses[i].amount;
    }
    return sum;
  }
}
