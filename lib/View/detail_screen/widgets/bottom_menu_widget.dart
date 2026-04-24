import 'package:flutter/material.dart';
import 'package:hellofood/view/theme.dart';

class BottomMenuWidgets extends StatelessWidget {
  const BottomMenuWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Icon(
              Icons.timelapse_outlined,
              color: Colors.indigoAccent,
              size: 38,
            ),
            const SizedBox(height: 12.0),
            Text(
              '12am-3pm',
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.gray),
            ),
          ],
        ),
        Column(
          children: [
            Icon(Icons.directions, color: AppColors.green, size: 38),
            const SizedBox(height: 12.0),
            Text(
              '3.5km',
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.gray),
            ),
          ],
        ),
        Column(
          children: [
            Icon(Icons.map, color: Colors.pink, size: 38),
            const SizedBox(height: 12.0),
            Text(
              'Map View',
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.gray),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.directions_bike_outlined,
              color: Colors.orange[800],
              size: 38,
            ),
            const SizedBox(height: 12.0),
            Text(
              'Delivery',
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.gray),
            ),
          ],
        ),
      ],
    );
  }
}
