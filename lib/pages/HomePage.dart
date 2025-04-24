import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_apps/main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              // Show the confirmation dialog before signing out
              final shouldSignOut = await showDialog<bool>(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text('Confirm Logout'),
                      content: Text('Are you sure you want to sign out?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text('Sign Out'),
                        ),
                      ],
                    ),
              );

              // If user confirmed, log out and navigate to SplashScreen
              if (shouldSignOut == true) {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => SplashScreen()),
                  (route) => false,
                );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome, ${FirebaseAuth.instance.currentUser?.email ?? 'User'}!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
