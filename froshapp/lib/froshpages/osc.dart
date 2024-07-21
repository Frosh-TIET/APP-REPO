import 'package:flutter/material.dart';

class Osc extends StatelessWidget {
  final List<Map<String, String>> teamMembers = [
    {
      'name': 'Ananya Varshneya',
      'role': 'ELE',
      'image': 'assets/images/Ananya.png'
    },
    {
      'name': 'Swastik Raghav',
      'role': 'COE',
      'image': 'assets/images/Swastik.png'
    },
  ];

  Osc({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(height: MediaQuery.of(context).size.width * 0.04), // Adjusted spacing
        Expanded(
          child: ListView.builder(
            itemCount: teamMembers.length,
            itemBuilder: (context, index) {
              Map<String, String> member = teamMembers[index];
              bool imageOnLeft = index % 2 == 0;
              return TeamMemberRow(member, imageOnLeft);
            },
          ),
        ),
      ],
    );
  }
}

class TeamMemberRow extends StatelessWidget {
  final Map<String, String> member;
  final bool imageOnLeft;

  const TeamMemberRow(this.member, this.imageOnLeft, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.053),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: imageOnLeft
            ? [
                Container(
                  width: MediaQuery.of(context).size.height * 0.18,
                  height: MediaQuery.of(context).size.width * 0.65,
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.048),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(41.0),
                    child: Image.asset(
                      member['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        member['name']!,
                        style:  TextStyle(
                          fontFamily: 'Inter',
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.0048,
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.005),
                      ),
                      Text(
                        member['role']!,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                 SizedBox(width: MediaQuery.of(context).size.height * 0.02),
              ]
            : [
                 SizedBox(width: MediaQuery.of(context).size.height * 0.01),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        member['name']!,
                        style:  TextStyle(
                          fontFamily: 'Inter',
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.24,
                        height: MediaQuery.of(context).size.width * 0.0048,
                        color: Colors.white,
                        margin:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.005),
                      ),
                      Text(
                        member['role']!,
                        style:  TextStyle(
                          fontFamily: 'Inter',
                          fontSize:  MediaQuery.of(context).size.width * 0.05,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.height * 0.18,
                  height: MediaQuery.of(context).size.width * 0.65,
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.048),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(41.0),
                    child: Image.asset(
                      member['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}
