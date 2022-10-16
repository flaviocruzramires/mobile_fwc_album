import 'dart:math';

import 'package:flutter/material.dart';

import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class StickerPercentWidget extends StatelessWidget {
  final double percentual;
  const StickerPercentWidget({
    Key? key,
    required this.percentual,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: context.colors.grey,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$percentual%',
              style: context.textStyles.subtitlePrimary.copyWith(
                //color: context.colors.secondary,
                fontSize: 18,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 110,
          height: 110,
          child: Transform.rotate(
            angle: 100,
            child: CircularProgressIndicator(
              value: percentual / 100,
              color: Colors.white,
              strokeWidth: 5,
            ),
          ),
        ),
      ],
    );
  }
}
