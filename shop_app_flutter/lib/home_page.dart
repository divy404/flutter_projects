import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List <String> filters = const [
    'All',
    'Adidas',
    'Nike',
    'Bata'
  ];
  late String selectedfilter;

  @override
  void initState(){
    super.initState();
    selectedfilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    
                  ),
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),

                );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Text(
                                 'Shoes\nCollection',
                                 style: TextStyle(
                                 fontWeight: FontWeight.bold, 
                                 fontSize: 35,
                               ),
                               ),
                 ),
            
             Expanded(child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border:border,
               

              ),
             )
             ),
            
              ],

            ),
             SizedBox(
              height: 120,
               child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding
                  (
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        
                        setState(() {
                          selectedfilter = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor:selectedfilter == filter
                        ? Theme.of(context).colorScheme.primary
                        :const Color.fromRGBO(245, 247, 249, 1),
                        side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        label: Text(filter),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                           vertical: 15
                           ),
                           shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                           ),
                      ),
                    )
                   ); 
                },
               
               ),
             ),

           
          ],
        ),
      ),
    );
  }
}