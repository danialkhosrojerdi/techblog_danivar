import 'package:flutter/material.dart';
import 'package:techblog_danivar/consts/colors.dart';
import 'package:techblog_danivar/consts/strings.dart';
import 'package:techblog_danivar/gen/assets.gen.dart';

import '../components.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Positioned.fill(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  Assets.images.profileAvatar.path,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage(Assets.icons.bluePen.path),
                    color: SolidColors.seeMore,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    MyStrings.imageProfileEdit,
                    style: textTheme.headline3,
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                'دانیال خسروجردی',
                style: textTheme.headline4,
              ),
              Text(
                'Danial.khosrojerdi@gmail.com',
                style: textTheme.headline4,
              ),
              const SizedBox(
                height: 40,
              ),
              TechDivider(size: size),
              InkWell(
                splashColor: SolidColors.primeryColor,
                onTap: () {},
                child: SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(
                      MyStrings.myFavBlog,
                      style: textTheme.headline4,
                    ),
                  ),
                ),
              ),
              TechDivider(size: size),
              InkWell(
                splashColor: SolidColors.primeryColor,
                onTap: () {},
                child: SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(
                      MyStrings.myFavPodcast,
                      style: textTheme.headline4,
                    ),
                  ),
                ),
              ),
              TechDivider(size: size),
              InkWell(
                splashColor: SolidColors.primeryColor,
                onTap: () {},
                child: SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(
                      MyStrings.logOut,
                      style: textTheme.headline4,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
