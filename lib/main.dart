import 'package:flutter/material.dart';
import 'package:placeapp/provider/place.dart';
import 'package:placeapp/screens/place_details_screen.dart';
import 'package:placeapp/screens/place_list_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
             value: GreatPlace(),
        )
      ],
      child: MaterialApp(
          title: 'Place_App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: PlaceList(),
        routes: {
            PlaceList.routeName:(context)=>PlaceList(),
            PlaceDetails.routeName:(context)=>PlaceDetails(),
        },
      ),
    );
  }
}

