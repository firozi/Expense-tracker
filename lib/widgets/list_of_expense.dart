import 'package:expense_tracker/module/expense.dart';
import 'package:expense_tracker/widgets/expense_card.dart';
import 'package:flutter/material.dart';

class ListOfExpense extends StatelessWidget {
  const ListOfExpense({super.key, required this.expenseList,required this.removeExpense});
  final void Function(Expense expense) removeExpense;

  final List<Expense> expenseList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenseList.length,
        itemBuilder: (context, index) => Dismissible(
            key: ValueKey(expenseList[index]),
            onDismissed: (direction)=>removeExpense(expenseList[index]),
            child: ExpenseCard(expenseList[index])));
  }
}
