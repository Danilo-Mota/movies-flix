import 'package:flutter/material.dart';

import '../../style/app_colors.dart';
import '../../style/app_fonts.dart';
import '../../utils/constants.dart';

abstract class MovieItemViewHolderProtocol {
  String get title;
  String get posterPath;
}

class MovieItemView extends StatelessWidget {
  final MovieItemViewHolderProtocol viewHolder;

  const MovieItemView({super.key, required this.viewHolder});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                '${Constants.imageBaseURL}${viewHolder.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          viewHolder.title,
          style: AppFonts.nunitoSemiBold(16, AppColors.white),
          maxLines: 2,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
