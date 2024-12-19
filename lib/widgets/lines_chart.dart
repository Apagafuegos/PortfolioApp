import 'package:flutter/material.dart';
import 'package:portfolio_app/widgets/lines_bar.dart';

class LinesChart extends StatelessWidget {
  const LinesChart(
      {super.key, required this.linesOfCode, required this.fontSize});

  final Map<String, int> linesOfCode;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final totalLines = linesOfCode.values.reduce((a, b) => a + b);
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black87,
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: linesOfCode.entries.map((entry) {
                return Expanded(
                  child: Row(
                    children: [
                      LinesBar(fill: (entry.value / totalLines)),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: linesOfCode.entries
                .map(
                  (entry) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        children: [
                          Text(
                            entry.value.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontSize,
                            ),
                          ),
                          Text(
                            entry.key,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: fontSize,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
