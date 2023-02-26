// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Define a function to select a photo from the gallery
Future<void> selectPhoto(BuildContext context) async {
  // Open the photo library
  final image = await ImagePicker().getImage(source: ImageSource.gallery);

  // Display the selected photo in the app
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DisplayPhotoScreen(image: File(image.path)),
    ),
  );
}

// Define a function to take a picture
Future<void> takePicture(BuildContext context) async {
  // Open the camera
  final image = await ImagePicker().getImage(source: ImageSource.camera);


  // Display the picture in the app
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DisplayPhotoScreen(image: File(image.path)),
    ),
  );
}

class AddClothes extends StatefulWidget {
  @override
  _AddClothesState createState() => _AddClothesState();
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () => selectPhoto(context),
                child: Text('Select Photo from Gallery'),
              ),
              SizedBox(height: 10),
              RaisedButton(
                onPressed: () => takePicture(context),
                child: Text('Take a Picture'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayPhotoScreen extends StatelessWidget {
  final File image;

  const DisplayPhotoScreen({Key key, this.image}) : super(key: key);

  @override

/*
class _AddClothesState extends State<AddClothes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text(
          'A D D   C L O T H E S',
        style: TextStyle(fontSize:16)),
      ),
      
        body: Center(
        child: Text('This is where you add your clothes'), 
      ),
    );
  }
}
*/
