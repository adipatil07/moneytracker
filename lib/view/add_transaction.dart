import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/toggleButton.dart';
class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  bool isIncome = false;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedCategory = 'Food and Drink';
  final categories = ['Food and Drink', 'Transport', 'Shopping', 'Bills'];

  TextEditingController amountController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Transaction"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            const IncomeExpenseToggle(),
            const SizedBox(height: 20),
            _buildDatePicker(),
            _buildTimePicker(),
            _buildTextField('Amount', amountController, TextInputType.number),
            _buildCategoryDropdown(),
            _buildTextField('Note', noteController, TextInputType.text),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save transaction logic
              },
              child: const Text('Save',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildTypeButton(String text, bool isSelected) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         isIncome = text == 'Income';
  //       });
  //     },
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //       decoration: BoxDecoration(
  //         color: isSelected ? Colors.blue : Colors.grey[300],
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       child: Text(
  //         text,
  //         style: TextStyle(
  //           color: isSelected ? Colors.white : Colors.black,
  //           fontSize: 16,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildDatePicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () => _selectDate(context),
        child: AbsorbPointer(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Date',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(Icons.calendar_today),
            ),
            controller: TextEditingController(
              text: DateFormat.yMMMMd().format(selectedDate),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimePicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () => _selectTime(context),
        child: AbsorbPointer(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Time',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(Icons.access_time),
            ),
            controller: TextEditingController(
              text: selectedTime.format(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, TextInputType keyboardType) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: 'Category',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        value: selectedCategory,
        onChanged: (newValue) {
          setState(() {
            selectedCategory = newValue.toString();
          });
        },
        items: categories.map((category) {
          return DropdownMenuItem(
            value: category,
            child: Text(category),
          );
        }).toList(),
      ),
    );
  }
}
