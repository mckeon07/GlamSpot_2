import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'portfolio_screen.dart';
import 'package:flutter_project/constants.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  // variable to store the user's profile picture
  File? _image;

  // function to select an image from the device gallery
  Future<void> _getImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  // list of available artisan services
  final List<String> _services = [
    "Hairstylist",
    "Make-up Artist",
    "Nail Treatment",
    "Fashion Designer",
    "Photographer",
    "Massage Therapist",
  ];

  // variable to store the selected artisan service
  String? _selectedService;

  Widget _buildProfileImage() {
    // function to display the profile image and select a new image
    return GestureDetector(
      onTap: _getImage,
      child: Container(
        width: double.infinity,
        height: 200.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: _image == null
              ? const DecorationImage(
                  image: AssetImage('assets/images/book.jpg'),
                  fit: BoxFit.cover,
                )
              : DecorationImage(
                  image: FileImage(_image!),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  // function to build a text form field with a label, max length and max lines
  Widget _buildTextFormField(
      {required String labelText, int? maxLength, int? maxLines}) {
    return SizedBox(
      height: 64.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
        maxLength: maxLength,
        maxLines: maxLines,
      ),
    );
  }

// function to build the section for social media links
  Widget _buildSocialMediaLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Social Media Links:',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        _buildTextFormField(labelText: 'Facebook'),
        const SizedBox(height: 8.0),
        _buildTextFormField(labelText: 'Twitter'),
        const SizedBox(height: 8.0),
        _buildTextFormField(labelText: 'Instagram'),
      ],
    );
  }

// function to build the section for selecting the artisan type
  Widget _buildArtisanType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Artisan Type:',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        DropdownButtonFormField<String>(
          value: _selectedService,
          onChanged: (newValue) {
            setState(() {
              _selectedService = newValue;
            });
          },
          items: _services.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Select Artisan Type',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customGold,
        title: const Text('Create Your Profile',
            style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile Picture:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            _buildProfileImage(),
            const SizedBox(height: 16.0),
            _buildTextFormField(labelText: 'Full Name', maxLength: 50),
            const SizedBox(height: 16.0),
            _buildTextFormField(labelText: 'Email', maxLength: 50),
            const SizedBox(height: 16.0),
            _buildTextFormField(labelText: 'Phone Number', maxLength: 15),
            const SizedBox(height: 16.0),
            const SizedBox(height: 16.0),
            _buildTextFormField(labelText: 'Location'),
            const SizedBox(height: 16.0),
            _buildTextFormField(
              labelText: 'About Me',
              maxLength: 200,
              maxLines: 3,
            ),
            const SizedBox(height: 16.0),
            _buildSocialMediaLinks(),
            const SizedBox(height: 16.0),
            _buildArtisanType(),
            const SizedBox(height: 32.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: customGold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PortfolioScreen(),
                  ),
                );
              },
              child: const Text('Create Profile',
                  style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
