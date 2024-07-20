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
            vertical: screenHeight * 0.0013,
          ),
          child: Row(
            children: [
              Text(
                item.name,
                style: TextStyle(
                    color: const Color.fromRGBO(180, 196, 0, 1),
                    fontFamily: 'Arial',
                    fontSize: screenHeight * 0.0137),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: item.score,
                    child: Container(
                      height: screenHeight * 0.012,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(180, 196, 0, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
