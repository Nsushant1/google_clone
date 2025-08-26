import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/services/api_service.dart';
import 'package:google_clone/widgets/search_footer.dart';
import 'package:google_clone/widgets/search_header.dart';
import 'package:google_clone/widgets/search_result_component.dart';
import 'package:google_clone/widgets/search_tabs.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen({
    super.key,
    required this.searchQuery,
    required this.start,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Title(
      color: Colors.blue,
      title: searchQuery,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              //!web header
              const SearchHeader(),

              //!tab for news
              Padding(
                padding: EdgeInsets.only(
                  left: size.width <= 768 ? 10 : 150,
                  top: 15,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: const SearchTabs(),
                ),
              ),
              const Divider(height: 0, thickness: 1),

              //! search result
              FutureBuilder(
                future: ApiService().fetchData(
                  queryTerm: searchQuery,
                  start: start,
                ),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: size.width <= 768 ? 10 : 150,
                                top: 15,
                              ),
                              child: Text(
                                'About${snapshot.data?['searchInformation']['formattedTotalResults']}results${snapshot.data?['searchInformation']['formattedSearchTime']}seconds',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            ListView.builder(
                              itemCount: snapshot.data?['items'].length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final item = snapshot.data?['items'][index];
                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: size.width <= 768 ? 10 : 150,
                                        top: 10,
                                      ),
                                      child: SearchResultComponent(
                                        desc: item['snippet'],
                                        linkToGo: item['link'],
                                        link: item['formattedUrl'],
                                        text: item['title'],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                        //!pagination button
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  if (start != "0") {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => SearchScreen(
                                          searchQuery: searchQuery,
                                          start: (int.parse(start) - 10)
                                              .toString(),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  '<prev',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: blueColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SearchScreen(
                                        searchQuery: searchQuery,
                                        start: (int.parse(start) + 10)
                                            .toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'next>',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: blueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        const SearchFooter(),
                      ],
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
