import 'package:flutter/material.dart';

class Mentors extends StatelessWidget {
  const Mentors({super.key});

  @override
  Widget build(BuildContext context) {
    int isLast = 66;
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.001),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
                  mainAxisSpacing: MediaQuery.of(context).size.height * 0.01,
                  childAspectRatio: 100 / 172,
                ),
                itemCount: 68,
                itemBuilder: (context, index) {
                  String imagePath = 'assets/images/img$index.webp';
                  if (isLast != index) {
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
                  } else {
                    return Container(
                      width: 100,
                      height: 172,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0),
                        borderRadius: BorderRadius.circular(27),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            color: Colors.black.withOpacity(0),
                            imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }
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
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
