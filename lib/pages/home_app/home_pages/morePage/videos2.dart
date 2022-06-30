import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabb/pages/home_app/home_pages/morePage/video_items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class video2 extends StatefulWidget {
  const video2({ Key? key }) : super(key: key);

  @override
  State<video2> createState() => _video2State();
}

class _video2State extends State<video2> {

  final Stream<QuerySnapshot> videos = FirebaseFirestore.instance.collection('VideoLinks').snapshots();

  @override
  Widget build(BuildContext context) {
           var titeeStyle =
  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
    return Scaffold(
      appBar: AppBar(      
                backgroundColor: Color.fromARGB(255, 138, 19, 15),
        title: Text("Vidéos".toUpperCase(), style:titeeStyle,
        
        ),),
      body: StreamBuilder<QuerySnapshot>(stream: videos,builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Text("wrong");
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Text("Loading");
        }
        final data = snapshot.requireData;
        return ListView.builder(

          itemCount: data.size,
          itemBuilder: (context, index){
            return VideoItems(
            videoPlayerController: VideoPlayerController.network(
                "${data.docs[index]['URL']}"
            ),
            looping: false,
            autoplay: false,
          );
              
              
              
               
               
                 
               
            
          },
        );
      },
      ) ,
    );
  }
}