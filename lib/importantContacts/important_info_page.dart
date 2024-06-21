import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:seustudyassist/base/AppColour.dart';

class ImportantInfoPage extends StatefulWidget {
  const ImportantInfoPage({super.key});

  @override
  State<ImportantInfoPage> createState() => _ImportantInfoPageState();
}

class _ImportantInfoPageState extends State<ImportantInfoPage> {
  final List<ContactCategory> categories = [
    ContactCategory(
      title: "Department of Admission & Promotion",
      icon: Icons.school,
      contacts: [
        ContactDetails("Number 1", "01766348518", "admission@seu.edu.bd"),
        ContactDetails("Number 2", "01911781327", "admission@seu.edu.bd"),
        ContactDetails("Number 3", "01632261081", "admission@seu.edu.bd"),
      ],
    ),
    ContactCategory(
      title: "Accounts & Finance Office",
      icon: Icons.account_balance,
      contacts: [
        ContactDetails("BBA, Law, English, Economics, MDS, Bangla",
            "01680180663", "accounts@seu.edu.bd"),
        ContactDetails(
            "CSE, MBA, Pharmacy", "01925734040", "accounts@seu.edu.bd"),
        ContactDetails(
            "Textile, EEE, Architecture", "01981614226", "accounts@seu.edu.bd"),
      ],
    ),
    ContactCategory(
      title: "Controller of Examinations Office",
      icon: Icons.assignment,
      contacts: [
        ContactDetails("Direct", "02-2226603628", "controller.exam@seu.edu.bd"),
        ContactDetails("Number 1", "02-2226603615-18", "info.exam@seu.edu.bd"),
      ],
    ),
    ContactCategory(
      title: "Respective Program Office",
      icon: Icons.business,
      contacts: [
        ContactDetails("CSE", "01590043424", "cse.office@seu.edu.bd"),
        ContactDetails("MBA", "01923086986", "mba.office@seu.edu.bd"),
        ContactDetails("Architecture", "", "arch.office@seu.edu.bd"),
        ContactDetails("BBA", "", "bba.office@seu.edu.bd"),
        ContactDetails("Bangla", "", "ban.office@seu.edu.bd"),
        ContactDetails("EEE", "", "eee.office@seu.edu.bd"),
        ContactDetails("Economics", "", "eco.office@seu.edu.bd"),
        ContactDetails("English", "", "eng.office@seu.edu.bd"),
        ContactDetails("Law", "", "dlj.office@seu.edu.bd"),
        ContactDetails("MDS", "", "dds.office@seu.edu.bd"),
        ContactDetails("Pharmacy", "", "pharm.office@seu.edu.bd"),
        ContactDetails("Textile", "", "tex.office@seu.edu.bd"),
      ],
    ),
    ContactCategory(
      title: "Respective Program Coordinator/Department Head",
      icon: Icons.supervisor_account,
      contacts: [
        ContactDetails("Architecture", "", "arch.coordinators@seu.edu.bd"),
        ContactDetails("BBA", "", "bba.coordinators@seu.edu.bd"),
        ContactDetails("Bangla", "", "ban.coordinators@seu.edu.bd"),
        ContactDetails("CSE", "", "cse.coordinators@seu.edu.bd"),
        ContactDetails("EEE", "", "eee.coordinators@seu.edu.bd"),
        ContactDetails("Economics", "", "eco.coordinators@seu.edu.bd"),
        ContactDetails("English", "", "eng.coordinators@seu.edu.bd"),
        ContactDetails("Law", "", "dlj.coordinators@seu.edu.bd"),
        ContactDetails("MBA", "", "mba.coordinators@seu.edu.bd"),
        ContactDetails("MDS", "", "dds.coordinators@seu.edu.bd"),
        ContactDetails("Pharmacy", "", "pharm.coordinators@seu.edu.bd"),
        ContactDetails("Textile", "", "tex.coordinators@seu.edu.bd"),
      ],
    ),
    ContactCategory(
      title: "Library Office",
      icon: Icons.local_library,
      contacts: [
        ContactDetails("Number", "01977938844", "librarian@seu.edu.bd"),
      ],
    ),
    ContactCategory(
      title: "Integrated Software Development Team",
      icon: Icons.developer_mode,
      contacts: [
        ContactDetails("ISDT", "N/A", "isdt@seu.edu.bd"),
      ],
    ),
    ContactCategory(
      title: "Career & Professional Development Services",
      icon: Icons.work,
      contacts: [
        ContactDetails("CPDS", "N/A", "cpds@seu.edu.bd"),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Important Info SEU",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: categories.map((category) {
            return ContactCategoryWidget(category: category);
          }).toList(),
        ),
      ),
    );
  }
}

class ContactCategory {
  final String title;
  final IconData icon;
  final List<ContactDetails> contacts;

  ContactCategory(
      {required this.title, required this.icon, required this.contacts});
}

class ContactDetails {
  final String description;
  final String phoneNumber;
  final String email;

  ContactDetails(this.description, this.phoneNumber, this.email);
}

class ContactCategoryWidget extends StatelessWidget {
  final ContactCategory category;

  ContactCategoryWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: const Color.fromARGB(255, 255, 255, 255),
      color: AppColor.white,
      child: ExpansionTile(
        leading: Icon(category.icon, color: Colors.black),
        title: Text(category.title),
        children: category.contacts.map((contact) {
          return ListTile(
            title: Text(contact.description),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (contact.phoneNumber.isNotEmpty)
                      IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () => _launchPhone(contact.phoneNumber),
                      ),
                    if (contact.phoneNumber.isNotEmpty)
                      Text('Phone: ${contact.phoneNumber}'),
                  ],
                ),
                Row(
                  children: [
                    if (contact.email.isNotEmpty)
                      IconButton(
                        icon: Icon(Icons.email),
                        onPressed: () => _launchEmail(contact.email),
                      ),
                    if (contact.email.isNotEmpty)
                      Text('Email: ${contact.email}'),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  void _launchPhone(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  void _launchEmail(String email) async {
    final Uri url = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $email';
    }
  }
}
