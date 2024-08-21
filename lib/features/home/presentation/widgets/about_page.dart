import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workout_diary_bloc/core/extentions/build_context_extention.dart';
import 'package:workout_diary_bloc/core/widgets/bounce_button.dart';
import 'package:workout_diary_bloc/core/widgets/small_back_button.dart';
import 'package:workout_diary_bloc/theme/colors.dart';
import 'package:workout_diary_bloc/theme/styling_constants.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MyPadding.pagePadding,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              context.locale!.about,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 30,
            ),
            const Icon(
              Icons.error_outline,
              color: MyColors.activeColor,
              size: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              context.locale!.dataStoredLocally,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: MyColors.lightGreyColor),
            ),
            const SizedBox(
              height: 30,
            ),
            const Icon(
              Icons.lightbulb_outline,
              color: MyColors.activeColor,
              size: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                context.locale!.emailInfo,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: MyColors.lightGreyColor)),
            InkWell(
              onTap: () async {
                final Uri _url = Uri(scheme: 'mailto', path: 'skeetztoon@gmial.com', query: 'subject=App feedback&body=');
                // await launchUrl(url);
                if (!await launchUrl(_url)) {
                  throw Exception('Could not launch $_url');
                }
              },
              child: Text(
                'skeetztoon@gmail.com',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: MyColors.activeColor,
                      decoration: TextDecoration.underline,
                      decorationColor: MyColors.activeColor,
                    ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomLeft,
              child: BounceButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const SmallBackButton()),
            ),
          ],
        ),
      ),
    );
  }
}
