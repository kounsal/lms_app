import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app/global_widgets/in_app_bar.dart';
import 'package:lms_app/models/purchase_model.dart';
import 'package:lms_app/models/single_course_model.dart';
import 'package:lms_app/utils/colors.dart';
import 'package:lms_app/views/LearningScreen/widgets/header_section.dart';
import 'package:lms_app/views/LearningScreen/widgets/instructor_section.dart';
import 'package:lms_app/views/LearningScreen/widgets/modules_section.dart';
import 'package:lms_app/views/payment/payment_view.dart';

class LearningScreen extends StatefulWidget {
  const  LearningScreen({super.key});

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  @override
  void dispose() {
 
    super.dispose();
  }
   late SingleCourseModel arg;

  @override
  void initState() {
    super.initState();
    arg = Get.arguments ?? SingleCourseModel(); // Provide a default model if null
  }
  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
      appBar: inAppBar('Course Details'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HeaderSection(arg: arg),
                    const InstructorSection(),
                    ModulesSection(courseNew: arg,),
                    
                    
                  ],
                ),
              ),
            ),
            arg.isPurchased! ? const SizedBox() :Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 70,
            width: double.infinity,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                   Text('Rs.${arg.price}', style: TextStyle(color: Colors.white , fontSize: 20, fontWeight: FontWeight.w500),),
                MaterialButton(onPressed: ()async{
                  Get.to(()=> PaymentViewPage(
                    purchasee: PurchaseModel(
                      id: arg.id!,
                      name: arg.title!,
                      price: arg.price!.toDouble(),
                      type: 'course',
                      imageUrl: arg.thumbnail!,
                      description: arg.description!,
                      email: "",
                      contact: "",

                    ),
                  ));
                }, color: AppColors.primary, child: Text('Buy Now', style: TextStyle(color: Colors.white),),  ),
             
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}
