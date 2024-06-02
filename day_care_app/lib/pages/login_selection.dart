import 'package:flutter/material.dart';

class LoginSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg_cover.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.child_care,
                  size: 100,
                  color: Colors.blueAccent,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Day Care App',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent, 
                  ),
                ),
                SizedBox(height: 40.0),
                _buildElevatedButton(context, 'Caregiver'),
                SizedBox(height: 20.0),
                _buildElevatedButton(context, 'Parents'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context, String userType) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 500),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (BuildContext context, double value, Widget? child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shadowColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                userType,
                style: TextStyle(
                  color: Colors.white, 
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login', arguments: userType);
              },
            ),
          ),
        );
      },
    );
  }
}
