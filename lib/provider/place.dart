import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:placeapp/helpers/db_helper.dart';
import 'package:placeapp/models/place.dart';

class GreatPlace with ChangeNotifier{

  List<Place> _items =[];

  List<Place> get item {

    return [..._items];

  }

  Place findId( String id){
    return _items.firstWhere((element) => element.id == id);

  }

   void addPlace(String pickedTitle , File pickedImage)
   {

   final newPlace = Place(
       id: DateTime.now().toString(),
       title: pickedTitle,
       location: null,
       image: pickedImage
   ) ;

   _items.add(newPlace);
   notifyListeners();

   DBHelper.insert('places', {
      'id':newPlace.id,
     'title':newPlace.title,
     'image':newPlace.image.path
   });

   }



}