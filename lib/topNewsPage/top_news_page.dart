import 'package:flutter/material.dart';
import 'package:seustudyassist/aipage2/Chatbot.dart';
import 'package:seustudyassist/aipage2/feature_box.dart';
import 'package:seustudyassist/aipage2/pallet.dart';
import 'package:seustudyassist/commonWidget/course_widget.dart';
import 'package:seustudyassist/commonWidget/slideNavigation.dart';
import 'package:seustudyassist/widgetFile/common_slidar.dart';
import 'package:url_launcher/link.dart';

class TopNewsPage extends StatefulWidget {
  const TopNewsPage({super.key});

  @override
  State<TopNewsPage> createState() => _TopNewsPageState();
}

class _TopNewsPageState extends State<TopNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Top News",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                CommonCarouselSlider(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  itemCount: courses.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return courseWidget(
                      imagePath: courses[index].imagePath,
                      courseName: courses[index].name,
                    );
                  },
                ),
              ),
            ),
            Link(
              uri: Uri.parse('https://www.facebook.com/seucc'),
              builder: (context, followLink) => InkWell(
                onTap: followLink,
                child: GestureDetector(
                  child: const FeatureBox(
                    color: Pallete.firstSuggestionBoxColor,
                    headerText: 'SEU Study Assist Ai',
                    descriptionText:
                        'A smarter way to stay organized and informed with SEU Bot',
                    imageUrl: 'assets/LgoUMS.png',
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                slideNavigationPush(Chatbot(), context);
              },
              child: const FeatureBox(
                color: Pallete.firstSuggestionBoxColor,
                headerText: 'SEU Study Assist Ai',
                descriptionText:
                    'A smarter way to stay organized and informed with SEU Bot',
                imageUrl: 'assets/LgoUMS.png',
              ),
            ),
            GestureDetector(
              onTap: () {
                slideNavigationPush(Chatbot(), context);
              },
              child: const FeatureBox(
                color: Pallete.firstSuggestionBoxColor,
                headerText: 'SEU Study Assist Ai',
                descriptionText:
                    'A smarter way to stay organized and informed with SEU Bot',
                imageUrl: 'assets/LgoUMS.png',
              ),
            ),
            GestureDetector(
              onTap: () {
                slideNavigationPush(Chatbot(), context);
              },
              child: const FeatureBox(
                color: Pallete.firstSuggestionBoxColor,
                headerText: 'SEU Study Assist Ai',
                descriptionText:
                    'A smarter way to stay organized and informed with SEU Bot',
                imageUrl: 'assets/LgoUMS.png',
              ),
            ),
            GestureDetector(
              onTap: () {
                slideNavigationPush(Chatbot(), context);
              },
              child: const FeatureBox(
                color: Pallete.firstSuggestionBoxColor,
                headerText: 'SEU Study Assist Ai',
                descriptionText:
                    'A smarter way to stay organized and informed with SEU Bot',
                imageUrl: 'assets/LgoUMS.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
