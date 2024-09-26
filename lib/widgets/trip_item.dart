import 'package:flutter/material.dart';
import '../screens/trip_details_screen.dart';
import '../models/trip.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Season season;
  final TripType tripType;
  // final Function removeItem;

  TripItem(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.season,
      // required this.removeItem,
      required this.tripType});

  String get seasonText {
    switch (season) {
      case Season.Winter:
        return 'شتاء ';

        break;
      case Season.Spring:
        return 'ربيع  ';

        break;
      case Season.Summer:
        return 'صيف  ';

        break;
      case Season.Autumn:
        return 'خريف ';

        break;
      default:
        return 'غير معروف ';
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Exploration:
        return 'استكشاف ';

        break;
      case TripType.Recovery:
        return 'نقاهة  ';

        break;

        break;
      case TripType.Activities:
        return 'انشطة  ';

        break;
        break;
      case TripType.Therapy:
        return 'معالجة  ';

        break;

        break;
      default:
        return 'غير معروف ';
    }
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      TripDetailsScreen.screenRoute,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 205,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: [0.6, 1],
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      children: [
                        Icon(
                          Icons.today,
                          color: Colors.amber,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            width: 6,
                          ),
                        ),
                        Text('$duration أيام '),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      children: [
                        Icon(
                          Icons.wb_sunny,
                          color: Colors.amber,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            width: 6,
                          ),
                        ),
                        Text(seasonText),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      children: [
                        Icon(
                          Icons.family_restroom,
                          color: Colors.amber,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: SizedBox(
                            width: 6,
                          ),
                        ),
                        Text(tripTypeText),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
