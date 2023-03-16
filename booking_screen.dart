import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_project/constants.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  _ArtisanBookingScreenState createState() => _ArtisanBookingScreenState();
}

class _ArtisanBookingScreenState extends State<BookingScreen> {
  // Define variables to store data
  List<String> services = [
    "Hair Styling - 60 min - \$80",
    "Makeup - 90 min - \$120",
    "Nail Art - 45 min - \$60",
    "Fashion Design - 120 min - \$200",
    "Photography - 180 min - \$300"
  ];
  List<DateTime> availableDates = [];
  List<Appointment> appointments = [];
  List<Client> clients = [];
  bool isLoading = true;

  String? serviceName;
  double? servicePrice;

  @override
  void initState() {
    super.initState();
    // Load data from database or network
    loadData();
  }

  void loadData() async {
    // Load services, availability, appointments, clients from database or network
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customGold,
        titleTextStyle: const TextStyle(color: Colors.black),
        title: const Text("Booking and Scheduling"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: const [
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage('assets/images/some.jpg'),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Fredricka Yeboah",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Calendar view
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CalendarCarousel(
                      onDayPressed: (DateTime date, List events) {
                        // Handle calendar day press
                      },
                      weekendTextStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      thisMonthDayBorderColor: Colors.grey,
                      height: 420.0,
                      daysHaveCircularBorder: false,
                    ),
                  ),
                  // Service selection
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Services",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: "                          Service",
                            border: OutlineInputBorder(),
                          ),
                          value: serviceName,
                          items: services
                              .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (String? value) {
                            setState(() {
                              // Update selected service
                              serviceName = value;
                              // Parse service price from selected service
                              final regex = RegExp(r'\$([0-9]+)');
                              final match = regex.firstMatch(value!);
                              if (match != null) {
                                servicePrice = double.parse(match.group(1)!);
                              }
                            });
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        // Selected service and price display
                        serviceName == null
                            ? const SizedBox.shrink()
                            : Text(
                                "Selected service: $serviceName\nPrice: \$${servicePrice!.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ],
                    ),
                  ),
                  // Appointment time slots
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Available appointment times",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        availableDates.isEmpty
                            ? const Text(
                                "No available dates",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )
                            : Column(
                                children: availableDates
                                    .map((date) => ElevatedButton(
                                          onPressed: () {
                                            // Handle appointment time slot press
                                          },
                                          child: Text(date.toString()),
                                        ))
                                    .toList(),
                              ),
                      ],
                    ),
                  ),
                  // Client information
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Client information",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Phone number",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Submit button
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle submit button press
                      },
                      child: const Text("Book appointment"),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class Appointment {
  DateTime time;
  String service;
  double price;
  Client client;

  Appointment({
    required this.time,
    required this.service,
    required this.price,
    required this.client,
  });
}

class Client {
  String name;
  String email;
  String phoneNumber;

  Client({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
}
