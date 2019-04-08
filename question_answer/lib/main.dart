import 'package:flutter/material.dart';
import 'PhotoUpload.dart';
import 'Mapping.dart';
import 'LoginRegister.dart';
import 'Home.dart';
import 'Authentication.dart';

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'View.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Q-A meetup!',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),

      //home: MyHomePage(title: 'Q-A meetup!'),
      //home: LoginRegisterPage(),
      //home: Home(),
      home: Mapping(auth: Auth(),),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

        ),
      ),
      floatingActionButton: FloatingActionButton(
       // onPressed: _incrementCounter,
        //tooltip: 'Increment',

        onPressed: (){

          Navigator.push(
              context, 
          MaterialPageRoute(builder: (context){

            return new UploadPhotoPage();

          })

          );

        },

        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/*

void main() => runApp(new MyApp());
class MyApp extends StatefulWidget {
  @override  _MyAppState createState() => new _MyAppState();}

class _MyAppState extends State<MyApp> {
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
  @override  void initState() {
    super.initState();  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(images.length, (index) {
      Asset asset = images[index];
      return ViewImages(
        index,
        asset,
        key: UniqueKey(),
      );
      }),
    );
  }

  Future<void> loadAssets() async {
    setState(() {
      images = List<Asset>();
    });
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 4,
        enableCamera: false,
        options: CupertinoOptions(takePhotoIcon: "chat"),
      );
    }
    on PlatformException catch (e) {
      error = e.message;    }
    if (!mounted) return;
    setState(() {
      images = resultList;
      _error = error;
    });
  }

  @override  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
      appBar: new AppBar(
        title: const Text('Multiple Images Example'),
      ),
        body: Column(
      children: <Widget>[
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
      Text('Select the multiple images '),
      RaisedButton(
        child: Text("Click",style: TextStyle(
            color: Colors.white
        ),
        ),
        color: Colors.blue,
        onPressed: loadAssets,
      ),//
      //               Icon(Icons.camera_alt,color: Colors.blue,)              ],            ),
      Center(
        child:Container(
          padding: EdgeInsets.all(10.0),
          child: Text('Error: $_error',style: TextStyle(
            fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic
          ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: Color(0x0FF000000))

        ),
        ),
      ),
      Expanded(
        child: buildGridView(),
      )
    ],
        ),
      ),
    );
  }
}
*/
