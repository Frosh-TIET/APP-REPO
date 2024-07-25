// ignore_for_file: prefer_const_constructors


import 'dart:ui';
import 'package:flutter/material.dart';

class Tech extends StatefulWidget {
  const Tech({Key? key}) : super(key: key);

  @override
  State<Tech> createState() => _TechState();
}

class _TechState extends State<Tech> {
  void _showAnimatedDialog(BuildContext context,
      List<Map<String, dynamic>> items, int currentIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AnimatedAlertDialog(items: items, currentIndex: currentIndex);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {
        'image': 'assets/images/gdsc.png',
        'name': 'GDSC',
        'text':
        'Google Developer Student Clubs (DSC) are community groups for students from any academic background in their undergraduate or graduate term. By joining a DSC, students build their professional and personal network, get access to Google Developer Resources, and work together to build solutions for local problems in a peer-to-peer learning environment.'
      },
      {
        'image': 'assets/images/mlsc.png',
        'name': 'MLSC',
        'text':
        'Microsoft Learning Student Chapter( MLSC)  in collaboration with Microsoft aims to provide guidance, technical training, project guidance that improves students knowledge and learning skills. With various competitions and workshops around coding and problem solving skills they help the students develop the skill set required to be future ready.'
      },
      {
        'image': 'assets/images/ccs.png',
        'name': 'CCS',
        'text':
        'Creative Computing Society strives to help the students to develop problem-solving skills in tech through various workshops and competitions. The students get to know their best lying potential and develop an analytical temperament. The society has had numerous pivotal collaborations with organisations like GDSC, Mozilla Webmaker to name a few.'
      },
      {
        'image': 'assets/images/acm.png',
        'name': 'ACM',
        'text':
        'Thapar ACM Student Chapter is a technical society under the guidance of one of the most premier organizations in the computing world, ACM. Striving towards a single goal i.e. improving the coding culture at Thapar. Organizing classes and workshops for everyone in the college to enhance their skill set.'
      },
      {
        'image': 'assets/images/owasp.png',
        'name': 'OWASP',
        'text':
        'OWASP Student Chapter aims to provide excellence in the field of network and security and encourage members to be more digitally secure. They organize workshops and guest lectures covering various fields to give a wide perspective of the area and competitions to test the knowledge of the students.'
      },
      {
        'image': 'assets/images/lug.png',
        'name': 'LUG',
        'text':
        'The Linux Users Group connects students with real-world issues by exploring the relationship between science and technology. Members learn to critically evaluate scientific information, apply logical reasoning to problems, and understand the societal implications of scientific advancements, fostering a deeper engagement with technology and its impact on society.  '
      },
      {
        'image': 'assets/images/iste.png',
        'name': 'ISTE',
        'text':
        'Providing guidance and training to students to develop better technical, learning skills and personality, Organise lectures by experts from industry, defence services, government departments and other institutions, Training programme on report writing, Cultural programmes and Entrepreneurship development programmes.'
      },
      {
        'image': 'assets/images/mars.png',
        'name': 'MARS',
        'text':
        'Mechatronics and Robotics Society (MARS) provides an ideal platform for students of Mechanical, Mechatronics, Electronics, Computers and Electrical Engineering background to hone their skills and showcase their talent in many interdisciplinary activities. MARS conducts different workshops, competitions, technical quizzes and expert lectures.'
      },
      {
        'image': 'assets/images/ashrae.png',
        'name': 'ASHRAE',
        'text':
        'ASHRAE is an international technical society in the area of Heating, Refrigeration and Air Conditioning (RAC). The main objective of this society is to organise technical events and make students aware about the RAC and its emerging areas. Its standards are followed widely in the area of RAC, Green Buildings Development, HVAC Industry.'
      },
      {
        'image': 'assets/images/iete.png',
        'name': 'IETE',
        'text':
        'The main objective of IETE society is to organise technical events which involves electronics, telecommunication, and IT as a core area. It organises events like workshop on Arduino, Line Follower, Bluetooth controlled Robots. Another objective of the society is to enhance interest and knowledge in electronics and communication area.'
      },
      {
        'image': 'assets/images/iei.png',
        'name': 'IEI',
        'text':
        'The Institution of Engineers, India (IEI) organizes workshops, technical exams, and lecture series featuring successful professionals. This society is open to all engineering disciplines, providing valuable opportunities for students to enhance their technical knowledge and gain insights from industry experts, fostering a deeper understanding of their fields.'
      },
      {
        'image': 'assets/images/bck.png',
        'name': 'BCS',
        'text':
        'Backslash Computing Society has been envisioned to promote and inculcate interest in the field of Computer Science for the students of Derabassi Campus. Backslash aims at providing an opportunity for technical enthusiasts to interact with each other and a platform to display and hone their skills in the wonderful world of computing.'
      },
    ];

    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      child: GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: MediaQuery.of(context).size.width * 0.04,
          crossAxisSpacing: MediaQuery.of(context).size.height * 0.02,
          childAspectRatio: 0.82,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _showAnimatedDialog(context, items, index);
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff171717),
                border:
                Border.all(color: const Color(0xff171717), width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(19)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        items[index]['image']!,
                        height: MediaQuery.of(context).size.width * 0.23,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.03),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.03),
                      child: Text(
                        items[index]['name']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Audiowide',
                          fontSize: MediaQuery.of(context).size.width * 0.05 ,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnimatedAlertDialog extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final int currentIndex;

  const AnimatedAlertDialog({
    Key? key,
    required this.items,
    required this.currentIndex,
  }) : super(key: key);

  @override
  _AnimatedAlertDialogState createState() => _AnimatedAlertDialogState();
}

class _AnimatedAlertDialogState extends State<AnimatedAlertDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  void _navigateTo(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Stack(
            children: [ AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: Colors.transparent,
              content: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Stack(
                    children: [Container(
                      width: MediaQuery.of(context).size.height * 0.4,
                      height: MediaQuery.of(context).size.width * 1.1,
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(38),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            widget.items[_currentIndex]['image'],
                            height: MediaQuery.of(context).size.width * 0.3,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                          Text(
                            '${widget.items[_currentIndex]['name']}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width * 0.07,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Text(
                                '${widget.items[_currentIndex]['text']}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:MediaQuery.of(context).size.width * 0.04,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    ]
                ),
              ),
            ),
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Positioned(

                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      iconSize: MediaQuery.of(context).size.width * 0.11,
                      onPressed: () {
                        if (_currentIndex > 0) {
                          _navigateTo(_currentIndex - 1);
                        } else {
                          _navigateTo(widget.items.length - 1);
                        }
                      },
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Positioned(


                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    iconSize: MediaQuery.of(context).size.width * 0.11,
                    onPressed: () {
                      if (_currentIndex < widget.items.length - 1) {
                        _navigateTo(_currentIndex + 1);
                      } else {
                        _navigateTo(0);
                      }
                    },
                  ),

                ),
              ),
            ]
        ),
      ),
    );
  }
}