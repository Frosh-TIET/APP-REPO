import 'package:flutter/material.dart';
import 'package:froshapp/pages/shared_widgets.dart';

class Tech extends StatelessWidget {
  const Tech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SocietyGrid(items: techItems);
  }
}

class NonTech extends StatelessWidget {
  const NonTech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SocietyGrid(items: nonTechItems);
  }
}

class SocietyGrid extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const SocietyGrid({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          return SocietyGridItem(
            image: items[index]['image']!,
            name: items[index]['name']!,
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AnimatedSocietyDialog(items: items, currentIndex: index);
                },
              );
            },
          );
        },
      ),
    );
  }
}

// Define techItems and nonTechItems lists here

//Add lead society to nontech

final List<Map<String, dynamic>> nonTechItems = [
  {
    "image": "assets/images/care.png",
    "name": "CARE",
    "text": "This society promotes chemical research and education for societal benefit, encouraging students to pursue careers in the science stream. It serves as a platform for students and researchers, fostering scientific and methodological growth while providing valuable resources and opportunities for collaboration in the field of chemistry."
  },
  {
    "image": "assets/images/econ1.png",
    "name": "ECON",
    "text": "Econ Club provides a forum to identify and discuss economic, social and political issue. The Econ Club organises Economics Quizzes; Debating competitions; World Economic Forum to help find solutions to emerging issues."
  },
  {
    "image": "assets/images/ebsb.png",
    "name": "EBSB",
    "text": "Ek Bharat Shreshtha Bharat (EBSB) programme has been initiated by AICTE for promoting National Integration through systematic exchange between paired States/UTs in the Cultural, Literary and Linguistic fields."
  },
  {
    "image": "assets/images/echos.png",
    "name": "ECHOES",
    "text": "Echoes Club publishes quarterly periodicals created by and for students. These publications highlight all activities at TIET, including cultural, technical, and sports events, as well as academic achievements, fostering a sense of community and keeping everyone informed about campus life."
  },
  {
    "image": "assets/images/elpis.png",
    "name": "ELPIS",
    "text": "Elpis is a Psychology Society of Thapar Institute. Elpis is for everyone interested in delving in the field of psychology. Whether you have a background in psychology or are simply fascinated by the world of psychology, everyone is welcome to join our community."
  },
  {
    "image": "assets/images/enactus.png",
    "name": "ENACTUS",
    "text": "ENACTUS is a community of students, academics, and business leaders dedicated to leveraging entrepreneurial action to improve lives and create a better world. The society focuses on innovative solutions and social impact, empowering members to make a positive difference through collaboration and entrepreneurship."
  },
  {
    "image": "assets/images/eureka.jpg",
    "name": "EUREKA",
    "text": "The objective behind developing this society was to promote research ambience amongst our UG students through organizing competitions, expert talks, seminars, webinars,some technical sessions and encouraging them to write research articles."
  },
  {
    "image": "assets/images/gcc.png",
    "name": "GCC",
    "text": "TIET has taken special initiatives for gender sensitization. It has a Gender Champions Club which looks after the issues pertaining to gender equity in particular. Nodal teachers of this club help in providing overall guidance to the gender champions on various aspects of activity implementation."
  },
  {
    "image": "assets/images/gene.png",
    "name": "GENE",
    "text": "GENE Society aims at providing professional excellence to students in organizing technical events like seminars, workshops, guest lectures, panel discussions. The society promotes industry-academia interactions and empowers students to work collectively in a team as well as to work independently honing their leadership skills."
  },
  {
    "image": "assets/images/gut.jpg",
    "name": "GUT",
    "text": "Girl Up is a United Nations Foundation’s adolescent girl campaign. This society envisions a world where every girl can reach her full potential and lead the way to bigger dreams, healthier communities and stronger nations. The Girl Up platform exposes girls to issues at the intersection of gender equality, sports and storytelling."
  },
  {
    "image": "assets/images/iic.png",
    "name": "IIC",
    "text": "The Ministry of Human Resource Development in India has established the Innovation Cell to inspire students in colleges and universities to innovate and start their own ventures. As part of this initiative, the Institution\"s Innovation Council (IIC) at Thapar Institute of Engineering and Technology (TIET) in Patiala is actively working towards this goal."
  },
  {
    "image": "assets/images/ls.png",
    "name": "LS",
    "text": "The Literary Society aims to foster a deep appreciation for language and diverse literary expressions among students. It encourages exploration of various forms and genres, promoting a love for literature and enhancing understanding and critical appreciation of the written word."
  },
  {
    "image": "assets/images/maps.png",
    "name": "MAPS",
    "text": "To generate an interactive environment that encourages conditions for learning and stimulates personal and professional growth, providing exposure to new ideas and creativity. Major activities organized: Expert lectures on physical science, quizzes, paper presentations, organization of seminars etc."
  },
  {
    "image": "assets/images/mars.png",
    "name": "MARS",
    "text": "Mechatronics and Robotics Society (MARS) provides an ideal platform for students of Mechanical, Mechatronics, Electronics, Computers and Electrical Engineering background to hone their skills and showcase their talent in many interdisciplinary activities. MARS conducts different workshops on a regular basis."
  },
  {
    "image": "assets/images/mudra.png",
    "name": "MUDRA",
    "text": "The objective of this society is to hone the extra-curricular skills of students in the area of Music, Dramatics and developing managerial prowess contributing towards their overall personality. It organizes several big events such as MUDRA night and, Izhaar etc."
  },
  {
    "image": "assets/images/nox.png",
    "name": "NOX",
    "text": "Thapar dance club ‘NOX’ is an excellent platform for the students to augment their dancing skills through workshops conducted by professionally trained choreographers. The students showcase their dancing talents at the various events in the college and also represent the institute in various competitions."
  },

  {
    "image": "assets/images/paryavaran.png",
    "name": "PARYAVARAN",
    "text": "In the ongoing era, our fragile earth needs acute attention for its prevalence, PWS endures to maintain the biodiversity, conservation of water, air and energy resources."
  },
  {
    "image": "assets/images/pws.png",
    "name": "PRATIGYA",
    "text": "PRATIGYA, a society, is working, consistently for social welfare. This society develops teams of student volunteers from the undergraduate, post-graduate and Management programs, who teach the underprivileged kids from classes I to XII including children of class four employees of Thapar Institute as well as kids residing outside Thapar."
  },
  {
    "image": "assets/images/sm1.jfif",
    "name": "SPICMACAY",
    "text": "SPIC MACAY is a non-political nationwide voluntary movement that organises programmes of classical music and dance, folk arts, crafts, yog, classic cinema screenings, heritage walks, etc. inside school and college campuses throughout the world to make students more aware about Indian and world heritage."
  },
  {
    "image": "assets/images/somie1.png",
    "name": "SOMIE",
    "text": "SOMIE (Society of Mechanical and Industrial Engineering) is the society which helps students gain technical and practical knowledge in the field of mechanical engineering. SOMIE also acts as a bridge between students and faculty. SOMIE organizes various events like industrial tours, engine assembly workshops, technical quiz contests, guest lectures etc."
  },
  {
    "image": "assets/images/taas.png",
    "name": "TAAS",
    "text": "TAAS explores the cosmos through science and engineering, aiming to foster scientific curiosity and nurture innovative young minds. The society encourages creativity and exploration among students who may feel constrained by their engineering coursework, providing opportunities for engagement with the broader scientific community."
  },
  {
    "image": "assets/images/tac.png",
    "name": "TAC",
    "text": "A forum for adventure enthusiasts, trekkers, climbers and armchair mountaineers in the student community. It works to develop the spirit of adventure in Thaparians. While the stock activities are trekking, rock climbing and mountain cycling, the adventure club has also organized skiing and river rafting sporadically."
  },
  {
    "image": "assets/images/tietfitnessclub.png",
    "name": "TFC",
    "text": "TIET Fitness Club aims to encourage and promote the adoption of professional standards, ethical practice and conduct in the provision of Health and Fitness services. This platform is used to promote the widespread participation of students, staff and faculty to national initiatives regarding Fitness."
  },
  {
    "image": "assets/images/tmc.png",
    "name": "TMC",
    "text": "The Thapar Movie Club promotes filmmaking on academic, social, and cultural topics that affect society. It also aims to invite renowned personalities from the film industry for interactions with the TIET community, fostering a deeper engagement with cinema and its influence on contemporary issues."
  },
  {
    "image": "assets/images/toastmasters.png",
    "name": "TM",
    "text": "Thapar Toastmasters Club, a chapter of Toastmasters International is an organization that helps its members to improve their public speaking, communication and leadership skills.The club facilitates members to overcome their stage fear and improve their communication skills."
  },
  {
    "image": "assets/images/tms.png",
    "name": "TMS",
    "text": "Thapar Mathematical Society promote mathematics and its applications among the young people and in society by providing them a platform for interaction through expert talks, events, activities and workshops."
  },
  {
    "image": "assets/images/tsce.png",
    "name": "TSCE",
    "text": "TSCE was formed with the main aim of providing a platform to all the budding civil engineers to update their skills in civil engineering design and field work. TSCE organizes workshops, guest lectures, design competitions, paper reading contests in the field of civil engineering."
  },
  {
    "image": "assets/images/tumun.png",
    "name": "TUMUN",
    "text": "This Society is for all those who want to master the art of negotiation. Thapar Institute of Engineering and Technology , Model United Nations brings you the best platform for debate and negotiations and to get a rich experience in these activities."
  },
  {
    "image": "assets/images/tnt.png",
    "name": "TNT",
    "text": "Thapar Nautanki Team (TNT) aims to bring the students together who believe in change. Using the love for performing arts and showing the problems faced in the society with the help of nukkad nataks or Nautanki. Aiming towards creating awareness around topics of modern relevance that affect the society in a negative or positive way."
  },
  {
    "image": "assets/images/oorja1.png",
    "name": "URJA",
    "text": "Team Urja, a supercharged automotive crew bursting with energy, creativity, and an unquenchable thirst for greatness. We hail from the prestigious Thapar Institute of Engineering and Technology (TIET), where our passion and talent unite.Our team\"s adventure has been marked by constant expansion and impressive accomplishments."
  },
];


final List<Map<String, dynamic>> techItems =
[
  {
    'image': 'assets/images/acm.png',
    'name': 'ACM',
    'text': 'Thapar ACM Student Chapter is a technical society under the guidance of one of the most premier organizations in the computing world, ACM. Striving towards a single goal i.e. improving the coding culture at Thapar. Organizing classes and workshops for everyone in the college to enhance their skill set.'
  },
  {
    'image': 'assets/images/ashrae.png',
    'name': 'ASHRAE',
    'text': 'ASHRAE is an international technical society in the area of Heating, Refrigeration and Air Conditioning (RAC). The main objective of this society is to organise technical events and make students aware about the RAC and its emerging areas. Its standards are followed widely in the area of RAC, Green Buildings Development, HVAC Industry.'
  },
  {
    'image': 'assets/images/bck.png',
    'name': 'BCS',
    'text': 'Backslash Computing Society has been envisioned to promote and inculcate interest in the field of Computer Science for the students of Derabassi Campus. Backslash aims at providing an opportunity for technical enthusiasts to interact with each other and a platform to display and hone their skills in the wonderful world of computing.'
  },
  {
    'image': 'assets/images/ccs.png',
    'name': 'CCS',
    'text': 'Creative Computing Society strives to help the students to develop problem-solving skills in tech through various workshops and competitions. The students get to know their best lying potential and develop an analytical temperament. The society has had numerous pivotal collaborations with organisations like GDSC, Mozilla Webmaker to name a few.'
  },
  {
    'image': 'assets/images/gdsc.png',
    'name': 'GDSC',
    'text': 'Google Developer Student Clubs (DSC) are community groups for students from any academic background in their undergraduate or graduate term. By joining a DSC, students build their professional and personal network, get access to Google Developer Resources, and work together to build solutions for local problems in a peer-to-peer learning environment.'
  },
  {
    'image': 'assets/images/iei.png',
    'name': 'IEI',
    'text': 'The Institution of Engineers, India (IEI) organizes workshops, technical exams, and lecture series featuring successful professionals. This society is open to all engineering disciplines, providing valuable opportunities for students to enhance their technical knowledge and gain insights from industry experts, fostering a deeper understanding of their fields.'
  },
  {
    'image': 'assets/images/iste.png',
    'name': 'ISTE',
    'text': 'Providing guidance and training to students to develop better technical, learning skills and personality, Organise lectures by experts from industry, defence services, government departments and other institutions, Training programme on report writing, Cultural programmes and Entrepreneurship development programmes.'
  },
  {
    'image': 'assets/images/iete.png',
    'name': 'IETE',
    'text': 'The main objective of IETE society is to organise technical events which involves electronics, telecommunication, and IT as a core area. It organises events like workshop on Arduino, Line Follower, Bluetooth controlled Robots. Another objective of the society is to enhance interest and knowledge in electronics and communication area.'
  },
  {
    'image': 'assets/images/lug.png',
    'name': 'LUG',
    'text': 'The Linux Users Group connects students with real-world issues by exploring the relationship between science and technology. Members learn to critically evaluate scientific information, apply logical reasoning to problems, and understand the societal implications of scientific advancements, fostering a deeper engagement with technology and its impact on society.'
  },
  {
    'image': 'assets/images/mlsc.png',
    'name': 'MLSC',
    'text': 'Microsoft Learning Student Chapter( MLSC)  in collaboration with Microsoft aims to provide guidance, technical training, project guidance that improves students knowledge and learning skills. With various competitions and workshops around coding and problem solving skills they help the students develop the skill set required to be future ready.'
  },
  {
    'image': 'assets/images/mars.png',
    'name': 'MARS',
    'text': 'Mechatronics and Robotics Society (MARS) provides an ideal platform for students of Mechanical, Mechatronics, Electronics, Computers and Electrical Engineering background to hone their skills and showcase their talent in many interdisciplinary activities. MARS conducts different workshops, competitions, technical quizzes and expert lectures.'
  },
  {
    'image': 'assets/images/owasp.png',
    'name': 'OWASP',
    'text': 'OWASP Student Chapter aims to provide excellence in the field of network and security and encourage members to be more digitally secure. They organize workshops and guest lectures covering various fields to give a wide perspective of the area and competitions to test the knowledge of the students.'
  }
];









