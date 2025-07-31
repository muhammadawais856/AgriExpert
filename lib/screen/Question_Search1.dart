import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class questionsearch1 extends StatefulWidget {
  const questionsearch1({Key? key}) : super(key: key);

  @override
  State<questionsearch1> createState() => _questionsearch1State();
}

class _questionsearch1State extends State<questionsearch1> {
  final TextEditingController _searchController = TextEditingController();
  List<DocumentSnapshot> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() async {
    String query = _searchController.text.trim().toLowerCase();

    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('questions').get();

    List<DocumentSnapshot> allDocs = snapshot.docs;

    setState(() {
      _searchResults = allDocs.where((doc) {
        final title = (doc['title'] ?? '').toString().toLowerCase();
        final authorName = (doc['autherName'] ?? '').toString().toLowerCase();
        return title.contains(query) || authorName.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
       automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text("Questions", style:  TextStyle(fontSize: 23.04,fontWeight:
        FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: TextField(
              controller: _searchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text("Search", style: TextStyle(fontSize: 13.33,fontWeight:
                FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD4D4D4),), // inactive border
                  borderRadius: BorderRadius.circular(8),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF339D44), width: 2), // active border
                  borderRadius: BorderRadius.circular(8),
                ),

              ),
            ),
          ),
          Expanded(
            child: _searchResults.isEmpty
                ? Center(
              child: Image.asset(
                'Assets/images/image1.jpg',
                height: 200,
              ),
            )
                : ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final data =
                _searchResults[index].data() as Map<String, dynamic>;
                final createdAt = data['createdAt'] as Timestamp?;
                final timeAgo = createdAt != null
                    ? timeago.format(createdAt.toDate())
                    : '';

                return Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30, left: 30),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundImage: AssetImage(
                                data['autherImage'] ?? 'Assets/images/default_user.png',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['autherName'] ?? '',
                                  style: const  TextStyle(fontSize: 11.11,fontWeight:
                            FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),
                                ),
                                if (timeAgo.isNotEmpty)
                                  Text(
                                    timeAgo,
                                    style: const TextStyle(fontSize: 9.26,fontWeight:
                                    FontWeight.w500,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),

                              ],
                            ),
                            const Spacer(),
                            if ((data['status'] ?? '') == 'pending')
                              const Text(
                                "Answer",
                                style: TextStyle(fontSize: 11,fontWeight:
                                FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF339D44),),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          data['title'] ?? '',
                          style: const TextStyle(fontSize: 13.13,fontWeight:
                          FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),
                        ),
                      ),
                      if ((data['image'] ?? '').toString().isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: ClipRRect(

                            child: Image.asset(
                              data['image'],
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}