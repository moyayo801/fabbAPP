

// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../../constants.dart';

class videoPage extends StatefulWidget {
  const videoPage({ Key? key }) : super(key: key);

  @override
  State<videoPage> createState() => _videoPageState();
}

class _videoPageState extends State<videoPage> {
       List _video = [];
    List _nat = [];
    late Future resultsLoaded;

     @override
  void initState() {
    super.initState();
     
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
   resultsLoaded = getDomVisURL();
  }


        getDomVisURL() async {

    var dataDom=  await FirebaseFirestore.instance.collection('VideoLinks').get();

   
   setState(() {
     _video =dataDom.docs;
   });
   
    return "complete";
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Videos"),
               
      ),
      body: ListView.builder(

          itemCount: _video.length,
          itemBuilder: (context, index){
            return RawMaterialButton(
              onPressed: () { },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    
                                   children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                      child: Image.network("${_video[index]['URL']}",fit: BoxFit.fill,),
                                      ) ),
                                       Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Text("${_video[index]['Name']}"),
                                      ) )
                                   ],
                                 ),
                ),
              ),
                   );
              
              
              
               
               
                 
               
            
          },
        ),
    );
  }
} 