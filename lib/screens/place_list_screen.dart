import 'package:flutter/material.dart';
import 'package:placeapp/provider/place.dart';
import 'package:placeapp/screens/add_place_screen.dart';
import 'package:placeapp/screens/place_details_screen.dart';
import 'package:provider/provider.dart';

class PlaceList extends StatefulWidget {
  static const routeName = '/place-list';

  @override
  _PlaceListState createState() => _PlaceListState();
}

class _PlaceListState extends State<PlaceList> {
  @override
  Widget build(BuildContext context) {

    final greatPlace = Provider.of<GreatPlace>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
//        centerTitle: true,
        title: Text('Your Place'),
        actions: [
          IconButton(icon:Icon(Icons.add), onPressed: () {
            Navigator.pushReplacement(context,MaterialPageRoute(
                builder: (context)=>AddPlace()));
          }),
        ],
      ),

      body: greatPlace.item.length == 0 ? Center(child: Text('Not Take Picture Yet! ')):
       ListView.builder(
        itemBuilder: (context,index)=>ListTile(
          leading: CircleAvatar(
            backgroundImage:FileImage(greatPlace.item[index].image) ,
          ),
          title: Text(greatPlace.item[index].title),
          onTap: (){
            Navigator.of(context).pushReplacementNamed(PlaceDetails.routeName,
                arguments: greatPlace.item[index].id);
          }
        ),
      itemCount: greatPlace.item.length,
    ),

    );
  }
}
