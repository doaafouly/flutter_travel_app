import 'package:flutter/material.dart';
import '../screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  CategoryItem(this.id, this.title, this.imageUrl);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
        // MaterialPageRoute(
        //   builder: (c) => CategoryTripsScreen(id, title),
        // ),
        CategoryTripsScreen.screenRoute,
        arguments: {
          'id': id,
          'title': title,
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Colors.deepPurple[200],
      borderRadius: BorderRadius.circular(25),
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            height: 250,
            fit: BoxFit.cover,
          ), // تأكد من المسار الصحيح

          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white, // تغيير لون النص للتباين
                fontSize: 30,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.35),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
