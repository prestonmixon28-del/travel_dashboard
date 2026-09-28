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
    final destination = Destination("paris", Icons.flight);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Travel Dashboard"),
      ),
      body: Center(
        child: Text(
          destination.name,
          style: Theme.of(context).textTheme.displayLarge,
        ),
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

