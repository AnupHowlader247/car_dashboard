import 'package:flutter/material.dart';

class CarDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton( // The menu icon on the left
          icon: Icon(Icons.menu),
          onPressed: () {
            // Define your menu logic here
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.headset),
            onPressed: () {
              // Define your headphone logic here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(  // Wrap the content with SingleChildScrollView
        child: Stack(
          children: [
            // Car image with text below it
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Image.asset(
                    'assets/car_image.jpg',  // Add the car image in assets folder
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Parked",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Updated at 4:30 pm 24th June, 2025",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            // Semi-transparent overlay
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            // Content below the image
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Vehicle Details
                  Text(
                    "Chi-Ka-102-153",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "TOYOTA COROLLA",

                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatCard("2,389 mi", "Miles Driven"),
                      _buildStatCard("87%", "Fuel Reserve"),
                    ],
                  ),
                  SizedBox(height: 30),
                  // Start Engine Button
                  Center(
                    child: _buildStartEngineButton(),
                  ),
                  SizedBox(height: 30),
                  // Features Section

                  SizedBox(height: 10),
                  // Feature Cards
                  Column(
                    children: [
                      _buildFeatureCard(
                        Icons.settings,
                        "Control Panel",
                        "Control different features of your car with a click",
                            () => Navigator.pushNamed(context, '/controlPanel'),
                      ),
                      _buildFeatureCard(
                        Icons.trending_up,
                        "Check Status",
                        "Check your vehicle’s status for performance Boost",
                            () => Navigator.pushNamed(context, '/checkStatus'),
                      ),
                      _buildFeatureCard(
                        Icons.location_on,
                        "Find My Vehicle",
                        "Find your car on map",
                            () => Navigator.pushNamed(context, '/findMyVehicle'),
                      ),
                      _buildFeatureCard(
                        Icons.health_and_safety,
                        "Smart Health Check",
                        "Get AI-powered insights on your vehicle’s current condition",
                            () => Navigator.pushNamed(context, '/smartHealthCheck'),
                      ),
                      _buildFeatureCard(
                        Icons.directions_car,
                        "Recommended Accessories",
                        "Browse parts and upgrades tailored for your specific model",
                            () => Navigator.pushNamed(context, '/recommendedAccessories'),
                      ),

                    ],
                  ),
                ],
              ),

            ),

          ],

        ),

      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Circular Start Engine Button with gradient
  Widget _buildStartEngineButton() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Start Engine",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(), backgroundColor: Colors.blue[100],
          padding: EdgeInsets.all(20),
          shadowColor: Colors.black.withOpacity(0.3),
        ),
      ),
    );
  }

  // Stat card for displaying "Miles Driven" and "Fuel Reserve"
  Widget _buildStatCard(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }

  // Section title widget
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  // Feature card widget with icon, label, and description
  Widget _buildFeatureCard(IconData icon, String label, String description, Function onPressed) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        child: ListTile(
          leading: Icon(icon, size: 40, color: Colors.blueAccent),
          title: Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            description,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
        ),
      ),
    );
  }
}

// Bottom navigation bar widget
Widget _buildBottomNavigationBar() {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.directions_car), // Car icon
        label: '',
        backgroundColor: Colors.grey[200], // Optional background color
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person), // User icon
        label: '',
        backgroundColor: Colors.grey[200], // Optional background color
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search), // Search icon
        label: '',
        backgroundColor: Colors.grey[200], // Optional background color
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart), // Cart icon
        label: '',
        backgroundColor: Colors.grey[200], // Optional background color
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/car_icon.jpg',  // Use the .jpg image
          width: 40.0,  // Set the size
          height: 40.0,
        ),
        label: '',
 // Optional background color
      ),
    ],
    type: BottomNavigationBarType.fixed, // Make the items stay fixed
    currentIndex: 0, // Set the initial index (which icon is active)
    selectedItemColor: Colors.blueAccent, // Color when item is selected
    unselectedItemColor: Colors.grey, // Color for unselected items
    onTap: (index) {
      // Handle navigation here based on index
      // For example, you could use Navigator.push to go to other pages
    },
  );
}
