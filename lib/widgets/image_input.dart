import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;


class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  ImageInput(this.onSelectImage);

  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

  File _storeImage;

  Future<void> _imagePicker() async{
    final imageFile =  await ImagePicker.pickImage(source: ImageSource.camera,maxWidth: 600);


    if(imageFile == null){
     return;
    }
    setState(() {
      _storeImage = imageFile;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');

    widget.onSelectImage(savedImage);
    
    

  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey,width: 1)
          ),
          child: _storeImage != null ? Image.file(_storeImage,fit: BoxFit.cover,) : Text('No Image Taken!',textAlign: TextAlign.center,) ,
        ),
        SizedBox(width:20,),
        FlatButton.icon(onPressed: (){
          _imagePicker();
        },label: Text('Take Picture'),icon: Icon(Icons.camera_alt),color: Colors.grey,)
      ],
    );
  }
}
