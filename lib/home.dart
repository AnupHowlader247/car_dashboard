import 'package:flutter/material.dart';

class CarDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Define  menu here
            },
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Define  notification here
            },
          ),
          IconButton(
            icon: Icon(Icons.headset),
            onPressed: () {

            },
          ),
        ],
      ),
      body: SingleChildScrollView(  // Wrap the content with SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 20),
            Row(
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 45.0),
                  child: Image.asset(
                    'assets/brand.png',
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
                SizedBox(width: 10),

                Text(
                  "Chi-Ka-102-153",
                  style: TextStyle(fontSize: 18, color: Colors.brown.withOpacity(0.5)),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 45.0),
              child: Text(
                "TOYOTA COROLLA",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.withOpacity(.8),
                ),
              ),
            ),
            SizedBox(height: 20),


            Center(
              child: Image.asset(
                'assets/car_image.jpg',
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),


            Center(
              child: Column(
                children: [
                  Text(
                    "Parked",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Updated at 3:37 am 3rd May, 2025",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Start Engine Button
            Center(
              child: _buildStartEngineButton(),
            ),
            SizedBox(height: 30),

            // Feature Cards Section
            _buildFeatureCard(
              "assets/control.png",
              "Control Panel",
              "Control different features of your car with a click",
              Colors.white10,
                  () => Navigator.pushNamed(context, '/controlPanel'),
            ),
            _buildFeatureCard(
              "assets/check_status.png",
              "Check Status",
              "Check your vehicle’s status for performance Boost",
              Colors.white10,
                  () => Navigator.pushNamed(context, '/checkStatus'),
            ),
            _buildFeatureCard(
              "assets/location.png",
              "Find My Vehicle",
              "Find your car on map",
              Colors.white10,
                  () => Navigator.pushNamed(context, '/findMyVehicle'),
            ),
            _buildFeatureCard(
              "assets/a.png",
              "Smart Health Check",
              "Get AI-powered insights on your vehicle’s current condition",
              Colors.white10,
                  () => Navigator.pushNamed(context, '/smartHealthCheck'),
            ),
            _buildFeatureCard(
              "assets/abc.png",
              "Recommended Accessories",
              "Browse parts and upgrades tailored for your specific model",
              Colors.white10,
                  () => Navigator.pushNamed(context, '/recommendedAccessories'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  //  Start Engine Button
  Widget _buildStartEngineButton() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[300], // Outer circle
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 120,  // Inner circle
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey[500],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(), backgroundColor: Colors.transparent,
                padding: EdgeInsets.all(0),
                shadowColor: Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Start",
                    style: TextStyle(
                      fontSize: 16,  // Adjust font size
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Engine",
                    style: TextStyle(
                      fontSize: 16,  // Adjust font size
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Feature card widget
  Widget _buildFeatureCard(String imagePath, String label, String description, Color backgroundColor, Function onPressed) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        color: backgroundColor,
        child: ListTile(
          leading: Image.asset(imagePath, width: 40, height: 40),
          title: Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          subtitle: Text(
            description,
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
        ),
      ),
    );
  }

  // Bottom navigation bar widget
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white10,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_car), // Car icon
          label: '',
          backgroundColor: Colors.grey[100],
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person), // User icon
          label: '',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: '',

        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/car_icon.png',
            width: 22.0,
            height: 22.0,
          ),
          label: '',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      selectedItemColor: Colors.brown,
      onTap: (index) {

      },
    );
  }
}
