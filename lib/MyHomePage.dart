import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  @override
   _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
   
  File _image;

   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Take Photo'),
        backgroundColor: Color(0xFF077a49),
      ),
      body: Center(
        // if (_image==null) {
        //   Text('No Image ! ')
        // } else {
        //   Image.file(_image)
        // }
        child: _image == null ? Text('') : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _optionsDialogBox,
        child: Icon(Icons.add_a_photo),
        tooltip: 'Take a Photo',
      ),

    );
  }

  Future <void> _optionsDialogBox(){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Colors.indigoAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.add_a_photo),
                      onPressed: openCamera,
                    ),
                    GestureDetector(
                    child: Text('Open Camera',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    onTap: openCamera,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    IconButton( icon: Icon(Icons.photo_library),
                      onPressed: openGallery,
                    ),
                    GestureDetector(
                      child: Text('Open Gallery',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0
                        ),
                      ),
                      onTap: openGallery,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }

  Future openCamera() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
     _image=image; 
    });
  }
  Future openGallery() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
     _image=image; 
    });
  }
}  

