import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'Home.dart';
import 'package:question_answer/Crud.dart';
import 'package:flutter_multiple_image_picker/flutter_multiple_image_picker.dart';



class Upload extends StatefulWidget {


  State<StatefulWidget> createState(){


    return _UploadPageState();
  }


}
class _UploadPageState extends State<Upload> {




  List images;
  int maxImageNo = 3;
  bool selectSingleImage = false;


  initMultiPickUp() async {
    setState(() {
      images = null;

    });
    List resultList;
    String error;
    try {
      resultList = await FlutterMultipleImagePicker.pickMultiImages(
          maxImageNo, selectSingleImage);
    } on PlatformException catch (e) {
      error = e.message;
    }
    if (!mounted) return;

    setState(() {
      images = resultList;

    });
  }



  void _moveToHome(){

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context){

          return new Home();

        })

    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Upload Post'),
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
        Column(
        mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
        Stack(
        children: <Widget>[
              images == null
                  ? new Container(
                height: 300.0,
                width: 400.0,
                child: new Icon(
                  Icons.image,
                  size: 250.0,
                  color: Theme.of(context).primaryColor,
                ),
              )
                  : new SizedBox(
                height: 300.0,
                width: 400.0,
                child: new ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) =>
                  new Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new Image.file(
                      new File(images[index].toString()),
                    ),
                  ),
                  itemCount: images.length,
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text('Error Dectected'),
              ),
              new RaisedButton.icon(
                  onPressed: initMultiPickUp,
                  icon: new Icon(Icons.image),
                  label: new Text("Select Images")
              ),

              SizedBox(height: 15.0,),

              TextFormField(

                decoration: new InputDecoration(
                  labelText: 'Title',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),

                ),),
        SizedBox(height: 15.0,),

        TextFormField(

          decoration: new InputDecoration(
            labelText: 'Description',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),

          ),),

              SizedBox(height: 15.0,),
              RaisedButton(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
                child: Text(
                  'Add a new post', ),
                textColor: Colors.white,
                color: Colors.pink,
                // onPressed: validateAndSave,
                onPressed: (){
                  _moveToHome();


                },

              ),

              Padding(
                  padding:EdgeInsets.only(right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0)

                            ),
                            child: Icon(
                              Icons.favorite,
                              //color: Colors.red,
                            ),
                          )
                      )
                    ],
                  )
              ),


            ],
          ),
        ]),]

      ),
    ));
    }


}

class FlutterMultipleImagePicker {
  static const MethodChannel _channel =
  const MethodChannel('flutter_multiple_image_picker');

  static Future<List> pickMultiImages(int maxImages, bool isSingle) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("maxImages", () => maxImages);
    args.putIfAbsent("isSingle", () => isSingle);
    final List filePath =
    await _channel.invokeMethod('pickUpImagesImage', args);
    return filePath;
    //return filePath == null ? null : new File(filePath);
  }
}
