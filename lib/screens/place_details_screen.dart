import 'package:flutter/material.dart';
import 'package:placeapp/provider/place.dart';
import 'package:provider/provider.dart';

class PlaceDetails extends StatelessWidget {
  static const routeName ='/place-details';

  @override
  Widget build(BuildContext context) {

    final idBy =  ModalRoute.of(context).settings.arguments;
    final selectedPlace = Provider.of<GreatPlace>(context,listen: false).findId(idBy);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
        centerTitle: true,
      ),
      body: Column(
      children: [
        Container(
          height: 300,
          width: double.infinity,
           child:Hero(
               tag: selectedPlace.id,
               child: Image.file(selectedPlace.image,fit: BoxFit.cover,))
        ),
        SizedBox(
          height: 15,
        ),
        Text(selectedPlace.title,style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,

        ),)
      ],
      )
    );
  }
}

