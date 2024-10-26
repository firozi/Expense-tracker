import 'package:expense_tracker/module/expense.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
class ExpenseCard extends StatelessWidget {
  const ExpenseCard(this.expense,{super.key});
 final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title),
            Row(
              children:[
                Text(expense.amount.toStringAsFixed(2)),
                const Spacer(),
                Row(
                  children: [
                   Icon(categoryIcons[expense.category]),
                    const SizedBox(width:10),
                    Text(expense.formattedDate)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
