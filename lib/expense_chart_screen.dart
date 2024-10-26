import 'package:expense_tracker/module/expense.dart';
import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/expense_userInput_sheet.dart';
import 'package:expense_tracker/widgets/list_of_expense.dart';
import 'package:flutter/material.dart';

class ExpenseChartScreen extends StatefulWidget {
  const ExpenseChartScreen({super.key});

  @override
  State<ExpenseChartScreen> createState() {
    return _ExpenseChartScreen();
  }
}

class _ExpenseChartScreen extends State<ExpenseChartScreen> {
  double totalTravelExpense=0.0;
  double totalLeisureExpense=0.0;
  double totalWorkExpense=0.0;
  double totalFoodExpense=0.0;
  final List<Expense> expenseList = [

  ];

   void reallocateExpenseCategory(){
     final List<ExpenseCategory> expenseCategory=[
       ExpenseCategory.forCategory(expenseList, Category.travel),
       ExpenseCategory.forCategory(expenseList,Category.leisure),
       ExpenseCategory.forCategory(expenseList, Category.work),
       ExpenseCategory.forCategory(expenseList, Category.food),
     ];
       totalTravelExpense=expenseCategory[0].totalExpense;
       totalLeisureExpense=expenseCategory[1].totalExpense;
       totalWorkExpense=expenseCategory[2].totalExpense;
       totalFoodExpense=expenseCategory[3].totalExpense;
   }


  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return ExpenseInputSheet(
            addExpense: addExpense,
          );
        });
  }

  void addExpense(Expense expense) {
    expenseList.add(expense);
    reallocateExpenseCategory();
    setState(() {});
  }

  void removeExpense(Expense expense) {
    final index = expenseList.indexOf(expense);
    setState(() {
      expenseList.remove(expense);
      reallocateExpenseCategory();
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense deleted"),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            expenseList.insert(index, expense);
            reallocateExpenseCategory();
            setState(() {});
          }),
    ));
  }

  @override
  Widget build(context) {
    Widget mainContent = const Center(child: Text("No expenses !"));
    if (expenseList.isNotEmpty) {
      mainContent = ListOfExpense(
        expenseList: expenseList,
        removeExpense: removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
           Chart(totalFoodExpense: totalFoodExpense,totalLeisureExpense: totalLeisureExpense,totalTravelExpense: totalTravelExpense,totalWorkExpense: totalWorkExpense,),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
