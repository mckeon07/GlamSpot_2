import 'package:flutter/material.dart';

class GlamSpotBookingScreen extends StatefulWidget {
  const GlamSpotBookingScreen({
    required this.services,
    Key? key,
    required DateTime date,
    required String service,
    required double price,
  }) : super(key: key);

  final List<Service> services;

  @override
  _GlamSpotBookingScreenState createState() => _GlamSpotBookingScreenState();
}

class _GlamSpotBookingScreenState extends State<GlamSpotBookingScreen> {
  late DateTime _selectedDateTime;

  List<Service> _selectedServices = [];

  String? _notes;

  bool _isPaymentComplete = false;

  void _selectDateTime(DateTime dateTime) {
    setState(() {
      _selectedDateTime = dateTime;
    });
  }

  void _toggleService(Service service) {
    setState(() {
      if (_selectedServices.contains(service)) {
        _selectedServices.remove(service);
      } else {
        _selectedServices.add(service);
      }
    });
  }

  void _setNotes(String? notes) {
    setState(() {
      _notes = notes;
    });
  }

  void _completePayment() {
    // Implement payment processing here
    setState(() {
      _isPaymentComplete = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedDateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Services'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Services:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: widget.services.length,
                itemBuilder: (BuildContext context, int index) {
                  final Service service = widget.services[index];
                  return ListTile(
                    title: Text(service.name),
                    subtitle: Text('\$${service.price}'),
                    trailing: Checkbox(
                      value: _selectedServices.contains(service),
                      onChanged: (bool? value) {
                        _toggleService(service);
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Select Date and Time:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today),
                const SizedBox(width: 8),
                Text(
                  '${_selectedDateTime.day}/${_selectedDateTime.month}/${_selectedDateTime.year}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: _selectedDateTime,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    ).then((date) {
                      if (date != null) {
                        _selectDateTime(DateTime(
                          date.year,
                          date.month,
                          date.day,
                          _selectedDateTime.hour,
                          _selectedDateTime.minute,
                        ));
                      }
                    });
                  },
                  child: const Text(
                    'Change Date',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${_selectedDateTime.hour}:${_selectedDateTime.minute}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
                    ).then((time) {
                      if (time != null) {
                        _selectDateTime(DateTime(
                          _selectedDateTime.year,
                          _selectedDateTime.month,
                          _selectedDateTime.day,
                          time.hour,
                          time.minute,
                        ));
                      }
                    });
                  },
                  child: const Text(
                    'Change Time',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Add Notes (Optional):',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              onChanged: _setNotes,
              decoration: const InputDecoration(
                hintText: 'Enter any additional notes here...',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isPaymentComplete ? null : _completePayment,
              child: _isPaymentComplete
                  ? const Text('Payment Complete!')
                  : const Text('Complete Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

class Service {
  Service({
    required this.name,
    required this.price,
  });

  final String name;
  final double price;
}
