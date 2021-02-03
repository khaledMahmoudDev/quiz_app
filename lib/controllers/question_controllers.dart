import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screen/score/Score_screen.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController _animationController;
  Animation _animation;

  // so that we can access our animation outside
  Animation get animation => this._animation;

  PageController _pageController;

  PageController get pageController => _pageController;


  List<Question> _question = sample_data
      .map((e) =>
      Question(
          id: e['id'],
          answer: e['answer_index'],
          options: e['options'],
          question: e['question']))
      .toList();

  List<Question> get questions => _question;

  bool _isAnswered = false;

  bool get isAnswered => _isAnswered;

  int _correctAns;

  int get correctAns => _correctAns;

  int _selectedAns;

  int get selectedAns => _selectedAns;

  RxInt _questionNumber = 1.obs;

  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;

  int get numOfCorrectAns => _numOfCorrectAns;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    _animationController.forward().whenComplete(nextQuestion);
    

    _pageController = PageController();


    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();

  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;
    if (_correctAns == _selectedAns) _numOfCorrectAns++;
    _animationController.stop();
    update();
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();

    });
  }

  void nextQuestion(){
    if(_questionNumber.value != _question.length){
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    }else{
      Get.to(ScoreScreen());
    }

  }
void updateTheQnNum(int index){
    _questionNumber.value = index +1 ;

}
}
