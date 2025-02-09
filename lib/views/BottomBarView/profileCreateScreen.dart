import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app/controllers/auth_controller.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final AuthController authController = Get.find<AuthController>();
  TextEditingController collegeNameController = TextEditingController();
  TextEditingController stateNameController = TextEditingController();
  TextEditingController yearOfAdmissionController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  int currentStep = 0;
  final List<SelectedListItem<String>> _listOfCities = [
    SelectedListItem<String>(data: "Andhra Pradesh"),
    SelectedListItem<String>(data: "Arunachal Pradesh"),
    SelectedListItem<String>(data: "Assam"),
    SelectedListItem<String>(data: "Bihar"),
    SelectedListItem<String>(data: "Chhattisgarh"),
    SelectedListItem<String>(data: "Goa"),
    SelectedListItem<String>(data: "Gujarat"),
    SelectedListItem<String>(data: "Haryana"),
    SelectedListItem<String>(data: "Himachal Pradesh"),
    SelectedListItem<String>(data: "Jharkhand"),
    SelectedListItem<String>(data: "Karnataka"),
    SelectedListItem<String>(data: "Kerala"),
    SelectedListItem<String>(data: "Madhya Pradesh"),
    SelectedListItem<String>(data: "Maharashtra"),
    SelectedListItem<String>(data: "Manipur"),
    SelectedListItem<String>(data: "Meghalaya"),
    SelectedListItem<String>(data: "Mizoram"),
    SelectedListItem<String>(data: "Nagaland"),
    SelectedListItem<String>(data: "Odisha"),
    SelectedListItem<String>(data: "Punjab"),
    SelectedListItem<String>(data: "Rajasthan"),
    SelectedListItem<String>(data: "Sikkim"),
    SelectedListItem<String>(data: "Tamil Nadu"),
    SelectedListItem<String>(data: "Telangana"),
    SelectedListItem<String>(data: "Tripura"),
    SelectedListItem<String>(data: "Uttar Pradesh"),
    SelectedListItem<String>(data: "Uttarakhand"),
    SelectedListItem<String>(data: "West Bengal"),
    SelectedListItem<String>(data: "Delhi"), // Union Territory
  ];
  final List<SelectedListItem<String>> _listOfCourses = [
  SelectedListItem<String>(data: "MBBS (Bachelor of Medicine, Bachelor of Surgery)"),
  SelectedListItem<String>(data: "BDS (Bachelor of Dental Surgery)"),
  SelectedListItem<String>(data: "BAMS (Bachelor of Ayurvedic Medicine and Surgery)"),
  SelectedListItem<String>(data: "BHMS (Bachelor of Homeopathic Medicine and Surgery)"),
  SelectedListItem<String>(data: "BPT (Bachelor of Physiotherapy)"),
  SelectedListItem<String>(data: "BMLT (Bachelor of Medical Laboratory Technology)"),
  SelectedListItem<String>(data: "MDS (Master of Dental Surgery)"),
  SelectedListItem<String>(data: "MD (Doctor of Medicine)"),
  SelectedListItem<String>(data: "MS (Master of Surgery)"),
  SelectedListItem<String>(data: "MPT (Master of Physiotherapy)"),
  SelectedListItem<String>(data: "MSc Nursing"),
  SelectedListItem<String>(data: "BSc Nursing"),
  SelectedListItem<String>(data: "MPharm (Master of Pharmacy)"),
  SelectedListItem<String>(data: "BPharm (Bachelor of Pharmacy)"),
  SelectedListItem<String>(data: "DMLT (Diploma in Medical Laboratory Technology)"),
  SelectedListItem<String>(data: "GNM (General Nursing and Midwifery)"),
  SelectedListItem<String>(data: "BAMS (Bachelor of Ayurvedic Medicine and Surgery)"),
  SelectedListItem<String>(data: "MBBS in AYUSH (Bachelor of Medicine, Bachelor of Surgery in Ayurvedic Medicine)"),
  SelectedListItem<String>(data: "MCh (Master of Chirurgiae)"),
  SelectedListItem<String>(data: "DM (Doctorate in Medicine)"),
  SelectedListItem<String>(data: "MD Pathology"),
  SelectedListItem<String>(data: "MS Orthopaedics"),
  SelectedListItem<String>(data: "MD Paediatrics"),
  SelectedListItem<String>(data: "MS Obstetrics and Gynaecology"),
  SelectedListItem<String>(data: "Diploma in Pharmacy (D. Pharm)"),
  SelectedListItem<String>(data: "Bachelor of Occupational Therapy (BOT)"),
  SelectedListItem<String>(data: "Bachelor of Optometry (B. Optom)"),
  SelectedListItem<String>(data: "Radiology and Imaging Technology"),
  SelectedListItem<String>(data: "Dialysis Technology"),
];

  final List<SelectedListItem<String>> _yearList = [];
  final List<SelectedListItem<String>> _collegeList = [
    SelectedListItem<String>(
        data: "All India Institute of Medical Sciences (AIIMS), New Delhi"),
    SelectedListItem<String>(data: "Christian Medical College (CMC), Vellore"),
    SelectedListItem<String>(data: "Armed Forces Medical College (AFMC), Pune"),
    SelectedListItem<String>(
        data: "Maulana Azad Medical College (MAMC), New Delhi"),
    SelectedListItem<String>(
        data: "King George’s Medical University (KGMU), Lucknow"),
    SelectedListItem<String>(data: "JIPMER, Puducherry"),
    SelectedListItem<String>(
        data: "Institute of Medical Sciences (IMS), BHU, Varanasi"),
    SelectedListItem<String>(data: "Madras Medical College (MMC), Chennai"),
    SelectedListItem<String>(data: "Grant Medical College, Mumbai"),
    SelectedListItem<String>(data: "Seth GS Medical College, Mumbai"),
    SelectedListItem<String>(data: "Kasturba Medical College (KMC), Manipal"),
    SelectedListItem<String>(data: "Kasturba Medical College (KMC), Mangalore"),
    SelectedListItem<String>(data: "Sri Ramachandra Medical College, Chennai"),
    SelectedListItem<String>(data: "St. John’s Medical College, Bangalore"),
    SelectedListItem<String>(
        data: "Bangalore Medical College and Research Institute (BMCRI)"),
    SelectedListItem<String>(
        data: "Jawaharlal Nehru Medical College (JNMC), Aligarh"),
    SelectedListItem<String>(
        data: "Government Medical College (GMC), Chandigarh"),
    SelectedListItem<String>(data: "Dr. D.Y. Patil Medical College, Pune"),
    SelectedListItem<String>(data: "Osmania Medical College, Hyderabad"),
    SelectedListItem<String>(data: "B.J. Medical College, Ahmedabad"),
    SelectedListItem<String>(data: "R.G. Kar Medical College, Kolkata"),
    SelectedListItem<String>(data: "Government Medical College, Nagpur"),
    SelectedListItem<String>(data: "Lady Hardinge Medical College, New Delhi"),
    SelectedListItem<String>(
        data: "Government Stanley Medical College, Chennai"),
    SelectedListItem<String>(
        data: "Government Medical College, Thiruvananthapuram"),
    SelectedListItem<String>(
        data: "Mahatma Gandhi Institute of Medical Sciences (MGIMS), Wardha"),
    SelectedListItem<String>(data: "Sardar Patel Medical College, Bikaner"),
    SelectedListItem<String>(
        data: "Vardhman Mahavir Medical College (VMMC), New Delhi"),
  ];

  void addyear() {
    for (int i = 2000; i < DateTime.now().year; i++) {
      _yearList.add(SelectedListItem<String>(data: i.toString()));
    }
  }

  @override
  void initState() {
    addyear();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "Complete Your Profile ",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Stepper(
                    type: StepperType.horizontal,
                    currentStep: currentStep,
                    onStepCancel: () => currentStep == 0
                        ? null
                        : setState(() {
                            currentStep -= 1;
                          }),
                    onStepContinue: () {
                      bool isLastStep = (currentStep == 1);
                      if (isLastStep) {
                        if(collegeNameController.text.isEmpty || stateNameController.text.isEmpty || yearOfAdmissionController.text.isEmpty || courseController.text.isEmpty || phoneNumberController.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all the fields")));
                          return;
                          }
                          else
                          {
                            authController.createProfile(
                             college:  collegeNameController.text,
                             state:  stateNameController.text,
                             yearOfAdmission:  yearOfAdmissionController.text,
                             preparingFor:  courseController.text,
                             phone:  phoneNumberController.text
                            );
          
                          }
                         
                        print('Completed');
                      } else {
                        setState(() {
                          currentStep++;
                        });
                      }
                    },
                    onStepTapped: null,
                    controlsBuilder: (context, controlsdetails) {
                      return Row(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          TextButton(
                              onPressed: controlsdetails.onStepContinue,
                              child: Text("Next")),
                          TextButton(
                              onPressed: controlsdetails.onStepCancel,
                              child: Text("Back"))
                        ],
                      );
                    },
                    steps: [
                      Step(
                        isActive: currentStep == 0,
                        title: const Text('Course Details'),
                        content:SingleChildScrollView(
                          child: Column(
                            children: [
                               AppTextField(
                                textEditingController: courseController,
                                title: "Select Course",
                                hint: "Select Your Course",
                                isReadOnly: true,
                                onTextFieldTap: () => onTextFieldTap(
                                    "Courses", courseController, _listOfCourses),
                              ),
                                AppTextField(
                                textEditingController: phoneNumberController,
                                title: "Your Phone Number",
                                hint: "Enter Your Phone Number",
                                isReadOnly:false
                               
                              ),
                            ],
                          ),
                        ),
                      ),
                      Step(
                        isActive: currentStep == 1,
                        title: const Text('College Details'),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              AppTextField(
                                textEditingController: stateNameController,
                                title: "State Name",
                                hint: "Select Your State",
                                isReadOnly: true,
                                onTextFieldTap: () => onTextFieldTap(
                                    "States", stateNameController, _listOfCities),
                              ),
                              AppTextField(
                                textEditingController: collegeNameController,
                                title: "College Name",
                                hint: "Select Your Colleege",
                                isReadOnly: true,
                                onTextFieldTap: () => onTextFieldTap("Colleges",
                                    collegeNameController, _collegeList),
                              ),
                              AppTextField(
                                textEditingController: yearOfAdmissionController,
                                title: "Year of Admission",
                                hint: "Select Year of Admission",
                                isReadOnly: true,
                                onTextFieldTap: () => onTextFieldTap("Select Year",
                                    yearOfAdmissionController, _yearList),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          
                      Spacer(),
              ],
            ),
          ),
        Obx(() {
          if (authController.isLoading.value) {
            return Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Container();
          }
        }),
       
        ],
      ),
    );
  }

  void onTextFieldTap(String title, TextEditingController controller,
      List<SelectedListItem<String>> data) {
    DropDownState<String>(
      dropDown: DropDown<String>(
        isDismissible: true,
        bottomSheetTitle: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonText: 'Save',
        clearButtonText: 'Clear',
        data: data,
        onSelected: (selectedItems) {
          List<String> list = [];
          for (var item in selectedItems) {
            list.add(item.data);
          }
          controller.text = list.first.toString();
          // showSnackBar(list.toString());
        },
        enableMultipleSelection: false,
        // maxSelectedItems: 3,
      ),
    ).showModal(context);
  }
}

/// This is Common App text field class
class AppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isReadOnly;
  final VoidCallback? onTextFieldTap;

  const AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    this.isReadOnly = false,
    this.onTextFieldTap,
    super.key,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        const SizedBox(height: 5.0),
        TextFormField(
          controller: widget.textEditingController,
          cursorColor: Colors.black,
          readOnly: widget.isReadOnly,
          onTap: widget.isReadOnly
              ? () {
                  FocusScope.of(context).unfocus();
                  widget.onTextFieldTap?.call();
                }
              : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black12,
            contentPadding: const EdgeInsets.only(
              left: 8,
              bottom: 0,
              top: 0,
              right: 15,
            ),
            hintText: widget.hint,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }
}
