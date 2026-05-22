import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';

class InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoChip({super.key, 
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorManager.purpleWhiteColor ,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
             
              Expanded(
                child: Text(
                  label,
                  maxLines: 5,
                  textAlign: TextAlign.left,
                  style:  TextStyle(
                    fontSize: 14,
                    
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1C1B1F),
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}