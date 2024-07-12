import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:fitness/common/colo_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
                  height: media.width * 0.30,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: TColor.white,
                      borderRadius: BorderRadius.circular(media.width * 0.060),
                      boxShadow: [
                        BoxShadow(
                            color: TColor.gray.withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(0, 3))
                      ]),
                  child: Container(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: media.width * 0.30,
                              child: AnimatedTextField(
                                animationType: Animationtype.typer,
                                hintTextStyle: TextStyle(
                                  color: TColor.primaryColor1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                hintTexts: const [
                                  'Enter',
                                  'the Amount',
                                  'you Spent Today',
                                ],
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      TColor.primaryColor1.withOpacity(0.1),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.red, width: 2),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  contentPadding: const EdgeInsets.all(12),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: media.width * 0.02,
                            ),
                            Container(
                              width: media.width * 0.60,
                              child: AnimatedTextField(
                                animationType: Animationtype.typer,
                                hintTextStyle: TextStyle(
                                  color: TColor.primaryColor1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                hintTexts: const [
                                  'How is Your Day Today?',
                                  'Will its more expense?',
                                  'or you save some money?',
                                ],
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      TColor.primaryColor1.withOpacity(0.1),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.red, width: 2),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  contentPadding: const EdgeInsets.all(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: media.width * 0.05,
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(
                              MaterialCommunityIcons.plus,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
  }
}