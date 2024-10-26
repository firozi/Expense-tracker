import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/module/expense.dart';

class ExpenseInputSheet extends StatefulWidget {
  const ExpenseInputSheet({super.key,required this.addExpense});
  final void Function(Expense expense) addExpense;

  @override
  State<ExpenseInputSheet> createState() {
    return _ExpenseInputSheet();
  }
}

class _ExpenseInputSheet extends State<ExpenseInputSheet> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  Category selectedCategory = Category.leisure;
  DateTime? selectedDate;

  final dateFormatter = DateFormat.yMd();


  void TappedOnCalender() async {
    final date = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime(2050));
    selectedDate = date;
    setState(() {});
  }

  void TappedOnSave() {
    final amount = double.tryParse(amountController.text);
    final amoutIsValid = amount == null || amount <= 0;
    if (titleController.text
        .trim()
        .isEmpty || amoutIsValid || selectedDate == null) {
      showDialog(context: context,
          builder: (context) => AlertDialog(
            title: Text('Invalid input'),
            content: Text("Make sure a valid title,amount,date was entered..."),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Okay'))
            ],
          )
      );
      return;
    }
    widget.addExpense(Expense(title: titleController.text, amount: amount, date: selectedDate!, category: selectedCategory));
    Navigator.pop(context);

  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    bool isDrak=Theme.of(context).brightness==Brightness.dark;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0,50,20,20),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            controller: titleController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
            style: TextStyle(
              color:isDrak?Colors.cyan:Colors.black
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text('Amount'),
                  ),
                  style: TextStyle(
                      color:isDrak?Colors.cyan:Colors.black
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(selectedDate == null
                        ? "No date selected"
                        : dateFormatter.format(selectedDate!),style: Theme.of(context).textTheme.titleLarge,),
                    IconButton(
                        onPressed: TappedOnCalender,
                        icon:  Icon(Icons.calendar_month ,color: Theme.of(context).brightness==Brightness.dark? Colors.cyan :Colors.black,),)
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton(
                  style: TextStyle(
                      color:isDrak?Colors.cyan:Colors.black
                  ),
                  value: selectedCategory,
                  items: Category.values.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category.name.toUpperCase()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedCategory = value!;
                    setState(() {});
                  }),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(onPressed:TappedOnSave, child: const Text('Save expense')),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
