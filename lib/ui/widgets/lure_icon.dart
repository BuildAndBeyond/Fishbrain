import 'package:flutter/material.dart';

class LureIcon extends StatelessWidget {
  final String mode;
  final String? lureType;
  final String? baitType;
  final double size;

  const LureIcon({
    super.key,
    required this.mode,
    this.lureType,
    this.baitType,
    this.size = 36,
  });

  @override
  Widget build(BuildContext context) {
    final isPredator = mode == 'Raubfisch';
    final icon = isPredator ? _iconForLure(lureType) : _iconForBait(baitType);
    final color = isPredator ? _colorForLure(lureType) : _colorForBait(baitType);

    return CircleAvatar(
      radius: size / 2,
      backgroundColor: color.withOpacity(0.2),
      child: Icon(icon, color: color, size: size * 0.55),
    );
  }

  IconData _iconForLure(String? lureType) {
    switch (lureType) {
      case 'Gummifisch':
        return Icons.waves;
      case 'Wobbler':
        return Icons.motion_photos_on;
      case 'Spinner':
        return Icons.autorenew;
      case 'Jig/Creature':
        return Icons.bug_report;
      case 'Dropshot':
        return Icons.sensors;
      case 'Posenfischen':
        return Icons.sports_handball;
      case 'Texas/Carolina':
        return Icons.hub;
      case 'Jerkbait':
        return Icons.flash_on;
      case 'Sonstiges':
        return Icons.sports_fishing;
      default:
        return Icons.sports_fishing;
    }
  }

  Color _colorForLure(String? lureType) {
    switch (lureType) {
      case 'Gummifisch':
        return Colors.blue;
      case 'Wobbler':
        return Colors.deepPurple;
      case 'Spinner':
        return Colors.orange;
      case 'Jig/Creature':
        return Colors.green;
      case 'Dropshot':
        return Colors.teal;
      case 'Posenfischen':
        return Colors.lightBlue;
      case 'Texas/Carolina':
        return Colors.brown;
      case 'Jerkbait':
        return Colors.redAccent;
      case 'Sonstiges':
        return Colors.blueGrey;
      default:
        return Colors.blueGrey;
    }
  }

  IconData _iconForBait(String? baitType) {
    switch (baitType) {
      case 'Boilie':
        return Icons.adjust;
      case 'Pop-Up':
        return Icons.bubble_chart;
      case 'Wafter':
        return Icons.album;
      case 'Mais':
        return Icons.grain;
      case 'Tigernuss':
        return Icons.eco;
      case 'Sonstiges':
        return Icons.lunch_dining;
      default:
        return Icons.lunch_dining;
    }
  }

  Color _colorForBait(String? baitType) {
    switch (baitType) {
      case 'Boilie':
        return Colors.brown;
      case 'Pop-Up':
        return Colors.pink;
      case 'Wafter':
        return Colors.orange;
      case 'Mais':
        return Colors.amber;
      case 'Tigernuss':
        return Colors.brown.shade600;
      case 'Sonstiges':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
}
