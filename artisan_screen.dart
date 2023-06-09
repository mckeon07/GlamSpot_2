import 'package:flutter/material.dart';
import 'package:flutter_project/artisan_user/artisan_login_screen.dart';
import 'package:flutter_project/constants.dart';
import 'registration_screen.dart';

class ArtisanScreen extends StatelessWidget {
  const ArtisanScreen({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customGold,
        title: const Text('Artisan'),
        titleTextStyle: const TextStyle(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 50),
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Welcome to GlamSpot! Showcase your work to the world. Are you a hair stylist, fashion designer or photographer? Register as an artisan and create your portfolio now. Already have an account? Log in now.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    //Navigate to registration screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: customGold,
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ArtisanLoginScreen()));
                    //Navigate to login screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    textStyle: const TextStyle(color: Colors.white),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
