import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const TravelDashboard());
}

class TravelDashboard extends StatelessWidget {
  const TravelDashboard ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue, 
          brightness: Brightness.light
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final destinations = [
      Destination('home', Icons.home),
      Destination('explore', Icons.explore),
      Destination('bookings', Icons.book),
      Destination('profile', Icons.person),
    ];
      final width = MediaQuery.sizeOf(context).width;

      if (width < 600) {
        return MobileLayout(destinations: destinations);
      } else {
        return DesktopLayout(destinations: destinations);
      }
    
  }
}

class MobileLayout extends StatelessWidget {
  final List<Destination> destinations;

  const MobileLayout({
    super.key,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Dashboard'),
      ),
      body: const Center(
        child: Text('Mobile Layout'),
      ),
      bottomNavigationBar: Row(
        children: destinations.map((destination) {
          return Expanded(
            child: ListTile(
              leading: Icon(destination.icon),
              title: Text(destination.name),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DesktopLayout extends StatelessWidget {
  final List<Destination> destinations;

  const DesktopLayout({
    super.key,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Dashboard'),
      ),
      body: Row(
        children: [
          SizedBox(
            width: 200,
            child: Column(
              children: destinations.map((destination) {
                return ListTile(
                  leading: Icon(destination.icon),
                  title: Text(destination.name),
                );
              }).toList(),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Desktop Layout'),
            ),
          ),
        ],
      ),
    );
  }
}

class Destination {
  final String name;
  final IconData icon;

  Destination(this.name, this.icon);
}

class TravelDeal {
  final String title;
  final double price;
  final String description;
  final bool isPopular;

  TravelDeal(
    this.title,
     this.price,
      this.description,
       this.isPopular,
       );
}

