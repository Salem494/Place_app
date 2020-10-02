import 'dart:io';
import 'package:flutter/material.dart';
import 'package:placeapp/provider/place.dart';
import 'package:placeapp/screens/place_list_screen.dart';
import 'package:placeapp/widgets/image_input.dart';
import 'package:placeapp/widgets/location_input.dart';
import 'package:provider/provider.dart';

class AddPlace extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  TextEditingController _controller = TextEditingController();
  
  File _pickedImage;
  
  void _selectImage(File pickedImage){
    _pickedImage = pickedImage;
  }
  
  void _savePlace(){
    if(_controller.text.isEmpty || _pickedImage == null){
      return;
    }

    Provider.of<GreatPlace>(context,listen: false).addPlace(_controller.text, _pickedImage);
//    Navigator.of(context).pop();

    Scaffold.of(context).showSnackBar(SnackBar(
      content:Text('Place Added Successed!') ,
       elevation: 5,
      margin: EdgeInsets.all(8),
      duration: Duration(seconds: 3),
//      action: SnackBarAction(label: 'Salem Mahrous',onPressed: (){},textColor: Colors.blue,),
    ));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
        leading:FlatButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context)=>PlaceList()));
        }, child: Icon(Icons.arrow_back)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText:'Title',
                      ),
                    ),
                    SizedBox(height: 25),
                    ImageInput(_selectImage),
                    SizedBox(height: 20,),
                    LocationInput(),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: RaisedButton.icon(
              onPressed: _savePlace,
              icon:Icon(Icons.add,),
              label:Text('AddPlace'),
              elevation: 0,
              color: Theme.of(context).primaryColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

            ),
          ),
        ],
      )


    );
  }
}
