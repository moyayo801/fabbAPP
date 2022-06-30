import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class EquipeInfos extends StatefulWidget {
  final String club;
  const EquipeInfos({ Key? key,required this.club }) : super(key: key);

  @override
  State<EquipeInfos> createState() => _EquipeInfosState();
}


class _EquipeInfosState extends State<EquipeInfos> {
   List _sel = [];
    List _entr = [];
    List _joue = [];
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
   var dataJou=  await FirebaseFirestore.instance.collection('Joueur').where("Club", isEqualTo: widget.club).get();
    var dataSel=  await FirebaseFirestore.instance.collection('Joueur').where("isSelected", isEqualTo: true).where("Club", isEqualTo: widget.club).get();
    var dataEnt =  await FirebaseFirestore.instance.collection('EquipeNationale').get();
   
   setState(() {
     _joue= dataJou.docs;
     _sel =dataSel.docs;
     _entr = dataEnt.docs;
   });
   
    return "complete";
  }
  Stream<QuerySnapshot> equipeStream (BuildContext context) async* {
      yield* FirebaseFirestore.instance.collection('Equipe').where("Club", isEqualTo: widget.club).snapshots();
    }

  @override
  Widget build(BuildContext context) {
    calculateAge(DateTime birthDate) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;
  int month1 = currentDate.month;
  int month2 = birthDate.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = birthDate.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}




int agge = 0;
    List age =[];
    List<int> ages =[];
    double moy =0;
    int sum = 0;
 if (_joue.isNotEmpty) {
  
  for (var i = 0; i < _joue.length; i++) {
    String dda = _joue[i]["Date de naissance"];
   List ddaa = dda.split("/");
   var reversed = new List.from(ddaa.reversed);
if (reversed[1].toString().length==1) {
  String r ="0"+reversed[1];
  reversed[1]=r;
}
if (reversed[2].toString().length==1) {
  String r ="0"+reversed[2];
  reversed[2]=r;
}





   String dte = reversed.join("-");
    DateTime dt1 = DateTime.parse(dte);
       DateFormat formatter = DateFormat('yyyy-MM-dd');
       String formatted = formatter.format(dt1);
       DateTime dt2 = DateTime.parse(formatted);
    int ae = calculateAge(dt2);
    setState(() {
    ages.add(ae);
    }); 

  }
    
int sum1=0;

  for (var i = 0; i < ages.length; i++) {
    sum1 =sum1 + ages[i];
  }
double moyy =0.0; 
moyy = sum1/_joue.length;
setState(() {
  moy=double.parse((moyy).toStringAsFixed(2));
});
   
 } else {
 }





 var titeStyle =
  GoogleFonts.inter(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600,);












    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: equipeStream(context),
          builder: (BuildContext context,snapshot ){
            if(snapshot.hasError){
            return Text("wrong");
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Text("Loading");
          } 
         final data = snapshot.requireData;
          return  GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:1, crossAxisSpacing: 0, mainAxisExtent: 600),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context,int index ){
              return RawMaterialButton(
                onPressed: () {
                },
                child:Expanded(
                       child: Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: Container(
                     
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[ 
                               
                               Center(
                                 child: Text("Biographie de l'équipe", textAlign: TextAlign.center, style: TextStyle(
                                   color: Colors.black87,
                                   fontSize: 24,
                                   fontWeight: FontWeight.w300
                                 ),),
                               ),
                                 SizedBox(height: 30,),
    
                               Text("Président : ${data.docs[index]['Président']}", style: titeStyle),
                               SizedBox(height: 25,),
                                    Text("Adresse : ${data.docs[index]['Salle']}", style: titeStyle),
                               SizedBox(height: 25,),
                           
                               _joue.isNotEmpty ?
                                Text("Nombre de joueurs : ${_joue.length} joueurs", style: titeStyle): Text(""),
                               SizedBox(height: 25,),
                               _sel.isNotEmpty ?
                                Text("Joueurs en séléction nationale : ${_sel.length} joueurs", style: titeStyle):   Text("Joueurs en séléction nationale : 0", style: titeStyle),
                               SizedBox(height: 25,),
                                    _joue.isNotEmpty ?
                                Text("Nombre de joueurs : ${moy} ans", style: titeStyle): Text(""),
                               SizedBox(height: 25,),
                            
                                  Text("E-mail : ${data.docs[index]['Email']}", style: titeStyle),
                            
          
                         

                             ],
                           ),
                         ),
                       ),
    
    
                     ),
                     );
            },
         
           
    
            
        
            
           
    
    
    
            
          );
          }
          ,
          )
         ,
    );
  }
}