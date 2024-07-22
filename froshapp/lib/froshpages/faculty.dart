import 'package:flutter/material.dart';

class Faculty extends StatelessWidget {
  final List<Map<String, String>> teamMembers = [
    {'name': 'MD Singh', 'role': 'President', 'image': 'assets/images/md.png'},
    {
      'name': 'Hemdutt Joshi',
      'role': 'Vice-President',
      'image': 'assets/images/hemdutt.png'
    },
    {
      'name': 'Vishal Gupta',
      'role': 'Vice-President',
      'image': 'assets/images/vishal.png'
    },
    {
      'name': 'Avinash Chandra',
      'role': 'Vice-President',
      'image': 'assets/images/avinash.png'
    },
    {
      'name': 'Devendar Kumar',
      'role': 'Vice-President',
      'image': 'assets/images/devender.png'
    },
    {
      'name': 'Tarunpreet Bhatia',
      'role': 'Vice-President',
      'image': 'assets/images/tarunpreet.png'
    },
  ];

  Faculty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.width * 0.05), // Adjust space at the top

        // GridView for team members
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: MediaQuery.of(context).size.height * 0.036,
              mainAxisSpacing: MediaQuery.of(context).size.width * 0.08,
              childAspectRatio: 0.5,
            ),
            itemCount: teamMembers.length,
            itemBuilder: (context, index) {
              Map<String, String> member = teamMembers[index];
              return GridTile(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.asset(
                        member['image']!,
                        width: MediaQuery.of(context).size.height * 0.9,
                        height: MediaQuery.of(context).size.width * 0.74,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.024),
                    Text(
                      member['name']!,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      member['role']!,
                      style:TextStyle(
                        fontFamily: 'Inter',
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        color: Colors.white,
                      ),
                    ),

                  ],
                ),
              );
            },
          ),

        ),
        SizedBox(height: MediaQuery.of(context).size.width * 0.04)
      ],
    );
  }
}
