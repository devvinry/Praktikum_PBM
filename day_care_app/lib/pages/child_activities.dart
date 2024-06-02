import 'package:flutter/material.dart';

class ChildActivitiesPage extends StatelessWidget {
  final String childName;
  final int childAge;

  ChildActivitiesPage({required this.childName, required this.childAge});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Child Activities Report'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg_child_activities.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black.withOpacity(0.8),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildSection('Child Information', [
                  _buildInfoRow('Name', childName),
                  _buildInfoRow('Age', '$childAge years'),
                  _buildInfoRow('Drop-off Date', _getFormattedDate(DateTime.now())),
                  _buildInfoRow('Arrival Time', '08:30 AM'),
                  _buildInfoRow('Body Temperature', '36.5°C'),
                  _buildInfoRow('Condition', 'Healthy'),
                ]),
                SizedBox(height: 20),
                _buildSection('Meal Schedule', [
                  _buildMealInfo('Breakfast', 'Pancakes', 'some', 'Ate well'),
                  _buildMealInfo('Lunch', 'Pasta', 'lots', 'Finished everything'),
                  _buildMealInfo('Dinner', 'Chicken soup', 'some', 'Ate slowly'),
                  _buildMealInfo('Fluids', 'Water', 'lots', 'Drank plenty'),
                  _buildMealInfo('Other', 'Fruits', 'some', 'Had a few pieces'),
                ]),
                SizedBox(height: 20),
                _buildSection('Toilet Time', [
                  _buildInfoRow('Time', '09:00 AM'),
                  _buildInfoRow('Type', 'Potty'),
                  _buildInfoRow('Dry/Wet/BM', 'Dry'),
                ]),
                SizedBox(height: 20),
                _buildSection('Child\'s Feelings', [
                  _buildFeelingRow('Sad', false),
                  _buildFeelingRow('Happy', true),
                  _buildFeelingRow('Shy', false),
                  _buildFeelingRow('Confident', true),
                  _buildFeelingRow('Naughty', false),
                ]),
                SizedBox(height: 20),
                _buildSection('Items Needed', [
                  _buildItemRow('Diapers', false),
                  _buildItemRow('Towel', true),
                  _buildItemRow('Hand Towel', false),
                  _buildItemRow('Soap', true),
                  _buildItemRow('Shampoo', true),
                  _buildItemRow('Cream', false),
                  _buildItemRow('Milk', true),
                  _buildItemRow('Clothes', true),
                  _buildItemRow('Toothpaste', false),
                  _buildItemRow('Other', false),
                ]),
                SizedBox(height: 20),
                _buildSection('Additional Information', [
                  _buildInfoRow('Rest Time', '1 hour'),
                  _buildInfoRow('Bathroom Time', '15 minutes'),
                  _buildInfoRow('Shower Time', '10 minutes'),
                  _buildInfoRow('Activity Description', 'Played with blocks and painted'),
                  _buildInfoRow('Parent Note', 'Had a great day!'),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.0),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          Column(children: children),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label + ':',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildMealInfo(String mealType, String food, String quantity, String comments) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mealType,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        _buildInfoRow('Food', food),
        _buildInfoRow('Quantity', quantity),
        _buildInfoRow('Comments', comments),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildFeelingRow(String feeling, bool isExpressed) {
    return _buildInfoRow(feeling, isExpressed ? 'Yes' : 'No');
  }

  Widget _buildItemRow(String item, bool isNeeded) {
    return _buildInfoRow(item, isNeeded ? 'Yes' : 'No');
  }

  String _getFormattedDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }
}
