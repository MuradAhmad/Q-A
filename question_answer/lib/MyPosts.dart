import 'package:flutter/material.dart';
import 'PhotoUpload.dart';
import 'Authentication.dart';
import 'dart:io';
import 'add_post.dart';
import 'Dashboard.dart';


class MyPosts extends StatefulWidget {

  MyPosts ({
    this.auth,
    this.onSignedOut,

  });

  final AuthImplementation auth;
  final VoidCallback onSignedOut;



  State<StatefulWidget> createState(){

    return _MyPostsState();

  }
}




class _MyPostsState extends State<MyPosts>{








  var _isLoading = true;

  void _addImage(){


    Navigator.push(
        context,
        MaterialPageRoute(builder: (context){

          return new UploadPhotoPage();
          //return new AddPost();

        })

    );
  }
  void _myposts(){


    Navigator.push(
        context,
        MaterialPageRoute(builder: (context){

          return new MyPosts();
          //return new AddPost();

        })

    );
  }

  void _dashboard(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context){

          return new Dashboard();
          //return new AddPost();

        })

    );

  }

  void _logout() async{
    try{
      await widget.auth.SignOut();
      widget.onSignedOut();

    }catch(e){

      print("Error : "+ e.toString());

    }


  }


  @override
  Widget build(BuildContext context) {
    final title = 'My Posts';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('What’s the difference between regular food and organic food?'),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('Do you know why there are black holes in space?'),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('Have you found a dinosaur as big as a jumbo jet?'),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('Why is the sky blue, and not green or black? '),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('How old is the oldest person in the world?'),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('How long can turtles live?'),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('Where do elephants live?'),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('How many explosions have you made while working?'),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('Do you catch snakes?'),
            ),

          ],
        ),






        // Bottom Navigation

        bottomNavigationBar: new BottomAppBar(

          color: Colors.amber,

          child: new Container(

            child: new Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,

              children: <Widget>[

                new IconButton(icon: new Icon(Icons.dashboard),
                    iconSize: 30,
                    color: Colors.indigo,

                    onPressed: _dashboard),


                new IconButton(icon: new Icon(Icons.add_a_photo),
                    iconSize: 30,
                    color: Colors.indigo,

                    onPressed:_addImage),

                new IconButton(icon: new Icon(Icons.account_box),
                    iconSize: 30,
                    color: Colors.indigo,

                    onPressed:_myposts),

                new IconButton(icon: new Icon(Icons.exit_to_app),
                    iconSize: 30,
                    color: Colors.indigo,

                    onPressed:_logout)

              ],
            ),

          ),

        ),






      ),
    );
  }



}