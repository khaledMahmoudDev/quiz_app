import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controllers.dart';

class Option extends StatelessWidget {
  const Option({
    Key key,
    this.text,
    this.index,
    this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (qnController) {
            Color getTheRightColor() {
              if (qnController.isAnswered) {
                if (index == qnController.correctAns) {
                  return kGreenColor;
                } else if (index == qnController.selectedAns &&
                    qnController.selectedAns != qnController.correctAns) {
                  return kRedColor;
                }
              }
              return kGrayColor;
            }

            IconData getTheRightICon() {
              return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
            }

            return InkWell(
              onTap: press,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: getTheRightColor()),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${index + 1}. $text",
                      style: TextStyle(color: getTheRightColor(), fontSize: 16),
                    ),
                    Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: getTheRightColor() == kGrayColor
                            ? Colors.transparent
                            : getTheRightColor(),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: getTheRightColor()),
                      ),
                      child: getTheRightColor() == kGrayColor
                          ? null
                          : Icon(
                              getTheRightICon(),
                              size: 16,
                            ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
