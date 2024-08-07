
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:seustudyassist/coverPage/features/personalization/controllers/services/university.dart';
import 'package:seustudyassist/coverPage/utils/constants/colors.dart';
import 'package:seustudyassist/coverPage/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/cover_page_list.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/form/form_controller.dart';

class UniversityDropDown extends StatelessWidget {
  const UniversityDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final form = FormController.instance;
    final university = University();
    bool isDark = CHelperFunctions.isDarkMode(context);

    // log('University Id: ${form.studentUniversityIdController.text}');

    return Expanded(
      child: DropdownButtonFormField2<String>(
        /// Getting last given university
        value: form.studentUniversityIdController.text == ""
            ? null
            : CoverPageList.uniVarsityList[university.getUniversityId(
                form.studentUniversityIdController.text)]['id'],

        items: CoverPageList.uniVarsityList.map(
          (varsity) {
            return DropdownMenuItem<String>(
              value: varsity['id'],
              child: Row(
                children: [
                  Image.asset(varsity['image'], width: 25),
                  const SizedBox(width: 14),
                  Text(varsity['shortName']),
                ],
              ),
            );
          },
        ).toList(),
        onChanged: (id) {
          form.studentUniversityIdController.text = id.toString();
          // log('University Id: ${form.studentUniversityIdController.text}');

          form.universityLogoController.text = university.getUniversityLogo(
            id.toString(),
          );

          form.universityShortNameController.text =
              university.getUniversityShortName(
            id.toString(),
          );

          form.universityFullNameController.text =
              university.getUniversityFullName(
            id.toString(),
          );
        },
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: const InputDecoration(
          label: Text('  University'),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(CSizes.borderRadiusMd),
            color: isDark ? Colors.grey.shade900 : CColors.softGrey,
          ),
        ),
      ),
    );
  }
}
