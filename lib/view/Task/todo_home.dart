import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/controller/task_controller.dart';
import 'package:fitness/hook/todo_hook.dart';
import 'package:fitness/model/todo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class TODO extends HookWidget {
  const TODO({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final TaskController controller = Get.put(TaskController());

    

    final hookResult = useFetchAllalltask();
    final List<Task>? tasks = hookResult.data;
    final isLoading = hookResult.isLoading;
    final refetch = hookResult.refetch;

    // Update the controller's tasks when new data is fetched
    useEffect(() {
      if (tasks != null) {
        controller.updateTasks(tasks);
      }
      return null;
    }, [tasks]);


    return Container(
      height: media.width * 0.95,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Row(
        children: [
          Obx(
            () => SimpleAnimationProgressBar(
              height: media.width * 0.85,
              width: media.width * 0.07,
              backgroundColor: Colors.grey.shade100,
              foregrondColor: Colors.purple,
              ratio: controller.completedRatio,
              direction: Axis.vertical,
              curve: Curves.fastLinearToSlowEaseIn, 
              duration: const Duration(seconds: 3),
              borderRadius: BorderRadius.circular(15),
              gradientColor: LinearGradient(
                  colors: TColor.primaryG,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Daily Task Completed",
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
                      child: Obx(
                        () => Text(
                           "${(controller.completedRatio.isFinite ? controller.completedRatio * 100 : 0).toInt()}%",
                          style: TextStyle(
                              color: TColor.white.withOpacity(0.7),
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Real time updates",
                      style: TextStyle(
                        color: TColor.gray,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.05,
                    ),
                    Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.tasks.map((task) {
                          var isLast = task == controller.tasks.last;
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RoundCheckBox(
                                    isChecked: task.completed as bool,
                                    size: 25,
                                    onTap: (selected) {
                                      controller.updateid = task.id.toString();
                                      controller.updatetask(controller.id,refetch!);
                                      // controller.up
                                    },
                                  ),
                                  if (!isLast)
                                    DottedDashedLine(
                                        height: media.width * 0.090,
                                        width: 0,
                                        dashColor: TColor.secondaryColor1
                                            .withOpacity(0.5),
                                        axis: Axis.vertical)
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      task.title.toString(),
                                      style: TextStyle(
                                        color: TColor.gray,
                                        fontSize: 15,
                                      ),
                                    ),
                                    ShaderMask(
                                      blendMode: BlendMode.srcIn,
                                      shaderCallback: (bounds) {
                                        return LinearGradient(
                                                colors: TColor.secondaryG,
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight)
                                            .createShader(Rect.fromLTRB(0, 0,
                                                bounds.width, bounds.height));
                                      },
                                      child: Text(
                                        task.subtitle.toString(),
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                            color:
                                                TColor.white.withOpacity(0.7),
                                            fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
