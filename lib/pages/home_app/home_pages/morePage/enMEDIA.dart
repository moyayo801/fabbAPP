
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EnMedia extends StatefulWidget {
  const EnMedia({ Key? key }) : super(key: key);

  @override
  State<EnMedia> createState() => _EnMediaState();
}

class _EnMediaState extends State<EnMedia> {

  final Stream<QuerySnapshot> Images = FirebaseFirestore.instance.collection('ImageEN').snapshots();
  @override
  Widget build(BuildContext context) {
             var size,height,width;
         size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0) ,
          child:Column(
            children: [
              SizedBox(height: height/110,),
              Expanded(
                child:Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  child: StreamBuilder<QuerySnapshot>(stream: Images,builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Text("wrong");
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Text("Loading");
        }
        final data = snapshot.requireData;
                   return StaggeredGridView.countBuilder(
                      crossAxisCount: 2, 
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