import 'package:flutter/material.dart';
import 'package:flutter_project/client_screens/user_booking_screen.dart';

class GlamSpotConfirmationScreen extends StatelessWidget {
  const GlamSpotConfirmationScreen({
    Key? key,
    required this.selectedDateTime,
    required this.selectedServices,
    required this.notes,
  }) : super(key: key);

  final DateTime selectedDateTime;
  final List<Service> selectedServices;
  final String? notes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Confirmation',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Selected Services:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: selectedServices.map((service) {
                return Text('- ${service.name} (\$${service.price})');
              }).toList(),
            ),
            const SizedBox(height: 8),
            const Text(
              'Selected Date and Time:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${selectedDateTime.day}/${selectedDateTime.month}/${selectedDateTime.year} at ${selectedDateTime.hour}:${selectedDateTime.minute.toString().padLeft(2, '0')}',
            ),
            const SizedBox(height: 8),
            const Text(
              'Notes:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(notes ?? 'None'),
          ],
        ),
      ),
    );
  }
}
