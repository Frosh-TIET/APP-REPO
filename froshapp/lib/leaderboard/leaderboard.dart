import 'package:flutter/material.dart';
import 'leaderboard_item.dart';

class Leaderboard extends StatelessWidget {
  final List<LeaderboardItem> items;

  const Leaderboard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.0007,
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.0165),
            child: Row(
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                      color: Color(0xfff9f5ec).withOpacity(0.9),
                      fontFamily: 'Arial',
                      fontSize: screenHeight * 0.014),
                ),
                SizedBox(width: screenHeight * 0.01),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FractionallySizedBox(
                      widthFactor: item.score,
                      child: Container(
                        height: screenHeight * 0.011,
                        decoration: BoxDecoration(
                          color: Color(0xfff9f5ec).withOpacity(0.9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
