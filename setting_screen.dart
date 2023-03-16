import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _ArtisanSettingsScreenState createState() => _ArtisanSettingsScreenState();
}

class _ArtisanSettingsScreenState extends State<SettingsScreen> {
  bool _emailNotifications = true;
  bool _smsNotifications = true;
  bool _pushNotifications = true;
  bool _twoFactorAuthentication = false;
  bool _visibility = true;
  bool _publicProfileInformation = true;
  bool _reviews = true;

  // Add your logout implementation here
  void _logout() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customGold,
        titleTextStyle: const TextStyle(color: Colors.black),
        title: const Text('Artisan Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          // Personal Information
          const Text(
            'Personal Information',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Phone number'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Address'),
          ),

          const SizedBox(height: 16),

          // Business Information
          const Text(
            'Business Information',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Business name'),
          ),
          TextFormField(
            decoration:
                const InputDecoration(labelText: 'Business description'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Business category'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Business location'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Business hours'),
          ),

          const SizedBox(height: 16),

          // Notification Settings
          const Text(
            'Notification Settings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SwitchListTile(
            title: const Text('Email notifications'),
            value: _emailNotifications,
            onChanged: (bool value) {
              setState(() {
                _emailNotifications = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('SMS notifications'),
            value: _smsNotifications,
            onChanged: (bool value) {
              setState(() {
                _smsNotifications = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Push notifications'),
            value: _pushNotifications,
            onChanged: (bool value) {
              setState(() {
                _pushNotifications = value;
              });
            },
          ),

          const SizedBox(height: 16),

          // Security Settings
          const Text(
            'Security Settings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: const Text('Change password'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Add your change password implementation here
            },
          ),
          SwitchListTile(
            title: const Text('Two-factor authentication'),
            value: _twoFactorAuthentication,
            onChanged: (bool value) {
              setState(() {
                _twoFactorAuthentication = value;
              });
            },
          ),

          const SizedBox(height: 16),

          // Payment Settings
          const Text(
            'Payment Settings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: const Text('Payment method'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
// Add your payment method implementation here
            },
          ),
          ListTile(
            title: const Text('Bank account details'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
// Add your bank account details implementation here
            },
          ),

          const SizedBox(height: 16),

          // Privacy Settings
          const Text(
            'Privacy Settings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SwitchListTile(
            title: const Text('Visibility'),
            value: _visibility,
            onChanged: (bool value) {
              setState(() {
                _visibility = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Public profile information'),
            value: _publicProfileInformation,
            onChanged: (bool value) {
              setState(() {
                _publicProfileInformation = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Reviews'),
            value: _reviews,
            onChanged: (bool value) {
              setState(() {
                _reviews = value;
              });
            },
          ),

          const SizedBox(height: 16),

          // Help & Support
          const Text(
            'Help & Support',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: const Text('FAQ'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Add your FAQ implementation here
            },
          ),
          ListTile(
            title: const Text('Contact support'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Add your contact support implementation here
            },
          ),

          const SizedBox(height: 32),

          // Logout button
          ElevatedButton(
            onPressed: _logout,
            child: const Text('Logout'),
          ),
        ],
      ),
      
    );
  }
}
