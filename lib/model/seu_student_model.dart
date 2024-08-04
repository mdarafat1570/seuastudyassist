class DashboardModel {
  String? id;
  String? ugcId;
  Name? name;
  String? gender;
  String? mobile;
  String? email;
  String? programName;
  int? batchId;
  String? departmentName;
  EnrollingSemester? enrollingSemester;
  String? startingSemester;
  String? lastSemester;
  bool? graduated;
  var graduationDate;
  String? eligibleForDegree;
  var transferredStudent;
  int? oldStudentId;
  int? newStudentId;
  var cancelledStudent;
  var cancelledTime;
  int? runningSemester;
  int? preregisteredCourseCount;
  int? preregisteredCredits;
  int? registeredCourseCount;
  int? registeredCredits;
  String? creditsCompleted;
  String? creditsAttempted;
  var totalWaivedCredits;
  int? totalDue;
  int? minimumDue;
  var adviserInitial;
  var adviserUsername;
  var adviserName;
  var adviserDesignation;
  List<GradeList>? gradeList;
  List<RegisteredCourseList>? registeredCourseList;
  var lateFineAmount;

  DashboardModel(
      {this.id,
      this.ugcId,
      this.name,
      this.gender,
      this.mobile,
      this.email,
      this.programName,
      this.batchId,
      this.departmentName,
      this.enrollingSemester,
      this.startingSemester,
      this.lastSemester,
      this.graduated,
      this.graduationDate,
      this.eligibleForDegree,
      this.transferredStudent,
      this.oldStudentId,
      this.newStudentId,
      this.cancelledStudent,
      this.cancelledTime,
      this.runningSemester,
      this.preregisteredCourseCount,
      this.preregisteredCredits,
      this.registeredCourseCount,
      this.registeredCredits,
      this.creditsCompleted,
      this.creditsAttempted,
      this.totalWaivedCredits,
      this.totalDue,
      this.minimumDue,
      this.adviserInitial,
      this.adviserUsername,
      this.adviserName,
      this.adviserDesignation,
      this.gradeList,
      this.registeredCourseList,
      this.lateFineAmount});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ugcId = json['ugcId'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    gender = json['gender'];
    mobile = json['mobile'];
    email = json['email'];
    programName = json['programName'];
    batchId = json['batchId'];
    departmentName = json['departmentName'];
    enrollingSemester = json['enrollingSemester'] != null
        ? new EnrollingSemester.fromJson(json['enrollingSemester'])
        : null;
    startingSemester = json['startingSemester'];
    lastSemester = json['lastSemester'];
    graduated = json['graduated'];
    graduationDate = json['graduationDate'];
    eligibleForDegree = json['eligibleForDegree'];
    transferredStudent = json['transferredStudent'];
    oldStudentId = json['oldStudentId'];
    newStudentId = json['newStudentId'];
    cancelledStudent = json['cancelledStudent'];
    cancelledTime = json['cancelledTime'];
    runningSemester = json['runningSemester'];
    preregisteredCourseCount = json['preregisteredCourseCount'];
    preregisteredCredits = json['preregisteredCredits'];
    registeredCourseCount = json['registeredCourseCount'];
    registeredCredits = json['registeredCredits'];
    creditsCompleted = json['creditsCompleted'];
    creditsAttempted = json['creditsAttempted'];
    totalWaivedCredits = json['totalWaivedCredits'];
    totalDue = json['totalDue'];
    minimumDue = json['minimumDue'];
    adviserInitial = json['adviserInitial'];
    adviserUsername = json['adviserUsername'];
    adviserName = json['adviserName'];
    adviserDesignation = json['adviserDesignation'];
    if (json['gradeList'] != null) {
      gradeList = <GradeList>[];
      json['gradeList'].forEach((v) {
        gradeList!.add(new GradeList.fromJson(v));
      });
    }
    if (json['registeredCourseList'] != null) {
      registeredCourseList = <RegisteredCourseList>[];
      json['registeredCourseList'].forEach((v) {
        registeredCourseList!.add(new RegisteredCourseList.fromJson(v));
      });
    }
    lateFineAmount = json['lateFineAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ugcId'] = this.ugcId;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['gender'] = this.gender;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['programName'] = this.programName;
    data['batchId'] = this.batchId;
    data['departmentName'] = this.departmentName;
    if (this.enrollingSemester != null) {
      data['enrollingSemester'] = this.enrollingSemester!.toJson();
    }
    data['startingSemester'] = this.startingSemester;
    data['lastSemester'] = this.lastSemester;
    data['graduated'] = this.graduated;
    data['graduationDate'] = this.graduationDate;
    data['eligibleForDegree'] = this.eligibleForDegree;
    data['transferredStudent'] = this.transferredStudent;
    data['oldStudentId'] = this.oldStudentId;
    data['newStudentId'] = this.newStudentId;
    data['cancelledStudent'] = this.cancelledStudent;
    data['cancelledTime'] = this.cancelledTime;
    data['runningSemester'] = this.runningSemester;
    data['preregisteredCourseCount'] = this.preregisteredCourseCount;
    data['preregisteredCredits'] = this.preregisteredCredits;
    data['registeredCourseCount'] = this.registeredCourseCount;
    data['registeredCredits'] = this.registeredCredits;
    data['creditsCompleted'] = this.creditsCompleted;
    data['creditsAttempted'] = this.creditsAttempted;
    data['totalWaivedCredits'] = this.totalWaivedCredits;
    data['totalDue'] = this.totalDue;
    data['minimumDue'] = this.minimumDue;
    data['adviserInitial'] = this.adviserInitial;
    data['adviserUsername'] = this.adviserUsername;
    data['adviserName'] = this.adviserName;
    data['adviserDesignation'] = this.adviserDesignation;
    if (this.gradeList != null) {
      data['gradeList'] = this.gradeList!.map((v) => v.toJson()).toList();
    }
    if (this.registeredCourseList != null) {
      data['registeredCourseList'] =
          this.registeredCourseList!.map((v) => v.toJson()).toList();
    }
    data['lateFineAmount'] = this.lateFineAmount;
    return data;
  }
}

class Name {
  String? firstName;
  String? middleName;
  String? lastName;
  String? fullName;

  Name({this.firstName, this.middleName, this.lastName, this.fullName});

  Name.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['fullName'] = this.fullName;
    return data;
  }
}

class EnrollingSemester {
  int? semesterNumber;
  String? label;

  EnrollingSemester({this.semesterNumber, this.label});

  EnrollingSemester.fromJson(Map<String, dynamic> json) {
    semesterNumber = json['semesterNumber'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['semesterNumber'] = this.semesterNumber;
    data['label'] = this.label;
    return data;
  }
}

class GradeList {
  EnrollingSemester? semester;
  double? cgpa;

  GradeList({this.semester, this.cgpa});

  GradeList.fromJson(Map<String, dynamic> json) {
    semester = json['semester'] != null
        ? new EnrollingSemester.fromJson(json['semester'])
        : null;
    cgpa = json['cgpa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.semester != null) {
      data['semester'] = this.semester!.toJson();
    }
    data['cgpa'] = this.cgpa;
    return data;
  }
}

class RegisteredCourseList {
  OfferedSection? offeredSection;
  String? registrationType;
  int? credits;
  bool? registered;

  RegisteredCourseList(
      {this.offeredSection,
      this.registrationType,
      this.credits,
      this.registered});

  RegisteredCourseList.fromJson(Map<String, dynamic> json) {
    offeredSection = json['offeredSection'] != null
        ? new OfferedSection.fromJson(json['offeredSection'])
        : null;
    registrationType = json['registrationType'];
    credits = json['credits'];
    registered = json['registered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.offeredSection != null) {
      data['offeredSection'] = this.offeredSection!.toJson();
    }
    data['registrationType'] = this.registrationType;
    data['credits'] = this.credits;
    data['registered'] = this.registered;
    return data;
  }
}

class OfferedSection {
  String? id;
  Course? course;
  int? section;
  EnrollingSemester? semester;
  AcademicProgram? academicProgram;
  List<FacultyList>? facultyList;
  List<SectionScheduleList>? sectionScheduleList;
  int? sectionLimit;
  var programWiseSectionLimitList;
  var registeredStudentList;
  var wishedStudentList;
  var coursePrototype;
  var classroomCode;
  var exam;
  var sectionWiseExamMarksList;
  var sectionWiseExamSpecialGradeList;
  var marksSubmitApplicationId;
  var gradeSubmitApplicationId;
  var applicationFinalDecision;
  var note;
  var midExamDate;
  var finalExamDate;
  var gradeReceiptInformation;
  var scriptGivenInMid;
  var scriptGivenInFinal;
  var examRoomInMid;
  var invigilatorUsernameInMid;
  var invigilatorNameInMid;
  var looseSheetGivenInMid;
  var looseSheetGivenInFinal;
  var examRoomInFinal;
  var invigilatorUsernameInFinal;
  var invigilatorNameInFinal;
  var appearedStudentCountInFinal;
  var usedScriptCountInMid;
  var usedScriptCountInFinal;
  var reportedScriptCountInFinal;

  OfferedSection(
      {this.id,
      this.course,
      this.section,
      this.semester,
      this.academicProgram,
      this.facultyList,
      this.sectionScheduleList,
      this.sectionLimit,
      this.programWiseSectionLimitList,
      this.registeredStudentList,
      this.wishedStudentList,
      this.coursePrototype,
      this.classroomCode,
      this.exam,
      this.sectionWiseExamMarksList,
      this.sectionWiseExamSpecialGradeList,
      this.marksSubmitApplicationId,
      this.gradeSubmitApplicationId,
      this.applicationFinalDecision,
      this.note,
      this.midExamDate,
      this.finalExamDate,
      this.gradeReceiptInformation,
      this.scriptGivenInMid,
      this.scriptGivenInFinal,
      this.examRoomInMid,
      this.invigilatorUsernameInMid,
      this.invigilatorNameInMid,
      this.looseSheetGivenInMid,
      this.looseSheetGivenInFinal,
      this.examRoomInFinal,
      this.invigilatorUsernameInFinal,
      this.invigilatorNameInFinal,
      this.appearedStudentCountInFinal,
      this.usedScriptCountInMid,
      this.usedScriptCountInFinal,
      this.reportedScriptCountInFinal});

  OfferedSection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    course =
        json['course'] != null ? new Course.fromJson(json['course']) : null;
    section = json['section'];
    semester = json['semester'] != null
        ? new EnrollingSemester.fromJson(json['semester'])
        : null;
    academicProgram = json['academicProgram'] != null
        ? new AcademicProgram.fromJson(json['academicProgram'])
        : null;
    if (json['facultyList'] != null) {
      facultyList = <FacultyList>[];
      json['facultyList'].forEach((v) {
        facultyList!.add(new FacultyList.fromJson(v));
      });
    }
    if (json['sectionScheduleList'] != null) {
      sectionScheduleList = <SectionScheduleList>[];
      json['sectionScheduleList'].forEach((v) {
        sectionScheduleList!.add(new SectionScheduleList.fromJson(v));
      });
    }
    sectionLimit = json['sectionLimit'];
    programWiseSectionLimitList = json['programWiseSectionLimitList'];
    registeredStudentList = json['registeredStudentList'];
    wishedStudentList = json['wishedStudentList'];
    coursePrototype = json['coursePrototype'];
    classroomCode = json['classroomCode'];
    exam = json['exam'];
    sectionWiseExamMarksList = json['sectionWiseExamMarksList'];
    sectionWiseExamSpecialGradeList = json['sectionWiseExamSpecialGradeList'];
    marksSubmitApplicationId = json['marksSubmitApplicationId'];
    gradeSubmitApplicationId = json['gradeSubmitApplicationId'];
    applicationFinalDecision = json['applicationFinalDecision'];
    note = json['note'];
    midExamDate = json['midExamDate'];
    finalExamDate = json['finalExamDate'];
    gradeReceiptInformation = json['gradeReceiptInformation'];
    scriptGivenInMid = json['scriptGivenInMid'];
    scriptGivenInFinal = json['scriptGivenInFinal'];
    examRoomInMid = json['examRoomInMid'];
    invigilatorUsernameInMid = json['invigilatorUsernameInMid'];
    invigilatorNameInMid = json['invigilatorNameInMid'];
    looseSheetGivenInMid = json['looseSheetGivenInMid'];
    looseSheetGivenInFinal = json['looseSheetGivenInFinal'];
    examRoomInFinal = json['examRoomInFinal'];
    invigilatorUsernameInFinal = json['invigilatorUsernameInFinal'];
    invigilatorNameInFinal = json['invigilatorNameInFinal'];
    appearedStudentCountInFinal = json['appearedStudentCountInFinal'];
    usedScriptCountInMid = json['usedScriptCountInMid'];
    usedScriptCountInFinal = json['usedScriptCountInFinal'];
    reportedScriptCountInFinal = json['reportedScriptCountInFinal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }
    data['section'] = this.section;
    if (this.semester != null) {
      data['semester'] = this.semester!.toJson();
    }
    if (this.academicProgram != null) {
      data['academicProgram'] = this.academicProgram!.toJson();
    }
    if (this.facultyList != null) {
      data['facultyList'] = this.facultyList!.map((v) => v.toJson()).toList();
    }
    if (this.sectionScheduleList != null) {
      data['sectionScheduleList'] =
          this.sectionScheduleList!.map((v) => v.toJson()).toList();
    }
    data['sectionLimit'] = this.sectionLimit;
    data['programWiseSectionLimitList'] = this.programWiseSectionLimitList;
    data['registeredStudentList'] = this.registeredStudentList;
    data['wishedStudentList'] = this.wishedStudentList;
    data['coursePrototype'] = this.coursePrototype;
    data['classroomCode'] = this.classroomCode;
    data['exam'] = this.exam;
    data['sectionWiseExamMarksList'] = this.sectionWiseExamMarksList;
    data['sectionWiseExamSpecialGradeList'] =
        this.sectionWiseExamSpecialGradeList;
    data['marksSubmitApplicationId'] = this.marksSubmitApplicationId;
    data['gradeSubmitApplicationId'] = this.gradeSubmitApplicationId;
    data['applicationFinalDecision'] = this.applicationFinalDecision;
    data['note'] = this.note;
    data['midExamDate'] = this.midExamDate;
    data['finalExamDate'] = this.finalExamDate;
    data['gradeReceiptInformation'] = this.gradeReceiptInformation;
    data['scriptGivenInMid'] = this.scriptGivenInMid;
    data['scriptGivenInFinal'] = this.scriptGivenInFinal;
    data['examRoomInMid'] = this.examRoomInMid;
    data['invigilatorUsernameInMid'] = this.invigilatorUsernameInMid;
    data['invigilatorNameInMid'] = this.invigilatorNameInMid;
    data['looseSheetGivenInMid'] = this.looseSheetGivenInMid;
    data['looseSheetGivenInFinal'] = this.looseSheetGivenInFinal;
    data['examRoomInFinal'] = this.examRoomInFinal;
    data['invigilatorUsernameInFinal'] = this.invigilatorUsernameInFinal;
    data['invigilatorNameInFinal'] = this.invigilatorNameInFinal;
    data['appearedStudentCountInFinal'] = this.appearedStudentCountInFinal;
    data['usedScriptCountInMid'] = this.usedScriptCountInMid;
    data['usedScriptCountInFinal'] = this.usedScriptCountInFinal;
    data['reportedScriptCountInFinal'] = this.reportedScriptCountInFinal;
    return data;
  }
}

class Course {
  String? id;
  String? code;
  String? title;
  String? label;

  Course({this.id, this.code, this.title, this.label});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    title = json['title'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['title'] = this.title;
    data['label'] = this.label;
    return data;
  }
}

class AcademicProgram {
  String? id;
  String? name;
  DegreeOffered? degreeOffered;

  AcademicProgram({this.id, this.name, this.degreeOffered});

  AcademicProgram.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    degreeOffered = json['degreeOffered'] != null
        ? new DegreeOffered.fromJson(json['degreeOffered'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.degreeOffered != null) {
      data['degreeOffered'] = this.degreeOffered!.toJson();
    }
    return data;
  }
}

class DegreeOffered {
  String? id;
  String? title;
  Null? shortName;

  DegreeOffered({this.id, this.title, this.shortName});

  DegreeOffered.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortName = json['shortName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['shortName'] = this.shortName;
    return data;
  }
}

class FacultyList {
  Name? name;
  List<AddressList>? addressList;
  List<PhoneList>? phoneList;
  List<EmailAddressList>? emailAddressList;
  String? gender;
  Country? religion;
  String? nationality;
  String? bloodGroup;
  String? dateOfBirth;
  String? maritalStatus;
  List<EducationalInformationList>? educationalInformationList;
  List<PublicationList>? publicationList;
  List<WorkExperienceList>? workExperienceList;
  String? username;
  String? type;
  String? id;
  EmploymentInformation? employmentInformation;
  List<CourseTaughtList>? courseTaughtList;
  List<ResearchInterestList>? researchInterestList;
  String? createdBy;
  String? createdTime;
  bool? active;
  List<String>? accessibleProgramList;
  String? officialEmailAddress;
  List<String>? accessibleOfficeList;
  String? primaryPhoneNumber;
  String? primaryEmailAddress;

  FacultyList(
      {this.name,
      this.addressList,
      this.phoneList,
      this.emailAddressList,
      this.gender,
      this.religion,
      this.nationality,
      this.bloodGroup,
      this.dateOfBirth,
      this.maritalStatus,
      this.educationalInformationList,
      this.publicationList,
      this.workExperienceList,
      this.username,
      this.type,
      this.id,
      this.employmentInformation,
      this.courseTaughtList,
      this.researchInterestList,
      this.createdBy,
      this.createdTime,
      this.active,
      this.accessibleProgramList,
      this.officialEmailAddress,
      this.accessibleOfficeList,
      this.primaryPhoneNumber,
      this.primaryEmailAddress});

  FacultyList.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    if (json['addressList'] != null) {
      addressList = <AddressList>[];
      json['addressList'].forEach((v) {
        addressList!.add(new AddressList.fromJson(v));
      });
    }
    if (json['phoneList'] != null) {
      phoneList = <PhoneList>[];
      json['phoneList'].forEach((v) {
        phoneList!.add(new PhoneList.fromJson(v));
      });
    }
    if (json['emailAddressList'] != null) {
      emailAddressList = <EmailAddressList>[];
      json['emailAddressList'].forEach((v) {
        emailAddressList!.add(new EmailAddressList.fromJson(v));
      });
    }
    gender = json['gender'];
    religion = json['religion'] != null
        ? new Country.fromJson(json['religion'])
        : null;
    nationality = json['nationality'];
    bloodGroup = json['bloodGroup'];
    dateOfBirth = json['dateOfBirth'];
    maritalStatus = json['maritalStatus'];
    if (json['educationalInformationList'] != null) {
      educationalInformationList = <EducationalInformationList>[];
      json['educationalInformationList'].forEach((v) {
        educationalInformationList!
            .add(new EducationalInformationList.fromJson(v));
      });
    }
    if (json['publicationList'] != null) {
      publicationList = <PublicationList>[];
      json['publicationList'].forEach((v) {
        publicationList!.add(new PublicationList.fromJson(v));
      });
    }
    if (json['workExperienceList'] != null) {
      workExperienceList = <WorkExperienceList>[];
      json['workExperienceList'].forEach((v) {
        workExperienceList!.add(new WorkExperienceList.fromJson(v));
      });
    }
    username = json['username'];
    type = json['type'];
    id = json['id'];
    employmentInformation = json['employmentInformation'] != null
        ? new EmploymentInformation.fromJson(json['employmentInformation'])
        : null;
    if (json['courseTaughtList'] != null) {
      courseTaughtList = <CourseTaughtList>[];
      json['courseTaughtList'].forEach((v) {
        courseTaughtList!.add(new CourseTaughtList.fromJson(v));
      });
    }
    if (json['researchInterestList'] != null) {
      researchInterestList = <ResearchInterestList>[];
      json['researchInterestList'].forEach((v) {
        researchInterestList!.add(new ResearchInterestList.fromJson(v));
      });
    }
    createdBy = json['createdBy'];
    createdTime = json['createdTime'];
    active = json['active'];
    accessibleProgramList = json['accessibleProgramList'].cast<String>();
    officialEmailAddress = json['officialEmailAddress'];
    accessibleOfficeList = json['accessibleOfficeList'].cast<String>();
    primaryPhoneNumber = json['primaryPhoneNumber'];
    primaryEmailAddress = json['primaryEmailAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    if (this.addressList != null) {
      data['addressList'] = this.addressList!.map((v) => v.toJson()).toList();
    }
    if (this.phoneList != null) {
      data['phoneList'] = this.phoneList!.map((v) => v.toJson()).toList();
    }
    if (this.emailAddressList != null) {
      data['emailAddressList'] =
          this.emailAddressList!.map((v) => v.toJson()).toList();
    }
    data['gender'] = this.gender;
    if (this.religion != null) {
      data['religion'] = this.religion!.toJson();
    }
    data['nationality'] = this.nationality;
    data['bloodGroup'] = this.bloodGroup;
    data['dateOfBirth'] = this.dateOfBirth;
    data['maritalStatus'] = this.maritalStatus;
    if (this.educationalInformationList != null) {
      data['educationalInformationList'] =
          this.educationalInformationList!.map((v) => v.toJson()).toList();
    }
    if (this.publicationList != null) {
      data['publicationList'] =
          this.publicationList!.map((v) => v.toJson()).toList();
    }
    if (this.workExperienceList != null) {
      data['workExperienceList'] =
          this.workExperienceList!.map((v) => v.toJson()).toList();
    }
    data['username'] = this.username;
    data['type'] = this.type;
    data['id'] = this.id;
    if (this.employmentInformation != null) {
      data['employmentInformation'] = this.employmentInformation!.toJson();
    }
    if (this.courseTaughtList != null) {
      data['courseTaughtList'] =
          this.courseTaughtList!.map((v) => v.toJson()).toList();
    }
    if (this.researchInterestList != null) {
      data['researchInterestList'] =
          this.researchInterestList!.map((v) => v.toJson()).toList();
    }
    data['createdBy'] = this.createdBy;
    data['createdTime'] = this.createdTime;
    data['active'] = this.active;
    data['accessibleProgramList'] = this.accessibleProgramList;
    data['officialEmailAddress'] = this.officialEmailAddress;
    data['accessibleOfficeList'] = this.accessibleOfficeList;
    data['primaryPhoneNumber'] = this.primaryPhoneNumber;
    data['primaryEmailAddress'] = this.primaryEmailAddress;
    return data;
  }
}

class salutationName {
  String? salutationType;
  String? firstName;
  String? lastName;
  String? fullName;
  String? middleName;

  salutationName(
      {this.salutationType,
      this.firstName,
      this.lastName,
      this.fullName,
      this.middleName});

  salutationName.fromJson(Map<String, dynamic> json) {
    salutationType = json['salutationType'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    middleName = json['middleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['salutationType'] = this.salutationType;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['fullName'] = this.fullName;
    data['middleName'] = this.middleName;
    return data;
  }
}

class AddressList {
  String? id;
  String? addressType;
  String? streetAddress;
  String? division;
  String? district;
  String? subDistrict;
  String? policeStation;
  String? postOffice;
  String? postCode;
  Country? country;

  AddressList(
      {this.id,
      this.addressType,
      this.streetAddress,
      this.division,
      this.district,
      this.subDistrict,
      this.policeStation,
      this.postOffice,
      this.postCode,
      this.country});

  AddressList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressType = json['addressType'];
    streetAddress = json['streetAddress'];
    division = json['division'];
    district = json['district'];
    subDistrict = json['subDistrict'];
    policeStation = json['policeStation'];
    postOffice = json['postOffice'];
    postCode = json['postCode'];
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['addressType'] = this.addressType;
    data['streetAddress'] = this.streetAddress;
    data['division'] = this.division;
    data['district'] = this.district;
    data['subDistrict'] = this.subDistrict;
    data['policeStation'] = this.policeStation;
    data['postOffice'] = this.postOffice;
    data['postCode'] = this.postCode;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    return data;
  }
}

class Country {
  String? name;

  Country({this.name});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class PhoneList {
  String? phoneType;
  String? countryCode;
  String? number;
  bool? primary;
  String? phoneNumberAsAString;
  String? mobileNumberAsAString;
  String? phoneNumberAsString;
  String? mobileNumberAsString;

  PhoneList(
      {this.phoneType,
      this.countryCode,
      this.number,
      this.primary,
      this.phoneNumberAsAString,
      this.mobileNumberAsAString,
      this.phoneNumberAsString,
      this.mobileNumberAsString});

  PhoneList.fromJson(Map<String, dynamic> json) {
    phoneType = json['phoneType'];
    countryCode = json['countryCode'];
    number = json['number'];
    primary = json['primary'];
    phoneNumberAsAString = json['phoneNumberAsAString'];
    mobileNumberAsAString = json['mobileNumberAsAString'];
    phoneNumberAsString = json['phoneNumberAsString'];
    mobileNumberAsString = json['mobileNumberAsString'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneType'] = this.phoneType;
    data['countryCode'] = this.countryCode;
    data['number'] = this.number;
    data['primary'] = this.primary;
    data['phoneNumberAsAString'] = this.phoneNumberAsAString;
    data['mobileNumberAsAString'] = this.mobileNumberAsAString;
    data['phoneNumberAsString'] = this.phoneNumberAsString;
    data['mobileNumberAsString'] = this.mobileNumberAsString;
    return data;
  }
}

class EmailAddressList {
  String? emailType;
  String? address;
  bool? primary;

  EmailAddressList({this.emailType, this.address, this.primary});

  EmailAddressList.fromJson(Map<String, dynamic> json) {
    emailType = json['emailType'];
    address = json['address'];
    primary = json['primary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emailType'] = this.emailType;
    data['address'] = this.address;
    data['primary'] = this.primary;
    return data;
  }
}

class EducationalInformationList {
  String? board;
  String? id;
  String? degree;
  DegreeConcentration? degreeConcentration;
  DegreeResult? degreeResult;
  Country? educationalInstitute;
  int? yearOfPassing;
  String? startDate;
  String? endDate;
  int? duration;
  bool? verified;
  String? verifiedBy;
  bool? visibleInWebsite;

  EducationalInformationList(
      {this.board,
      this.id,
      this.degree,
      this.degreeConcentration,
      this.degreeResult,
      this.educationalInstitute,
      this.yearOfPassing,
      this.startDate,
      this.endDate,
      this.duration,
      this.verified,
      this.verifiedBy,
      this.visibleInWebsite});

  EducationalInformationList.fromJson(Map<String, dynamic> json) {
    board = json['board'];
    id = json['id'];
    degree = json['degree'];
    degreeConcentration = json['degreeConcentration'] != null
        ? new DegreeConcentration.fromJson(json['degreeConcentration'])
        : null;
    degreeResult = json['degreeResult'] != null
        ? new DegreeResult.fromJson(json['degreeResult'])
        : null;
    educationalInstitute = json['educationalInstitute'] != null
        ? new Country.fromJson(json['educationalInstitute'])
        : null;
    yearOfPassing = json['yearOfPassing'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    duration = json['duration'];
    verified = json['verified'];
    verifiedBy = json['verifiedBy'];
    visibleInWebsite = json['visibleInWebsite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['board'] = this.board;
    data['id'] = this.id;
    data['degree'] = this.degree;
    if (this.degreeConcentration != null) {
      data['degreeConcentration'] = this.degreeConcentration!.toJson();
    }
    if (this.degreeResult != null) {
      data['degreeResult'] = this.degreeResult!.toJson();
    }
    if (this.educationalInstitute != null) {
      data['educationalInstitute'] = this.educationalInstitute!.toJson();
    }
    data['yearOfPassing'] = this.yearOfPassing;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['duration'] = this.duration;
    data['verified'] = this.verified;
    data['verifiedBy'] = this.verifiedBy;
    data['visibleInWebsite'] = this.visibleInWebsite;
    return data;
  }
}

class DegreeConcentration {
  String? concentration;

  DegreeConcentration({this.concentration});

  DegreeConcentration.fromJson(Map<String, dynamic> json) {
    concentration = json['concentration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['concentration'] = this.concentration;
    return data;
  }
}

class DegreeResult {
  String? degreeResultType;
  String? letterGrade;
  String? rollNumber;
  double? cgpa;
  double? cgpaWithoutFourthSubject;
  int? scale;

  DegreeResult(
      {this.degreeResultType,
      this.letterGrade,
      this.rollNumber,
      this.cgpa,
      this.cgpaWithoutFourthSubject,
      this.scale});

  DegreeResult.fromJson(Map<String, dynamic> json) {
    degreeResultType = json['degreeResultType'];
    letterGrade = json['letterGrade'];
    rollNumber = json['rollNumber'];
    cgpa = json['cgpa'];
    cgpaWithoutFourthSubject = json['cgpaWithoutFourthSubject'];
    scale = json['scale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['degreeResultType'] = this.degreeResultType;
    data['letterGrade'] = this.letterGrade;
    data['rollNumber'] = this.rollNumber;
    data['cgpa'] = this.cgpa;
    data['cgpaWithoutFourthSubject'] = this.cgpaWithoutFourthSubject;
    data['scale'] = this.scale;
    return data;
  }
}

class PublicationList {
  String? id;
  String? publicationType;
  List<AuthorList>? authorList;
  PublicationInformation? publicationInformation;
  bool? localPublication;
  int? contributionPercentage;
  String? doi;
  bool? verified;
  bool? visibleInWebsite;

  PublicationList(
      {this.id,
      this.publicationType,
      this.authorList,
      this.publicationInformation,
      this.localPublication,
      this.contributionPercentage,
      this.doi,
      this.verified,
      this.visibleInWebsite});

  PublicationList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    publicationType = json['publicationType'];
    if (json['authorList'] != null) {
      authorList = <AuthorList>[];
      json['authorList'].forEach((v) {
        authorList!.add(new AuthorList.fromJson(v));
      });
    }
    publicationInformation = json['publicationInformation'] != null
        ? new PublicationInformation.fromJson(json['publicationInformation'])
        : null;
    localPublication = json['localPublication'];
    contributionPercentage = json['contributionPercentage'];
    doi = json['doi'];
    verified = json['verified'];
    visibleInWebsite = json['visibleInWebsite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['publicationType'] = this.publicationType;
    if (this.authorList != null) {
      data['authorList'] = this.authorList!.map((v) => v.toJson()).toList();
    }
    if (this.publicationInformation != null) {
      data['publicationInformation'] = this.publicationInformation!.toJson();
    }
    data['localPublication'] = this.localPublication;
    data['contributionPercentage'] = this.contributionPercentage;
    data['doi'] = this.doi;
    data['verified'] = this.verified;
    data['visibleInWebsite'] = this.visibleInWebsite;
    return data;
  }
}

class AuthorList {
  Name? name;
  String? authorType;
  String? institute;
  String? designation;
  Null? primaryPhoneNumber;
  Null? primaryEmailAddress;

  AuthorList(
      {this.name,
      this.authorType,
      this.institute,
      this.designation,
      this.primaryPhoneNumber,
      this.primaryEmailAddress});

  AuthorList.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    authorType = json['authorType'];
    institute = json['institute'];
    designation = json['designation'];
    primaryPhoneNumber = json['primaryPhoneNumber'];
    primaryEmailAddress = json['primaryEmailAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['authorType'] = this.authorType;
    data['institute'] = this.institute;
    data['designation'] = this.designation;
    data['primaryPhoneNumber'] = this.primaryPhoneNumber;
    data['primaryEmailAddress'] = this.primaryEmailAddress;
    return data;
  }
}

class NameOfTwo {
  String? firstName;
  String? fullName;

  NameOfTwo({this.firstName, this.fullName});

  NameOfTwo.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['fullName'] = this.fullName;
    return data;
  }
}

class PublicationInformation {
  String? titleOfPaper;
  String? volume;
  String? issue;
  String? edition;
  String? series;
  int? pageStart;
  int? pageEnd;
  String? issnNumber;
  String? isbnNumber;
  String? titleOfPublication;
  String? paperAbstract;
  String? publisher;
  PublisherAddress? publisherAddress;
  String? publicationDate;

  PublicationInformation(
      {this.titleOfPaper,
      this.volume,
      this.issue,
      this.edition,
      this.series,
      this.pageStart,
      this.pageEnd,
      this.issnNumber,
      this.isbnNumber,
      this.titleOfPublication,
      this.paperAbstract,
      this.publisher,
      this.publisherAddress,
      this.publicationDate});

  PublicationInformation.fromJson(Map<String, dynamic> json) {
    titleOfPaper = json['titleOfPaper'];
    volume = json['volume'];
    issue = json['issue'];
    edition = json['edition'];
    series = json['series'];
    pageStart = json['pageStart'];
    pageEnd = json['pageEnd'];
    issnNumber = json['issnNumber'];
    isbnNumber = json['isbnNumber'];
    titleOfPublication = json['titleOfPublication'];
    paperAbstract = json['paperAbstract'];
    publisher = json['publisher'];
    publisherAddress = json['publisherAddress'] != null
        ? new PublisherAddress.fromJson(json['publisherAddress'])
        : null;
    publicationDate = json['publicationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titleOfPaper'] = this.titleOfPaper;
    data['volume'] = this.volume;
    data['issue'] = this.issue;
    data['edition'] = this.edition;
    data['series'] = this.series;
    data['pageStart'] = this.pageStart;
    data['pageEnd'] = this.pageEnd;
    data['issnNumber'] = this.issnNumber;
    data['isbnNumber'] = this.isbnNumber;
    data['titleOfPublication'] = this.titleOfPublication;
    data['paperAbstract'] = this.paperAbstract;
    data['publisher'] = this.publisher;
    if (this.publisherAddress != null) {
      data['publisherAddress'] = this.publisherAddress!.toJson();
    }
    data['publicationDate'] = this.publicationDate;
    return data;
  }
}

class PublisherAddress {
  String? state;
  Country? country;
  String? district;

  PublisherAddress({this.state, this.country, this.district});

  PublisherAddress.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['district'] = this.district;
    return data;
  }
}

class WorkExperienceList {
  String? id;
  String? companyName;
  String? companyType;
  CompanyLocation? companyLocation;
  ReferencePerson? referencePerson;
  String? designation;
  String? jobResponsibility;
  String? achievement;
  String? department;
  String? startDate;
  String? endDate;
  double? duration;
  String? employmentType;
  bool? verified;
  String? verifiedBy;
  bool? visibleInWebsite;

  WorkExperienceList(
      {this.id,
      this.companyName,
      this.companyType,
      this.companyLocation,
      this.referencePerson,
      this.designation,
      this.jobResponsibility,
      this.achievement,
      this.department,
      this.startDate,
      this.endDate,
      this.duration,
      this.employmentType,
      this.verified,
      this.verifiedBy,
      this.visibleInWebsite});

  WorkExperienceList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['companyName'];
    companyType = json['companyType'];
    companyLocation = json['companyLocation'] != null
        ? new CompanyLocation.fromJson(json['companyLocation'])
        : null;
    referencePerson = json['referencePerson'] != null
        ? new ReferencePerson.fromJson(json['referencePerson'])
        : null;
    designation = json['designation'];
    jobResponsibility = json['jobResponsibility'];
    achievement = json['achievement'];
    department = json['department'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    duration = json['duration'];
    employmentType = json['employmentType'];
    verified = json['verified'];
    verifiedBy = json['verifiedBy'];
    visibleInWebsite = json['visibleInWebsite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyName'] = this.companyName;
    data['companyType'] = this.companyType;
    if (this.companyLocation != null) {
      data['companyLocation'] = this.companyLocation!.toJson();
    }
    if (this.referencePerson != null) {
      data['referencePerson'] = this.referencePerson!.toJson();
    }
    data['designation'] = this.designation;
    data['jobResponsibility'] = this.jobResponsibility;
    data['achievement'] = this.achievement;
    data['department'] = this.department;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['duration'] = this.duration;
    data['employmentType'] = this.employmentType;
    data['verified'] = this.verified;
    data['verifiedBy'] = this.verifiedBy;
    data['visibleInWebsite'] = this.visibleInWebsite;
    return data;
  }
}

class CompanyLocation {
  String? district;
  Country? country;

  CompanyLocation({this.district, this.country});

  CompanyLocation.fromJson(Map<String, dynamic> json) {
    district = json['district'];
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['district'] = this.district;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    return data;
  }
}

class ReferencePerson {
  Name? name;
  Null? primaryPhoneNumber;
  Null? primaryEmailAddress;

  ReferencePerson(
      {this.name, this.primaryPhoneNumber, this.primaryEmailAddress});

  ReferencePerson.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    primaryPhoneNumber = json['primaryPhoneNumber'];
    primaryEmailAddress = json['primaryEmailAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['primaryPhoneNumber'] = this.primaryPhoneNumber;
    data['primaryEmailAddress'] = this.primaryEmailAddress;
    return data;
  }
}

class EmploymentInformation {
  String? joiningDate;
  List<EmployeeDesignationList>? employeeDesignationList;
  bool? faculty;
  String? facultyInitials;
  String? primaryDesignation;
  String? primaryDesignationRoom;
  List<String>? primaryDesignationData;

  EmploymentInformation(
      {this.joiningDate,
      this.employeeDesignationList,
      this.faculty,
      this.facultyInitials,
      this.primaryDesignation,
      this.primaryDesignationRoom,
      this.primaryDesignationData});

  EmploymentInformation.fromJson(Map<String, dynamic> json) {
    joiningDate = json['joiningDate'];
    if (json['employeeDesignationList'] != null) {
      employeeDesignationList = <EmployeeDesignationList>[];
      json['employeeDesignationList'].forEach((v) {
        employeeDesignationList!.add(new EmployeeDesignationList.fromJson(v));
      });
    }
    faculty = json['faculty'];
    facultyInitials = json['facultyInitials'];
    primaryDesignation = json['primaryDesignation'];
    primaryDesignationRoom = json['primaryDesignationRoom'];
    primaryDesignationData = json['primaryDesignationData'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['joiningDate'] = this.joiningDate;
    if (this.employeeDesignationList != null) {
      data['employeeDesignationList'] =
          this.employeeDesignationList!.map((v) => v.toJson()).toList();
    }
    data['faculty'] = this.faculty;
    data['facultyInitials'] = this.facultyInitials;
    data['primaryDesignation'] = this.primaryDesignation;
    data['primaryDesignationRoom'] = this.primaryDesignationRoom;
    data['primaryDesignationData'] = this.primaryDesignationData;
    return data;
  }
}

class EmployeeDesignationList {
  String? id;
  Designation? designation;
  EmploymentType? employmentType;
  bool? primaryDesignation;
  String? startDate;
  int? hierarchy;
  Room? room;
  String? seatingZone;
  bool? officePhoneVisibleInWebsite;
  bool? active;
  String? endDate;

  EmployeeDesignationList(
      {this.id,
      this.designation,
      this.employmentType,
      this.primaryDesignation,
      this.startDate,
      this.hierarchy,
      this.room,
      this.seatingZone,
      this.officePhoneVisibleInWebsite,
      this.active,
      this.endDate});

  EmployeeDesignationList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designation = json['designation'] != null
        ? new Designation.fromJson(json['designation'])
        : null;
    employmentType = json['employmentType'] != null
        ? new EmploymentType.fromJson(json['employmentType'])
        : null;
    primaryDesignation = json['primaryDesignation'];
    startDate = json['startDate'];
    hierarchy = json['hierarchy'];
    room = json['room'] != null ? new Room.fromJson(json['room']) : null;
    seatingZone = json['seatingZone'];
    officePhoneVisibleInWebsite = json['officePhoneVisibleInWebsite'];
    active = json['active'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.designation != null) {
      data['designation'] = this.designation!.toJson();
    }
    if (this.employmentType != null) {
      data['employmentType'] = this.employmentType!.toJson();
    }
    data['primaryDesignation'] = this.primaryDesignation;
    data['startDate'] = this.startDate;
    data['hierarchy'] = this.hierarchy;
    if (this.room != null) {
      data['room'] = this.room!.toJson();
    }
    data['seatingZone'] = this.seatingZone;
    data['officePhoneVisibleInWebsite'] = this.officePhoneVisibleInWebsite;
    data['active'] = this.active;
    data['endDate'] = this.endDate;
    return data;
  }
}

class Designation {
  String? id;
  Rank? rank;
  String? designationType;
  Office? office;

  Designation({this.id, this.rank, this.designationType, this.office});

  Designation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rank = json['rank'] != null ? new Rank.fromJson(json['rank']) : null;
    designationType = json['designationType'];
    office =
        json['office'] != null ? new Office.fromJson(json['office']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.rank != null) {
      data['rank'] = this.rank!.toJson();
    }
    data['designationType'] = this.designationType;
    if (this.office != null) {
      data['office'] = this.office!.toJson();
    }
    return data;
  }
}

class Rank {
  String? id;
  String? name;

  Rank({this.id, this.name});

  Rank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Office {
  String? id;
  String? officeType;
  String? name;
  int? officeId;
  int? ussId;
  String? gsuiteGroupName;
  String? establishmentDate;
  String? logo;
  bool? active;

  Office(
      {this.id,
      this.officeType,
      this.name,
      this.officeId,
      this.ussId,
      this.gsuiteGroupName,
      this.establishmentDate,
      this.logo,
      this.active});

  Office.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    officeType = json['officeType'];
    name = json['name'];
    officeId = json['officeId'];
    ussId = json['ussId'];
    gsuiteGroupName = json['gsuiteGroupName'];
    establishmentDate = json['establishmentDate'];
    logo = json['logo'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['officeType'] = this.officeType;
    data['name'] = this.name;
    data['officeId'] = this.officeId;
    data['ussId'] = this.ussId;
    data['gsuiteGroupName'] = this.gsuiteGroupName;
    data['establishmentDate'] = this.establishmentDate;
    data['logo'] = this.logo;
    data['active'] = this.active;
    return data;
  }
}

class EmploymentType {
  String? id;
  String? type;

  EmploymentType({this.id, this.type});

  EmploymentType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}

class Room {
  String? id;
  Building? building;
  int? floorNumber;
  String? roomNumber;
  String? roomCapacity;
  String? alternateName;
  String? roomType;
  String? name;

  Room(
      {this.id,
      this.building,
      this.floorNumber,
      this.roomNumber,
      this.roomCapacity,
      this.alternateName,
      this.roomType,
      this.name});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    building = json['building'] != null
        ? new Building.fromJson(json['building'])
        : null;
    floorNumber = json['floorNumber'];
    roomNumber = json['roomNumber'];
    roomCapacity = json['roomCapacity'];
    alternateName = json['alternateName'];
    roomType = json['roomType'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.building != null) {
      data['building'] = this.building!.toJson();
    }
    data['floorNumber'] = this.floorNumber;
    data['roomNumber'] = this.roomNumber;
    data['roomCapacity'] = this.roomCapacity;
    data['alternateName'] = this.alternateName;
    data['roomType'] = this.roomType;
    data['name'] = this.name;
    return data;
  }
}

class Building {
  String? id;
  String? prefix;
  String? name;

  Building({this.id, this.prefix, this.name});

  Building.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    prefix = json['prefix'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['prefix'] = this.prefix;
    data['name'] = this.name;
    return data;
  }
}

class CourseTaughtList {
  int? id;
  String? code;
  String? title;
  String? label;

  CourseTaughtList({this.id, this.code, this.title, this.label});

  CourseTaughtList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    title = json['title'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['title'] = this.title;
    data['label'] = this.label;
    return data;
  }
}

class ResearchInterestList {
  String? topic;
  List<SubTopic>? subTopicList;

  ResearchInterestList({this.topic, this.subTopicList});

  ResearchInterestList.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    if (json['subTopicList'] != null) {
      subTopicList = <SubTopic>[];
      json['subTopicList'].forEach((v) {
        subTopicList!.add(new SubTopic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topic'] = this.topic;
    if (this.subTopicList != null) {
      data['subTopicList'] = this.subTopicList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubTopic {
  String? name;

  SubTopic({this.name});

  SubTopic.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class SectionScheduleList {
  String? id;
  TimeSlot? timeSlot;
  Room? room;
  bool? requiredProjector;
  bool? requiredFacultyComputer;
  String? label;

  SectionScheduleList(
      {this.id,
      this.timeSlot,
      this.room,
      this.requiredProjector,
      this.requiredFacultyComputer,
      this.label});

  SectionScheduleList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timeSlot = json['timeSlot'] != null
        ? new TimeSlot.fromJson(json['timeSlot'])
        : null;
    room = json['room'] != null ? new Room.fromJson(json['room']) : null;
    requiredProjector = json['requiredProjector'];
    requiredFacultyComputer = json['requiredFacultyComputer'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.timeSlot != null) {
      data['timeSlot'] = this.timeSlot!.toJson();
    }
    if (this.room != null) {
      data['room'] = this.room!.toJson();
    }
    data['requiredProjector'] = this.requiredProjector;
    data['requiredFacultyComputer'] = this.requiredFacultyComputer;
    data['label'] = this.label;
    return data;
  }
}

class TimeSlot {
  String? id;
  String? dayOfWeek;
  String? startTime;
  String? endTime;

  TimeSlot({this.id, this.dayOfWeek, this.startTime, this.endTime});

  TimeSlot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dayOfWeek = json['dayOfWeek'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dayOfWeek'] = this.dayOfWeek;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    return data;
  }
}

class BuildingRoom {
  String? id;
  BuildingOfSeu? building;
  int? floorNumber;
  String? roomNumber;
  String? roomCapacity;
  String? examRoomCapacity;
  DimensionInFeet? dimensionInFeet;
  bool? hasProjector;
  String? roomType;
  String? name;
  String? alternateName;

  BuildingRoom(
      {this.id,
      this.building,
      this.floorNumber,
      this.roomNumber,
      this.roomCapacity,
      this.examRoomCapacity,
      this.dimensionInFeet,
      this.hasProjector,
      this.roomType,
      this.name,
      this.alternateName});

  BuildingRoom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    building = json['building'] != null
        ? new BuildingOfSeu.fromJson(json['building'])
        : null;
    floorNumber = json['floorNumber'];
    roomNumber = json['roomNumber'];
    roomCapacity = json['roomCapacity'];
    examRoomCapacity = json['examRoomCapacity'];
    dimensionInFeet = json['dimensionInFeet'] != null
        ? new DimensionInFeet.fromJson(json['dimensionInFeet'])
        : null;
    hasProjector = json['hasProjector'];
    roomType = json['roomType'];
    name = json['name'];
    alternateName = json['alternateName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.building != null) {
      data['building'] = this.building!.toJson();
    }
    data['floorNumber'] = this.floorNumber;
    data['roomNumber'] = this.roomNumber;
    data['roomCapacity'] = this.roomCapacity;
    data['examRoomCapacity'] = this.examRoomCapacity;
    if (this.dimensionInFeet != null) {
      data['dimensionInFeet'] = this.dimensionInFeet!.toJson();
    }
    data['hasProjector'] = this.hasProjector;
    data['roomType'] = this.roomType;
    data['name'] = this.name;
    data['alternateName'] = this.alternateName;
    return data;
  }
}

class BuildingOfSeu {
  String? id;
  String? prefix;
  String? name;
  Address? address;
  int? areaInSquareFeet;
  int? floorCount;

  BuildingOfSeu(
      {this.id,
      this.prefix,
      this.name,
      this.address,
      this.areaInSquareFeet,
      this.floorCount});

  BuildingOfSeu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    prefix = json['prefix'];
    name = json['name'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    areaInSquareFeet = json['areaInSquareFeet'];
    floorCount = json['floorCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['prefix'] = this.prefix;
    data['name'] = this.name;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['areaInSquareFeet'] = this.areaInSquareFeet;
    data['floorCount'] = this.floorCount;
    return data;
  }
}

class Address {
  String? addressType;
  String? streetAddress;
  String? division;
  String? district;
  String? subDistrict;
  String? policeStation;
  String? postOffice;
  String? postCode;
  Country? country;
  double? latitude;
  double? longitude;

  Address(
      {this.addressType,
      this.streetAddress,
      this.division,
      this.district,
      this.subDistrict,
      this.policeStation,
      this.postOffice,
      this.postCode,
      this.country,
      this.latitude,
      this.longitude});

  Address.fromJson(Map<String, dynamic> json) {
    addressType = json['addressType'];
    streetAddress = json['streetAddress'];
    division = json['division'];
    district = json['district'];
    subDistrict = json['subDistrict'];
    policeStation = json['policeStation'];
    postOffice = json['postOffice'];
    postCode = json['postCode'];
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressType'] = this.addressType;
    data['streetAddress'] = this.streetAddress;
    data['division'] = this.division;
    data['district'] = this.district;
    data['subDistrict'] = this.subDistrict;
    data['policeStation'] = this.policeStation;
    data['postOffice'] = this.postOffice;
    data['postCode'] = this.postCode;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class DimensionInFeet {
  double? first;
  double? second;

  DimensionInFeet({this.first, this.second});

  DimensionInFeet.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['second'] = this.second;
    return data;
  }
}
