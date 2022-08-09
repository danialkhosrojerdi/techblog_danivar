import 'package:flutter/material.dart';
import 'package:techblog_danivar/consts/colors.dart';
import 'package:techblog_danivar/gen/assets.gen.dart';
import 'package:techblog_danivar/models/fake_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.menu),
                Image(
                  image: AssetImage(Assets.images.logo.path),
                  height: size.height / 13.6,
                ),
                const Icon(Icons.search),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                width: size.width / 1.19,
                height: size.height / 4.2,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  image: DecorationImage(
                    image: AssetImage(homePagePosterMap['imageAsset']),
                    fit: BoxFit.cover,
                  ),
                ),
                foregroundDecoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  gradient: LinearGradient(
                    colors: GradiantColors.homePosterCoverGradiant,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          homePagePosterMap['writer'] +
                              ' - ' +
                              homePagePosterMap['date'],
                          style: textTheme.subtitle1,
                        ),
                        Row(
                          children: [
                            Text(
                              homePagePosterMap['view'],
                              style: textTheme.subtitle1,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            const Icon(
                              Icons.remove_red_eye_sharp,
                              size: 16,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    homePagePosterMap['title'],
                    style: textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
