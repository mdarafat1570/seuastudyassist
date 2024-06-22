import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:seustudyassist/coverPage/utils/constants/colors.dart';
import 'package:seustudyassist/coverPage/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/cover_page_list.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/form/field_controller.dart';
import '../../../controllers/form/form_controller.dart';

class CoverPageDropDown extends StatelessWidget {
  const CoverPageDropDown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final form = FormController.instance;
    final fieldController = FieldController.instance;
    bool isDark = CHelperFunctions.isDarkMode(context);

    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: DropdownButtonFormField2<String>(
          value: form.coverPageController.text == ""
              ? null
              : CoverPageList.coverList.firstWhere(
                  (coverPageType) =>
                      coverPageType == form.coverPageController.text,
                  orElse: () => CoverPageList.coverList[0],
                ),
          items: CoverPageList.coverList.map(
            (coverPageType) {
              return DropdownMenuItem<String>(
                value: coverPageType,
                child: Text(coverPageType),
              );
            },
          ).toList(),
          onChanged: (coverPageType) {
            form.coverPageController.text = coverPageType!;
            fieldController.fieldShow();
          },
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: const InputDecoration(
            label: Text('   CoverPage'),
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(CSizes.borderRadiusMd),
              color: isDark ? Colors.grey.shade900 : CColors.softGrey,
            ),
          ),
        ),
      ),
    );
  }
}
