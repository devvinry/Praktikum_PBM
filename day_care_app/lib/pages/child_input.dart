import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'child_activities.dart'; // Import the ChildActivitiesPage

class ChildInputPage extends StatefulWidget {
  @override
  _ChildInputPageState createState() => _ChildInputPageState();
}

class _ChildInputPageState extends State<ChildInputPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String age = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the background behind the app bar
      appBar: AppBar(
        title: Text('Input Data Anak'),
        backgroundColor: Colors.transparent, // Set app bar background to transparent
        elevation: 0, // Remove app bar shadow
      ),
      backgroundColor: Colors.transparent, // Set scaffold background to transparent
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg_child_input.jpg"), 
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.babyCarriage,
                      size: 100,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Input Data Anak',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Nama Anak',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
                      ),
                      validator: (val) => val!.isEmpty ? 'Masukkan nama anak' : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Usia Anak',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.cake, color: Colors.blueAccent),
                      ),
                      validator: (val) => val!.isEmpty ? 'Masukkan usia anak' : null,
                      onChanged: (val) {
                        setState(() => age = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Submit'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChildActivitiesPage(
                                childName: name,
                                childAge: int.parse(age),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
