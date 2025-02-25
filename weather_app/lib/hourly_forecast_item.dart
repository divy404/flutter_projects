import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final String value;

  const HourlyForecastItem({
    super.key,
    required this.label,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Align elements properly
          children: [
            Text(
              label, // Use variable instead of string literal
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              value, // Use variable instead of string literal
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
