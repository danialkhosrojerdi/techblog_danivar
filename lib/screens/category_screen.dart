import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:techblog_danivar/components.dart';
import 'package:techblog_danivar/consts/colors.dart';
import 'package:techblog_danivar/consts/strings.dart';
import 'package:techblog_danivar/gen/assets.gen.dart';

import '../models/fake_data.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 10;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: bodyMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  SvgPicture.asset(
                    'assets/images/tcbot.svg',
                    height: 100,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    MyStrings.successfulRegistration,
                    style: textTheme.headline4,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    style: textTheme.headline4,
                    textDirection: TextDirection.ltr,
                    decoration: InputDecoration(
                      hintText: 'نام و نام خانوادگی',
                      hintStyle: textTheme.headline5,
                    ),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Text(
                    MyStrings.chooseCats,
                    style: textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 85,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: hashtagsList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (myFavCats.contains(hashtagsList[index])) {
                                return;
                              } else {
                                myFavCats.add(hashtagsList[index]);
                              }
                            });
                          },
                          child: GetCategoryTag(
                              textTheme: textTheme, index: index),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Image.asset(
                    Assets.icons.downCatArrow.path,
                    scale: 2.5,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  _getFavCatTags(textTheme),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _getFavCatTags(TextTheme textTheme) {
    return SizedBox(
      width: double.infinity,
      height: 90,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: myFavCats.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: SolidColors.surface,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    myFavCats[index].title,
                    style: textTheme.headline4,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        myFavCats.removeAt(index);
                      });
                    },
                    icon: const Icon(
                      CupertinoIcons.delete,
                      color: Colors.grey,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
