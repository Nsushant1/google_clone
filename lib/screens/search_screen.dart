import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/widgets/search_footer.dart';
import 'package:google_clone/widgets/search_header.dart';
import 'package:google_clone/widgets/search_tabs.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            //!web header
            const SearchHeader(),

            //!tab for news
            const Padding(
              padding: EdgeInsets.only(left: 150),
              child: SearchTabs(),
            ),
            const Divider(height: 0, thickness: 1),

            //! search result


            //!pagination button
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      '<prev',
                      style: TextStyle(fontSize: 15, color: blueColor),
                    ),
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'next>',
                      style: TextStyle(fontSize: 15, color: blueColor),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            const SearchFooter(),
          ],
        ),
      ),
    );
  }
}
