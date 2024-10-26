import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/module/expense.dart';
import 'package:expense_tracker/widgets/bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
   Chart({super.key,required this.totalFoodExpense,required this.totalLeisureExpense,required this.totalTravelExpense,required this.totalWorkExpense});
  final double totalTravelExpense;
  final double totalLeisureExpense;
  final double totalWorkExpense;
  final double totalFoodExpense;


  @override
  Widget build(BuildContext context) {
    bool isDark=Theme.of(context).brightness==Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      margin: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: isDark? Theme.of(context).colorScheme.primaryContainer:Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10)
      ),
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Bar(height: totalWorkExpense,icon:Icons.work),
          Bar(height: totalLeisureExpense,icon: Icons.movie,),
          Bar(height: totalFoodExpense,icon:Icons.lunch_dining),
          Bar(height: totalTravelExpense,icon: Icons.flight_takeoff,),
        ],
      ),
    );
  }
}
