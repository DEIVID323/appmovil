import 'package:flutter/material.dart';

class PhotographerProfile extends StatelessWidget {
  const PhotographerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = <String>[
      'assets/images/logo1.png',
      'assets/images/wedding2.jpg',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        elevation: 0,
        toolbarHeight: 100,
        flexibleSpace: const Align(
          alignment: Alignment.bottomCenter,
          child: CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/logo1.png'),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          const Text(
            'DAVID ROJAS',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.favorite, color: Colors.blue, size: 16),
              SizedBox(width: 4),
              Text('2.3K'),
              SizedBox(width: 20),
              Icon(Icons.group, color: Colors.blue, size: 16),
              SizedBox(width: 4),
              Text('1.2K'),
            ],
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Portafolio',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Servicios',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Acerca de mí',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: <Widget>[
                        Image.asset(
                          images[index],
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Boda',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Event'),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Photos',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
