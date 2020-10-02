import 'package:location/location.dart';
import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getLocation() async{
   final locData = await Location().getLocation();
   print(locData.latitude);
   print(locData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey
            )
          ),
          alignment: Alignment.center,
          height: 170,
          width: double.infinity,
          child: _previewImageUrl == null ?Text('NO Location Chosen') :
          Image.network(
            _previewImageUrl,
            width: double.infinity,
            fit: BoxFit.cover,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton.icon(onPressed: _getLocation, icon: Icon(Icons.location_on), label: Text('Current Location')),
            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.map), label: Text('Select On Map'))
          ],
        )
      ],
    );
  }
}
