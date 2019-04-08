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



class UploadPhotoPage extends StatefulWidget {


  State<StatefulWidget> createState(){


    return _UploadPhotoPageState();
  }


}
class _UploadPhotoPageState extends State<UploadPhotoPage> {

  File sampleImage;


  String _myValue;
  String description;
  //CrudMethods crudObj = new CrudMethods();

  final formKey = new GlobalKey<FormState>();


  void _moveToHome(){

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context){

          return new Home();

        })

    );
  }

  Future getImage() async {

    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = tempImage;

    });


  }


  bool validateAndSave(){

    final form = formKey.currentState;

    if(form.validate())
      {
        form.save();
        return true;
      }
      else{

      return false;
    }

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

 appBar: new AppBar(

   title: new Text("Upload Image"),
   centerTitle: true,

 ),

      body: new Center(

        child: sampleImage == null ? Text("Select an Image"): enableUpload(),

      ),

      floatingActionButton: new FloatingActionButton(
          onPressed: getImage,
        tooltip: 'Add Image',
        child: new Icon(Icons.add_a_photo),
      ),

    );
  }

  Widget enableUpload() {
    return Container(
        child: new Form(


          key: formKey,
          child: Column
            (
              children: <Widget>[
                Image.file(sampleImage, height: 320.0, width: 660.0,),

                SizedBox(height: 15.0,),

                TextFormField(

                  decoration: new InputDecoration(
                      labelText: 'Description',
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),

                  ),



                  validator: (value) {
                    return value.isEmpty ? 'Description is required' : null;
                  },

                  onSaved: (value) {
                    this.description = value;
                    return _myValue = value;
                  },

                ),

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
/*                    final StorageReference firebaseStorageRef = FirebaseStorage
                        .instance.ref().child('myImage.jpg');
                    final StorageUploadTask task = firebaseStorageRef.putFile(
                        sampleImage);*/

                    Map<String,String> data = {'User Post': this.description};
                    //crudObj.addData(data);

                    _moveToHome();



/*   Firestore.instance.collection("Name").document().setData({
                      'Description' : _myValue
                    });*/


                  },

          )
            ],

        ),

    ),
    );
  }

}
