import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms_app/helpers/auth_helper.dart';
import 'package:lms_app/utils/assets_manager.dart';
import 'package:lms_app/utils/themes.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: SvgPicture.asset(SvgManager.avatar),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: AuthHelper.getUser(),
                  builder: (context, snapshot) {
                    return TextFormat.bold(
                      text: 'Hi ${snapshot.data?.fullname ?? 'Guest'},',
                      textColor: Colors.white,
                    );
                  },
                ),
                TextFormat.small(
                  text: "Let's start learning",
                  fontWeight: FontWeight.w300,
                  textColor: Colors.white,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
