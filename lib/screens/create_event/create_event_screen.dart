import 'package:flutter/material.dart';
import 'package:event_management_app/core/widgets/custom_button.dart';
import 'package:event_management_app/core/widgets/custom_textfield.dart';
import 'package:event_management_app/core/widgets/image_placeholder.dart';
import 'package:event_management_app/screens/vote/vote_screen.dart';
import 'package:intl/intl.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        timeController.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Create Event",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const CustomTextField(
                      label: "Title",
                      hintText: "Made in Melanin! Black History Month Social",
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: "Date",
                            hintText: "24/2/2024",
                            suffixIcon: Icons.calendar_today_outlined,
                            controller: dateController,
                            readOnly: true,
                            onTap: () => _selectDate(context),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: CustomTextField(
                            label: "Time",
                            hintText: "12:00 PM",
                            suffixIcon: Icons.access_time_outlined,
                            controller: timeController,
                            readOnly: true,
                            onTap: () => _selectTime(context),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const CustomTextField(
                      label: "Location",
                      hintText: "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                    ),
                    const SizedBox(height: 20),
                    const CustomTextField(
                      label: "Event Detail",
                      hintText:
                          "Lorem ipsum dolor sit amet consectetur. Lectus viverra fermentum natoque nibh enim aliquam tincidunt eu purus. Non habitasse sed feugiat aliquet lorem dui. Sodales volutpat maecenas et quisque nibh ultrices in nulla. Enim fames quam turpis pellentesque vivamus massa.Lorem ipsum dolor sit amet consectetur. Sed volutpat euismod enim accumsan",
                      isMultiline: true,
                      maxLines: 8,
                    ),
                    const SizedBox(height: 20),
                    const ImagePlaceholder(label: "Upload Image"),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustomButton(
                text: "Create Event",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VoteScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
