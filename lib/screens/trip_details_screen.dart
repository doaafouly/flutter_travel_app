import 'package:flutter/material.dart';

import 'package:travel_app/app_data.dart';

class TripDetailsScreen extends StatelessWidget {
  // const TripDetailsScreen({Key? key}) : super(key: key);

  static const screenRoute = '/trip_detail';

  final Function manageFavorite;
   final Function isFovarite;

  TripDetailsScreen(this.manageFavorite , this.isFovarite);
  Widget buildScreenTitle(String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        'أنشطة', // Fixed the Arabic text as well
        style: TextStyle(
          color: Colors.deepPurple[300], // Replace with the color you want
          fontSize: 18, // You can adjust the font size if needed
          fontWeight: FontWeight.bold, // Optional: add other styling
        ),
      ),
    );
  }

  Widget buildListViewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.all(10),
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings?.arguments as String?;
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedTrip.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            buildScreenTitle('أنشطة'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectedTrip.activties.length,
                itemBuilder: (ctx, index) => Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedTrip.activties[index]),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            buildScreenTitle('البرنامج اليومي'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('يوم ${index + 1}'),
                      ),
                      title: Text(selectedTrip.program[index]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFovarite(tripId)? Icons.star : Icons.star_border
        ),
        onPressed: () => manageFavorite(tripId),
      ),
      
      
    );
  }
}
