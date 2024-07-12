import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/controller/add_task.dart';
import 'package:fitness/controller/task_controller.dart';
import 'package:fitness/hook/fetch_expense.dart';
import 'package:fitness/hook/water.dart';
import 'package:fitness/model/expense_model.dart';
import 'package:fitness/model/water_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class WaterIntake extends HookWidget {
  const WaterIntake({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddTask());
    final hookResult = useFetchwaterdata();
    final hookResult2 = useFetchAllExpense();
    final List<Expense>? expense = hookResult2.data;
    final List<Transaction>? water = hookResult.data;
    final isLoading = hookResult.isLoading;
    final refetch = hookResult.refetch;
    var media = MediaQuery.of(context).size;
    var totalmoneyspent = expense != null
        ? expense.fold(0, (previousValue, element) => previousValue + element.amount)
        : 0;
    var totalmoney = 4000;
    var moneyremainig = totalmoney - totalmoneyspent;
    var totalmoneyspentpercentage = totalmoneyspent / totalmoney * 100;
    print("total money left percentage ${totalmoneyspent/totalmoney*100}");
    return Row(
      children: [
        //const WaterIntake(),
        Expanded(
          child: Container(
            height: media.width * 0.95,
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 2)
                ]),
            child: Row(
              children: [
                SimpleAnimationProgressBar(
                  height: media.width * 0.85,
                  width: media.width * 0.07,
                  backgroundColor: Colors.grey.shade100,
                  foregrondColor: Colors.purple,
                  ratio: water != null
                      ? water.fold(
                              0,
                              (previousValue, element) =>
                                  previousValue + element.amount) /
                          4000
                      : 0,
                  direction: Axis.vertical,
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(seconds: 3),
                  borderRadius: BorderRadius.circular(15),
                  gradientColor: LinearGradient(
                      colors: TColor.primaryG,
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Water Intake",
                      style: TextStyle(
                          color: TColor.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Add water intake in(ml)",
                      style: TextStyle(
                        color: TColor.gray,
                        fontSize: 12,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: media.width * 0.03),
                          height: media.width * 0.11,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  TColor.primaryColor1,
                                  TColor.primaryColor2
                                ],
                              ),
                              borderRadius: BorderRadius.circular(25)),
                          child: MaterialButton(
                            onPressed: () {
                              controller.submitWater(200, refetch!);
                            },
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            textColor: TColor.primaryColor1,
                            minWidth: double.maxFinite,
                            elevation: 0,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "200 ml",
                                  style: TextStyle(
                                      color: TColor.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: media.width * 0.02),
                          height: media.width * 0.11,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  TColor.primaryColor1,
                                  TColor.primaryColor2
                                ],
                              ),
                              borderRadius: BorderRadius.circular(25)),
                          child: MaterialButton(
                            onPressed: () {
                              controller.submitWater(400, refetch!);
                            },
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            textColor: TColor.primaryColor1,
                            minWidth: double.maxFinite,
                            elevation: 0,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "400 ml",
                                  style: TextStyle(
                                      color: TColor.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: media.width * 0.02),
                          height: media.width * 0.11,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  TColor.primaryColor1,
                                  TColor.primaryColor2
                                ],
                              ),
                              borderRadius: BorderRadius.circular(25)),
                          child: MaterialButton(
                            onPressed: () {
                              controller.submitWater(500, refetch!);
                            },
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            textColor: TColor.primaryColor1,
                            minWidth: double.maxFinite,
                            elevation: 0,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "500 ml",
                                  style: TextStyle(
                                      color: TColor.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: media.width * 0.02),
                          height: media.width * 0.11,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  TColor.primaryColor1,
                                  TColor.primaryColor2
                                ],
                              ),
                              borderRadius: BorderRadius.circular(25)),
                          child: MaterialButton(
                            onPressed: () {
                              controller.submitWater(800, refetch!);
                            },
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            textColor: TColor.primaryColor1,
                            minWidth: double.maxFinite,
                            elevation: 0,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "800 ml",
                                  style: TextStyle(
                                      color: TColor.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
        SizedBox(
          width: media.width * 0.05,
        ),
        Expanded(
            child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.maxFinite,
              
              padding:
                  const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 2)
                  ]),
              child:Column(
                children: [
                  ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) {
                            return LinearGradient(
                                    colors: TColor.primaryG,
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight)
                                .createShader(Rect.fromLTRB(
                                    0, 0, bounds.width, bounds.height));
                          },
                          child: Column(
                            children: [
                              Text(
                                "Target: 4L",
                                style: TextStyle(
                                    color: TColor.white.withOpacity(0.7),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              ),
                              Text(
                                "Completed: ${water != null ? water.fold(0, (previousValue, element) => previousValue + element.amount) / 1000 : 0}L",
                                style: TextStyle(
                                    color: TColor.white.withOpacity(0.7),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: media.width * 0.02),
                          height: media.width * 0.11,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.red,
                                  Colors.red
                                ],
                              ),
                              borderRadius: BorderRadius.circular(25)),
                          child: MaterialButton(
                            onPressed: () {
                              controller.deleteWater(refetch!);
                            },
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            textColor: TColor.primaryColor1,
                            minWidth: double.maxFinite,
                            elevation: 0,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.restore,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "reset",
                                  style: TextStyle(
                                      color: TColor.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            ),
            // Container(
            //     height: media.width * 0.2,
            //     child: Center(
            //       child: Text(
            //         "Take care of your body. It's the only place you have to live."
            //         "- Jim Rohn",
            //         style: TextStyle(
            //             color: TColor.black,
            //             fontSize: 12,
            //             fontWeight: FontWeight.w400),
            //       ),
            //     )),
            SizedBox(
              height: media.width * 0.05,
            ),
            Container(
              width: double.maxFinite,
              height: media.width * 0.45,
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 2)
                  ]),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Expenses",
                      style: TextStyle(
                          color: TColor.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) {
                        return LinearGradient(
                                colors: TColor.primaryG,
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight)
                            .createShader(Rect.fromLTRB(
                                0, 0, bounds.width, bounds.height));
                      },
                      child: Text(
                        "Total: ${totalmoneyspent}Rs",
                        style: TextStyle(
                            color: TColor.white.withOpacity(0.7),
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: media.width * 0.2,
                        height: media.width * 0.2,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: media.width * 0.15,
                              height: media.width * 0.15,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient:
                                    LinearGradient(colors: TColor.primaryG),
                                borderRadius:
                                    BorderRadius.circular(media.width * 0.075),
                              ),
                              child: FittedBox(
                                child: Text(
                                  "${moneyremainig}Rs\nleft",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: TColor.white, fontSize: 11),
                                ),
                              ),
                            ),
                            
                               SimpleCircularProgressBar(
                                progressStrokeWidth: 13,
                                backStrokeWidth: 13,
                                progressColors: TColor.primaryG,
                                backColor: Colors.grey.shade100,
                                valueNotifier: ValueNotifier(
                                    totalmoneyspentpercentage.isFinite
                                        ? totalmoneyspentpercentage
                                        : 0),
                                startAngle: 0,
                              ),
                            
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
          ],
        ))
      ],
    );
  }
}

