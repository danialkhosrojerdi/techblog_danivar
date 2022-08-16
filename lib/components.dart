import 'package:flutter/material.dart';

import 'consts/colors.dart';
import 'gen/assets.gen.dart';
import 'models/fake_data.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1.3,
      color: Colors.grey[700],
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class GetCategoryTag extends StatelessWidget {
  GetCategoryTag({
    Key? key,
    required this.textTheme,
    required this.index,
  }) : super(key: key);

  final TextTheme textTheme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: GradiantColors.tags,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            ImageIcon(
              AssetImage(Assets.icons.hashtagicon.path),
              color: Colors.white,
              size: 14,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              hashtagsList[index].title,
              style: textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}
