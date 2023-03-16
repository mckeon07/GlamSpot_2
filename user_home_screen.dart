// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_project/constants.dart';

// class GlamSpotHomeScreen extends StatelessWidget {
//   const GlamSpotHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: customGold,
//         title: const Text('Welcome to GlamSpot!'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 200,
//               child: CarouselSlider(
//                 options: CarouselOptions(
//                   autoPlay: true,
//                   aspectRatio: 16 / 9,
//                   enlargeCenterPage: true,
//                 ),
//                 items: [
//                   Image.asset(
//                     'assets/images.makeup.jpg',
//                     fit: BoxFit.cover,
//                   ),
//                   Image.asset(
//                     'assets/gallery2.jpg',
//                     fit: BoxFit.cover,
//                   ),
//                   Image.asset(
//                     'assets/gallery3.jpg',
//                     fit: BoxFit.cover,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Latest Offers/Deals',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Image.asset(
//                     'assets/offers.jpg',
//                     height: 150,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Text(
//                     'Gallery',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   CarouselSlider(
//                     options: CarouselOptions(
//                       autoPlay: true,
//                       aspectRatio: 1,
//                       enlargeCenterPage: true,
//                     ),
//                     items: [
//                       Image.asset(
//                         'assets/gallery1.jpg',
//                         fit: BoxFit.cover,
//                       ),
//                       Image.asset(
//                         'assets/gallery2.jpg',
//                         fit: BoxFit.cover,
//                       ),
//                       Image.asset(
//                         'assets/gallery3.jpg',
//                         fit: BoxFit.cover,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Text(
//                     'Services',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       children: [
//                         ListTile(
//                           title: const Text('Haircut'),
//                           subtitle: const Text('Starting at \$25'),
//                           trailing: ElevatedButton(
//                             onPressed: () {},
//                             child: const Text('Book'),
//                           ),
//                         ),
//                         const Divider(),
//                         ListTile(
//                           title: const Text('Manicure'),
//                           subtitle: const Text('Starting at \$20'),
//                           trailing: ElevatedButton(
//                             onPressed: () {},
//                             child: const Text('Book'),
//                           ),
//                         ),
//                         const Divider(),
//                         ListTile(
//                           title: const Text('Massage'),
//                           subtitle: const Text('Starting at \$40'),
//                           trailing: ElevatedButton(
//                             onPressed: () {},
//                             child: const Text('Book'),
//                           ),
//                         ),
//                         const Divider(),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Text(
//                     'Reviews/Testimonials',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   CarouselSlider(
//                     options: CarouselOptions(
//                       autoPlay: true,
//                       aspectRatio: 1.5,
//                       enlargeCenterPage: true,
//                     ),
//                     items: [
//                       Container(
//                         padding: const EdgeInsets.all(20),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.grey[100],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Jane Doe',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             const Text(
//                               "I had an incredible experience at GlamSpot! The stylists are so friendly and knowledgeable, and they really take the time to understand what you want. I walked out feeling like a brand new person, and I can't wait to go back!",
//                             ),
//                             Container(
//                               padding: const EdgeInsets.all(20),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.grey[100],
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: const [
//                                   Text(
//                                     'John Smith',
//                                     style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(
//                                     "I've been coming to GlamSpot for years, and I have always had an amazing experience. The salon is beautiful, the stylists are talented, and the prices are reasonable. I would recommend this salon to anyone!",
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               padding: const EdgeInsets.all(20),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.grey[100],
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: const [
//                                   Text(
//                                     'Samantha Lee',
//                                     style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(
//                                     'I recently got my hair colored at GlamSpot, and I couldn\'t be happier with the results. The color is exactly what I wanted, and it has lasted beautifully. The stylists really know what they\'re doing!',
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Text(
//                         'Contact Us',
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text('Phone: 555-555-5555'),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Text('Email: info@glamspot.com'),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Text('Address: 123 Main St, Anytown, USA'),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Text(
//                         'Appointment History',
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Column(
//                           children: [
//                             ListTile(
//                               title: const Text('Fashion Design'),
//                               subtitle: const Text(
//                                   'Friday, March 12, 2023 at 10:00 AM'),
//                               trailing: ElevatedButton(
//                                 onPressed: () {},
//                                 child: const Text('Cancel'),
//                               ),
//                             ),
//                             const Divider(),
//                             ListTile(
//                               title: const Text('Manicure'),
//                               subtitle: const Text(
//                                   'Monday, March 15, 2023 at 3:00 PM'),
//                               trailing: ElevatedButton(
//                                 onPressed: () {},
//                                 child: const Text('Cancel'),
//                               ),
//                             ),
//                             const Divider(),
//                             ListTile(
//                               title: const Text('Massage'),
//                               subtitle: const Text(
//                                   'Thursday, March 18, 2023 at 2:30 PM'),
//                               trailing: ElevatedButton(
//                                 onPressed: () {},
//                                 child: const Text('Cancel'),
//                               ),
//                             ),
//                             const Divider(),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Text(
//                         'FAQ',
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         child: Column(
//                           children: const [
//                             ExpansionTile(
//                               title: Text('What are your hours?'),
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 20, vertical: 10),
//                                   child: Text(
//                                       'Our hours of operation are Monday to Friday from 9:00 AM to 8:00 PM, Saturday from 9:00 AM to 6:00 PM, and Sunday from 10:00 AM to 4:00 PM.'),
//                                 ),
//                               ],
//                             ),
//                             ExpansionTile(
//                               title: Text('Do you offer gift cards?'),
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 20, vertical: 10),
//                                   child: Text(
//                                       'Yes, we offer gift cards for any amount you choose. They can be purchased in the salon or online.'),
//                                 ),
//                               ],
//                             ),
//                             ExpansionTile(
//                               title: Text('What services do you offer?'),
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 20, vertical: 10),
//                                   child: Text(
//                                       'We offer a wide range of services including haircuts, color, highlights, manicures, pedicures, facials, massages, and more. Check out our website for a full list of services and prices.'),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Colors.pink,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.explore),
//             label: 'Explore',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_border),
//             label: 'Favorites',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Navigate to the chat screen
//         },
//         child: const Icon(Icons.chat),
//       ),
//     );
//   }
// }
