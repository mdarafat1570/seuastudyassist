import 'package:flutter/material.dart';
import 'package:seustudyassist/coverPage/common/styles/pdf_view/pdf_spacing.dart';
import 'package:seustudyassist/coverPage/utils/constants/image_strings.dart';
import 'package:seustudyassist/coverPage/utils/constants/sizes.dart';
import 'package:url_launcher/link.dart';

class DevelopInfoPage extends StatefulWidget {
  const DevelopInfoPage({super.key});

  @override
  State<DevelopInfoPage> createState() => _DevelopInfoPageState();
}

class _DevelopInfoPageState extends State<DevelopInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Developer Info",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  borderOnForeground: true,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.teal,
                              radius: 20,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage(CImages.me), //NetworkImage
                                radius: 20,
                              ),
                            ),
                            const SizedBox(width: PDFSpacing.spaceBtwSection),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "MD Arafat Mia",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  "Mobile App Developer",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: CSizes.spaceBtwInputFields - 4),
                        Text(
                          "Assalamu Alaikum. If you face any bug or error kindly inform me.",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const SizedBox(height: CSizes.spaceBtwInputFields - 4),
                        Row(
                          children: [
                            Link(
                              uri: Uri.parse(
                                  'mailto:mohammadarafat.dev@gmail.com'),
                              builder: (context, followLink) => InkWell(
                                onTap: followLink,
                                child: SizedBox(
                                  height: CSizes.iconMd - 2,
                                  child: Image.asset(
                                    CImages.emailLogo,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Link(
                              uri: Uri.parse('https://www.linkedin.com/in/'),
                              builder: (context, followLink) => InkWell(
                                onTap: followLink,
                                child: SizedBox(
                                    height: CSizes.iconMd,
                                    child: Image.asset(
                                      CImages.linkedinLogo,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Link(
                              uri: Uri.parse('https://github.com/'),
                              builder: (context, followLink) => InkWell(
                                onTap: followLink,
                                child: SizedBox(
                                  height: CSizes.iconMd - 4,
                                  child: Image.asset(
                                    CImages.githubLogo,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Link(
                              uri: Uri.parse('http://t.me/'),
                              builder: (context, followLink) => InkWell(
                                onTap: followLink,
                                child: SizedBox(
                                  height: CSizes.iconMd - 4,
                                  child: Image.asset(
                                    CImages.telegramLogo,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: Card(
                  borderOnForeground: true,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.teal,
                              radius: 20,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage(CImages.me), //NetworkImage
                                radius: 20,
                              ),
                            ),
                            const SizedBox(width: PDFSpacing.spaceBtwSection),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Azizul Hakim",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  "Mobile App Developer",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: CSizes.spaceBtwInputFields - 4),
                        Text(
                          "Assalamu Alaikum. If you face any bug or error kindly inform me.",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const SizedBox(height: CSizes.spaceBtwInputFields - 4),
                        Row(
                          children: [
                            Link(
                              uri: Uri.parse('mailto:@gmail.com'),
                              builder: (context, followLink) => InkWell(
                                onTap: followLink,
                                child: SizedBox(
                                  height: CSizes.iconMd - 2,
                                  child: Image.asset(
                                    CImages.emailLogo,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Link(
                              uri: Uri.parse('https://www.linkedin.com/in//'),
                              builder: (context, followLink) => InkWell(
                                onTap: followLink,
                                child: SizedBox(
                                    height: CSizes.iconMd,
                                    child: Image.asset(
                                      CImages.linkedinLogo,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Link(
                              uri: Uri.parse('https://github.com/hafizflow'),
                              builder: (context, followLink) => InkWell(
                                onTap: followLink,
                                child: SizedBox(
                                  height: CSizes.iconMd - 4,
                                  child: Image.asset(
                                    CImages.githubLogo,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Link(
                              uri: Uri.parse('http://t.me/hafizflow45'),
                              builder: (context, followLink) => InkWell(
                                onTap: followLink,
                                child: SizedBox(
                                  height: CSizes.iconMd - 4,
                                  child: Image.asset(
                                    CImages.telegramLogo,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
