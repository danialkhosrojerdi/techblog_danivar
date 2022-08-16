import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:techblog_danivar/consts/strings.dart';
import 'package:techblog_danivar/screens/category_screen.dart';
import 'package:validators/validators.dart';

class RegisterIntroScreen extends StatelessWidget {
  const RegisterIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/tcbot.svg', height: 100),
              const SizedBox(
                height: 32,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: textTheme.headline4,
                  text: MyStrings.welcome,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () {
                  _getEmailBottomSheet(context, size, textTheme);
                },
                child: const Text(
                  'بزن بریم',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _getActiveCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: ((context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyStrings.activateCode,
                  style: textTheme.headline4,
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: TextField(
                    style: textTheme.headline5,
                    textDirection: TextDirection.ltr,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        hintText: '******',
                        hintStyle: textTheme.headline5,
                        hintTextDirection: TextDirection.ltr),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const CategoryScreen(),
                      ),
                    );
                  },
                  child: const Text('ادامه'),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Future<dynamic> _getEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: ((context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyStrings.insertYourEmail,
                  style: textTheme.headline4,
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: TextField(
                    style: textTheme.headline5,
                    textDirection: TextDirection.ltr,
                    onChanged: (value) {
                      print('${value}is Email = ${isEmail(value)}');
                    },
                    decoration: InputDecoration(
                        hintText: 'tech@techblog.com',
                        hintStyle: textTheme.headline5,
                        hintTextDirection: TextDirection.ltr),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _getActiveCodeBottomSheet(context, size, textTheme);
                  },
                  child: const Text('ادامه'),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
