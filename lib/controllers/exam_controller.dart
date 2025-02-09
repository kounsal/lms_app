import 'package:get/get.dart';
import 'package:lms_app/helpers/api_helper.dart';
import 'package:lms_app/models/exam_model.dart';
import 'package:lms_app/utils/app_urls.dart';
import 'package:lms_app/views/categories_screen.dart/widgets/test_content.dart';

class ExamController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ExamModel> exams = <ExamModel>[].obs;
  String? selectedExamId;
  
  @override
  void onInit() {
    loadExams();
    super.onInit();
  }

  Future<void> loadExams() async {
    try {
      var response = await ApiHelper.get(AppUrls.getExam);
      print(response);
      if (response != null) {
        var examsList = response as List;
        exams.value =
            examsList.map((exam) => ExamModel.fromJson(exam)).toList();
        update();

        print(exams.length);
      }
    } catch (e) {
      print("Error fetching exams: $e");
    }
  }

  Future<void> getExamData(String id) async {
    try {
      isLoading.value = true;
      var response = await ApiHelper.get(AppUrls.examDetails(id) , auth: true);
      if (response != null) {
        print(response);
        var exam = ExamModel.fromJson(response);
        selectedExamId = exam.id;
        Get.to(() => TestContent(exam: exam));
        update();
      }
    } catch (e) {
      print("Error fetching exam data: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
