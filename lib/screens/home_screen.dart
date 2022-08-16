import 'package:flutter/material.dart';
import 'package:techblog_danivar/consts/colors.dart';
import 'package:techblog_danivar/gen/assets.gen.dart';
import 'package:techblog_danivar/screens/blog_screen.dart';
import 'package:techblog_danivar/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedPageIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 20;

    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Image.asset(
                Assets.images.logo.path,
                scale: 3,
              ),
            ),
            ListTile(
              title: Text(
                'پروفایل کاربری',
                style: textTheme.headline4,
              ),
              onTap: () {},
            ),
            const Divider(
              color: SolidColors.dividerColor,
            ),
            ListTile(
              title: Text(
                'درباره تک بلاگ',
                style: textTheme.headline4,
              ),
              onTap: () {},
            ),
            const Divider(
              color: SolidColors.dividerColor,
            ),
            ListTile(
              title: Text(
                'اشتراک گذاری تک بلاگ',
                style: textTheme.headline4,
              ),
              onTap: () {},
            ),
            const Divider(
              color: SolidColors.dividerColor,
            ),
            ListTile(
              title: Text(
                'تک بلاگ در گیت‌هاب',
                style: textTheme.headline4,
              ),
              onTap: () {},
            ),
            const Divider(
              color: SolidColors.dividerColor,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: SolidColors.scafoldBg,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  _key.currentState!.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.grey,
                ),
              ),
              Image(
                image: AssetImage(Assets.images.logo.path),
                height: size.height / 13.6,
              ),
              const Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          IndexedStack(
            index: selectedPageIndex,
            children: [
              BlogScreen(
                  size: size, textTheme: textTheme, bodyMargin: bodyMargin),
              ProfileScreen(
                  size: size, textTheme: textTheme, bodyMargin: bodyMargin)
            ],
          ),
          _BottomNavigation(
            size: size,
            changeScreen: (value) {
              setState(() {
                selectedPageIndex = value;
              });
            },
          )
        ],
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({
    Key? key,
    required this.size,
    required this.changeScreen,
  }) : super(key: key);

  final Size size;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: GradiantColors.bottomNavBackgroand,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: GradiantColors.bottomNav,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => changeScreen(0),
                  icon: ImageIcon(
                    AssetImage(Assets.icons.home.path),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage(Assets.icons.write.path),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () => changeScreen(1),
                  icon: ImageIcon(
                    AssetImage(Assets.icons.user.path),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
