import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EquipeMedia extends StatelessWidget {
  final String club;
  const EquipeMedia({ Key? key, required this.club }) : super(key: key);

  @override
  Widget build(BuildContext context) {
       final Stream<QuerySnapshot> Images = FirebaseFirestore.instance.collection('ImageTeams').where("ID", isEqualTo: "${club}").snapshots();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0) ,
          child:Column(
            children: [
              SizedBox(height: 5.0,),
              Expanded(
                child:Padding(
                  padding: EdgeInsets.zero,
                  child: StreamBuilder<QuerySnapshot>(stream: Images,builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Text("wrong");
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Text("Loading");
        }
        final data = snapshot.requireData;
                   return StaggeredGridView.countBuilder(
                      crossAxisCount: 3, 
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      itemCount: data.size,
                      itemBuilder: (context,index){
                        return Container(
                          decoration: BoxDecoration(
                            color:Colors.transparent,
                            borderRadius: BorderRadius.circular(8.0),
                             ),
                             child:ClipRRect(
                               borderRadius:BorderRadius.circular(8.0),
                               child: Image.network("${data.docs[index]['URL']}",fit: BoxFit.fill,)
                               ),
                                ) ;
                      
                      },
                      staggeredTileBuilder: (index){
                        return new StaggeredTile.count(1, index.isEven ? 1.2 : 2);
                      }
                      );
                  },),
                ),
                 ),
            ]) ,
          ) 
          ),
    );
  }
}