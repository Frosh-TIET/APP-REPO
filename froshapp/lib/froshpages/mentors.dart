import 'package:flutter/material.dart';

class Mentors extends StatelessWidget {
  const Mentors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
                  mainAxisSpacing: MediaQuery.of(context).size.height * 0.01,
                  childAspectRatio: 100 / 172,
                ),
                itemCount: 17,
                itemBuilder: (context, index) {
                  String imagePath = 'assets/images/image$index.png';
                  return Container(
                    width: 100,
                    height: 172,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(27),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(27),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildElevatedButton(BuildContext context, String text, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          backgroundColor: text == 'MENTORS'
              ? const Color(0xFF00A46D)
              : const Color(0xFF006C48),
          foregroundColor: const Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.5),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}