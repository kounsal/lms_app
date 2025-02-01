import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/controllers/course_controller.dart';
import 'package:lms_app/utils/colors.dart';
import 'package:lms_app/utils/config.dart';
import 'package:lms_app/utils/themes.dart';
import 'package:lms_app/views/categories_screen.dart/widgets/plan_content.dart';

class AllCourseScreen extends StatefulWidget {
  const AllCourseScreen({super.key});

  @override
  State<AllCourseScreen> createState() => _AllCourseScreenState();
}

class _AllCourseScreenState extends State<AllCourseScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  final courseController =
      Get.put(CourseController()); // ✅ Initialize controller
  @override
  void initState() {
    super.initState();
    courseController.getAllCourses();
    courseController.getAllPlans();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: tabController, // ✅ Use the correct controller
          tabs: [
            Tab(text: "Courses"),
            Tab(text: "Plans"),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          AllCoursesView(),
          AllPlansView(),
        ],
      ),
    );
  }
}

class AllCoursesView extends StatefulWidget {
  const AllCoursesView({super.key});

  @override
  State<AllCoursesView> createState() => _AllCoursesViewState();
}

class _AllCoursesViewState extends State<AllCoursesView> {
  final CourseController controller =
      Get.put(CourseController()); // ✅ Initialize controller

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: SingleChildScrollView(
        child: Obx(() {
          return AlignedGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            itemCount: controller.allCourses.length,
            itemBuilder: (ctx, index) {
              final data = controller.allCourses[index];
              return SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0.1,
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: CachedNetworkImage(
                              height: 120,
                              width: double.infinity,
                              imageUrl: data.thumbnail,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => SizedBox(
                                height: 120,
                                child: Center(
                                  child: Icon(
                                    Icons.broken_image_outlined,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 42,
                              child: TextFormat.small(
                                text: data.title ?? "",
                                textAlign: TextAlign.start,
                              ),
                            ),
                            const SizedBox(height: 5),
                            data.isFree ?? false
                                ? TextFormat.small(
                                    text: 'Free',
                                    textColor: AppColors.primary,
                                    fontWeight: FontWeight.w800,
                                  )
                                : data.priceWithDiscount != null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextFormat.small(
                                            text:
                                                'Rs.${data.priceWithDiscount}',
                                            textColor: AppColors.primary,
                                            fontWeight: FontWeight.w800,
                                          ),
                                          TextFormat.small(
                                            text: 'Rs.${data.price}',
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ],
                                      )
                                    : TextFormat.small(
                                        text: 'Rs.${data.price}',
                                        textColor: AppColors.primary,
                                        fontWeight: FontWeight.w800,
                                      ),
                            const SizedBox(height: 5),
                            
                            GestureDetector(
                              onTap: ()async{
                                await controller.getCourseDetails(data.id);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primary, width: 1.5),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10,
                                    ),
                                    
                                    child: data.isFree ?? false
                                        ? TextFormat.small(
                                            text: 'Enroll',
                                            textColor: AppColors.primary,
                                            fontWeight: FontWeight.w800,
                                          )
                                        : TextFormat.small(
                                            text: 'Buy Now',
                                            textColor: AppColors.primary,
                                            fontWeight: FontWeight.w800,
                                          ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
          );
        }),
      ),
    );
  }
}

class AllPlansView extends StatefulWidget {
  const AllPlansView({super.key});

  @override
  State<AllPlansView> createState() => _AllPlansViewState();
}

class _AllPlansViewState extends State<AllPlansView> {
  final CourseController courseController =
      Get.put(CourseController()); // ✅ Initialize controller
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Obx(() {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: courseController.plans.length,
          itemBuilder: (context, index) {
            final data = courseController.plans[index];
            return 
            GestureDetector(
              onTap: (){
                Get.to(PlanContentScreen(plan: data,));
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 130,
                width: size.width * .8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black.withOpacity(.050),
                  ),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      children: [
                        Container(
                          height: constraints.maxHeight,
                          width: constraints.maxWidth * .4,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.1),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            child: Image.network(
                              data.thumbnail ?? "",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.broken_image_outlined,
                                  color: Colors.red,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  TextFormat.extraSmall(
                                    text:
                                        'Duration ${data.duration}',
                                    opacity: .5,
                                  ),
                      
                                ],
              
                              ),
                                        TextFormat.small(
                                              text: 'Rs.${data.price}',
                                              textColor: AppColors.primary,
                                              fontWeight: FontWeight.w700),
                            ],
                          ),
                        ))
                      ],
                    );
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
