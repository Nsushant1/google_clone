import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_clone/colors.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Gmail",
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Images",
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/images/more-apps.svg',
              colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
            ),
          ),
          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ).copyWith(right: 10),
            child: MaterialButton(
              onPressed: () {},
              color: Color(0xff2196f3),
              child: const Text(
                'Sign in ',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),

      body: Center(child: Text("Hello from web")),
    );
  }
}
