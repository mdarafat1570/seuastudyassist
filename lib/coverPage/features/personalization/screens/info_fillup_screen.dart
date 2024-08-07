import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seustudyassist/coverPage/common/widgets/info_fillup/section_divider.dart';
import 'package:seustudyassist/coverPage/features/personalization/controllers/form/date_controller.dart';
import 'package:seustudyassist/coverPage/features/personalization/controllers/services/show_snackbar.dart';
import 'package:seustudyassist/coverPage/features/personalization/screens/pdf_view_screen.dart';
import 'package:seustudyassist/coverPage/features/personalization/screens/widgets/info_fillup/app_drawer.dart';
import 'package:seustudyassist/coverPage/features/personalization/screens/widgets/info_fillup/cover_page_dropdown.dart';
import 'package:seustudyassist/coverPage/features/personalization/screens/widgets/info_fillup/toggle_theme_button.dart';
import 'package:seustudyassist/coverPage/features/personalization/screens/widgets/info_fillup/university_dropdown.dart';
import 'package:seustudyassist/coverPage/utils/constants/sizes.dart';
import 'package:seustudyassist/coverPage/utils/helpers/helper_functions.dart';
import '../../../common/widgets/info_fillup/text_form_field.dart';
import '../controllers/form/field_controller.dart';
import '../controllers/form/form_controller.dart';
import '../controllers/services/student_local_storage.dart';

class InfoFillUpScreen extends StatefulWidget {
  const InfoFillUpScreen({super.key});

  @override
  State<InfoFillUpScreen> createState() => _InfoFillUpScreenState();
}

class _InfoFillUpScreenState extends State<InfoFillUpScreen> {
  final date = DateController.instance;
  final form = FormController.instance;
  final localStorage = StudentLocalStorage();

  @override
  void initState() {
    super.initState();
    localStorage.getStudentInfo();
    Get.put(FieldController());
    Get.put(FormController());
    Get.put(DateController());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Cover Page",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
              left: CSizes.defaultSpace,
              right: CSizes.defaultSpace,
              top: CSizes.verticalSpace,
              bottom: 32,
            ),
            child: Column(
              children: [
                /// CoverPage & University
                const Row(
                  children: [
                    CoverPageDropDown(),
                    SizedBox(width: CSizes.spaceBtwInputFields),
                    UniversityDropDown(),
                  ],
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields),

                /// Course Code & Name
                Row(
                  children: [
                    Expanded(
                      child: CTextFormField(
                        label: 'Course Code',
                        prefixIcon: Iconsax.scroll,
                        controller: form.courseCodeController,
                        maxLength: 10,
                      ),
                    ),
                    const SizedBox(width: CSizes.spaceBtwInputFields),
                    Expanded(
                      child: CTextFormField(
                        label: 'Course Name',
                        prefixIcon: Iconsax.code,
                        controller: form.courseNameController,
                        maxLength: 50,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields),

                GetBuilder<FieldController>(
                  builder: (controller) {
                    if (controller.isAssignment) {
                      // log(controller.isAssignment.toString());
                      return CTextFormField(
                        label: 'Title',
                        prefixIcon: Iconsax.edit,
                        controller: form.titleController,
                        maxLength: 100,
                      );
                    }
                    // log(controller.isAssignment.toString());
                    return Row(
                      children: [
                        Expanded(
                          child: CTextFormField(
                            label: 'Experiment No',
                            prefixIcon: Iconsax.note,
                            controller: form.experimentNoController,
                            maxLength: 6,
                            keyBoardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: CSizes.spaceBtwInputFields),
                        Expanded(
                          child: CTextFormField(
                            label: 'Experiment Name',
                            prefixIcon: Iconsax.lamp_charge,
                            controller: form.experimentNameController,
                            maxLength: 100,
                          ),
                        ),
                      ],
                    );
                  },
                ),

                /// Teacher Name, Department &
                const CSectionDivider(dividerText: 'Faculty Information'),
                CTextFormField(
                  label: 'Teacher Name',
                  prefixIcon: Iconsax.teacher,
                  controller: form.teacherNameController,
                  maxLength: 40,
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: CTextFormField(
                        label: 'Department',
                        prefixIcon: Iconsax.courthouse,
                        controller: form.teacherDepartmentController,
                        maxLength: 50,
                      ),
                    ),
                    const SizedBox(width: CSizes.spaceBtwInputFields),
                    Expanded(
                      child: CTextFormField(
                        label: 'Designation',
                        prefixIcon: Iconsax.activity,
                        controller: form.teacherDesignationController,
                        maxLength: 40,
                      ),
                    ),
                  ],
                ),

                /// Student Name, Department, Section & Semester
                const CSectionDivider(dividerText: 'Student Information'),
                Row(
                  children: [
                    Expanded(
                      child: CTextFormField(
                        label: 'Name',
                        prefixIcon: Iconsax.user_edit,
                        controller: form.studentNameController,
                        maxLength: 50,
                      ),
                    ),
                    const SizedBox(width: CSizes.spaceBtwInputFields),
                    Expanded(
                      child: CTextFormField(
                        label: 'Student-ID',
                        prefixIcon: Iconsax.personalcard,
                        controller: form.studentIdController,
                        maxLength: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: CTextFormField(
                        label: 'Section',
                        prefixIcon: Iconsax.layer,
                        controller: form.studentSectionController,
                        maxLength: 20,
                      ),
                    ),
                    const SizedBox(width: CSizes.spaceBtwInputFields),
                    Expanded(
                      child: CTextFormField(
                        label: 'Department',
                        prefixIcon: Iconsax.pen_tool,
                        controller: form.studentDeptController,
                        maxLength: 50,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: CTextFormField(
                        label: 'Semester',
                        prefixIcon: Iconsax.keyboard,
                        controller: form.studentSemesterController,
                        maxLength: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                CTextFormField(
                  label: 'Date',
                  prefixIcon: Iconsax.calendar_search,
                  onTap: () => date.datePicker(context),
                  controller: date.submissionDateController,
                  readOnly: true,
                ),
                const SizedBox(height: CSizes.spaceBtwSections),

                /// Generate Pdf Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const PDFViewScreen());
                      localStorage.setStudentInfo();
                      ShowShowSnackBar().getSnackBar()
                          ? CHelperFunctions.showToastMessage(
                              "Successfully PDF crated",
                              Colors.green,
                            )
                          : CHelperFunctions.showToastMessage(
                              "Please enter all the information",
                              Colors.red,
                            );
                    },
                    child: const Text('Generate PDF'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
