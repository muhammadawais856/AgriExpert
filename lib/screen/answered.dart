import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class answered extends StatefulWidget {
  final String docId;
  const answered({super.key,required this.docId});

  @override
  State<answered> createState() => _answeredState();
}

class _answeredState extends State<answered> {

  @override
  TextEditingController answer=TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color:Color(0xFF339D44),)),
        // leading: GestureDetector(
        //   onTap: (){Navigator.pop(context);},
        //     child: Image.asset("Assets/images/arrow.jpg", width: 16, height: 14,)),
        title: Text("Answer", style: TextStyle(fontSize: 23.04,fontWeight:
        FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("Assets/images/profile2.jpg",width: 25,height: 25,),
                  SizedBox(width: 8,),


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Muhammad Ali Nizami",style: TextStyle(fontSize: 11.11,fontWeight:
                      FontWeight.w500,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                      SizedBox(height: 3,),
                      Text("20 mins ago",style: TextStyle(fontSize: 9.26,fontWeight:
                      FontWeight.w500,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),
                    ],
                  ),




                ],
              ),
              SizedBox(height: 15.5,),

              Text("What is the process of purchasing Vehicle from hardware store?",style: TextStyle(fontSize: 13.13,fontWeight:
              FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),


              SizedBox(height: 24,),

              SizedBox(
                height: 115,
                width: 320,
                child: TextFormField(
                  controller: answer,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 5,
                  decoration: InputDecoration(
                    label: Text("Enter you answer", style: TextStyle(fontSize: 13.33,fontWeight:
                    FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFD4D4D4)), // inactive border
                      borderRadius: BorderRadius.circular(8),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF339D44), width: 2), // active border
                      borderRadius: BorderRadius.circular(8),
                    ),

                  ),
                ),
              ),
              SizedBox(height: 390,),

              Center(
                child: SizedBox(
                  height: 60,
                  width: 315,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (answer.text.trim().isEmpty) return;

                      // Update answer and status in Firestore
                      await FirebaseFirestore.instance
                          .collection('questions')
                          .doc(widget.docId)
                          .update({
                        'answer': answer.text.trim(),
                        'status': 'answered',
                      });

                      Navigator.pop(context); // Go back
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF339D44), // Button color
                      foregroundColor: Color(0xFFF4F4F4), // Text/icon color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Raleway',
                      ),
                    ),
                    child: Text("Send"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
