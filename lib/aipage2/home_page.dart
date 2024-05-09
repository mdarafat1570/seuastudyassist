import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:seustudyassist/aipage2/Chatbot.dart';
import 'package:seustudyassist/aipage2/feature_box.dart';
import 'package:seustudyassist/aipage2/pallet.dart';
import 'package:seustudyassist/commonWidget/slideNavigation.dart';

class AiHomePage extends StatefulWidget {
  const AiHomePage({Key? key}) : super(key: key);

  @override
  State<AiHomePage> createState() => _AiHomePageState();
}

class _AiHomePageState extends State<AiHomePage> {
  late String _greeting = '';

  @override
  void initState() {
    super.initState();
    _updateGreeting();
  }

  void _updateGreeting() {
    var hour = DateTime.now().hour;
    if (hour >= 4 && hour < 12) {
      setState(() {
        _greeting = 'Good Morning';
      });
    } else if (hour >= 12 && hour < 15) {
      setState(() {
        _greeting = 'Good Afternoon';
      });
    } else if (hour >= 15 && hour < 22) {
      setState(() {
        _greeting = 'Good Evening';
      });
    } else {
      setState(() {
        _greeting = 'Good Day';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SEU'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Pallete.assistantCircleColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 123,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/virtualAssistant.png',
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Pallete.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      '$_greeting, Sir/Mam what task can I do for you ?',
                      textStyle: const TextStyle(
                        fontFamily: 'Cera Pro',
                        color: Pallete.mainFontColor,
                        fontSize: 16,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  isRepeatingAnimation: false,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Here are a few commands.",
                style: TextStyle(
                  fontFamily: 'Cera Pro',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 5),
            const FeatureBox(
              color: Pallete.firstSuggestionBoxColor,
              headerText: 'Text-to-Picture',
              descriptionText:
                  'Get inspired and stay creative with your personal assistant powered by Dall-E !',
              imageUrl: 'assets/chatbot_image.png',
            ),
            const SizedBox(height: 5),
            const FeatureBox(
              color: Pallete.firstSuggestionBoxColor,
              headerText: 'Smart Voice Assistant',
              descriptionText:
                  'Get the best of both worlds with a voice assistant powered by Dall-E and ChatBot',
              imageUrl: 'assets/chatbot_image.png',
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.mic),
      ),
    );
  }
}
