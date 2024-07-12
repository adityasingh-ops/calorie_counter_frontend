import 'package:fitness/view/Task/task_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness/common/colo_extension.dart'; // Adjust path as needed
import 'package:fitness/view/home/home_view.dart'; // Adjust path as needed
import 'package:fitness/controller/add_task.dart';
import 'package:fitness/common_widget/tab_button.dart';
import 'package:slider_button/slider_button.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({Key? key,}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainTabViewState createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  Widget currentTab = const HomeView();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  final AddTask controller = Get.put(AddTask());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: PageStorage(bucket: PageStorageBucket(), child: currentTab),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  TColor.primaryColor1,
                  TColor.primaryColor2,
                ],
              ),
              borderRadius: BorderRadius.circular(35),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                )
              ],
            ),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height /
                          1.7, // Half of the screen height
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            "Add Task",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  controller: _titleController,
                                  decoration: const InputDecoration(
                                    hintText: "Title",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  controller: _subtitleController,
                                  decoration: const InputDecoration(
                                    hintText: "Subtitle",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),],
                          ),
                          const SizedBox(height: 16.0),
                          SliderButton(
                            action: () async {
                              await controller.submitData(
                                _titleController.text,
                                _subtitleController.text,
                              );

                              _titleController.clear();
                              _subtitleController.clear();
                              setState(() {
                    selectTab = 1;
                    currentTab = const TaskPage();
                    
                  });
                              return false;
                            },
                            label: const Text(
                              "Slide to add task",
                              style: TextStyle(
                                color: Color(0xff4a4a4a),
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                            icon: const Icon(Icons.add, color: Colors.white),
                            width: double.infinity,
                            radius: 30,
                            buttonColor: TColor.secondaryColor1,
                            backgroundColor: TColor.primaryColor2,
                            highlightedColor: Colors.white,
                            baseColor: Colors.white,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child:  Icon(Icons.today_outlined,
                  color: TColor.white, size: 35),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
            color: TColor.white,
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, -2)),
            ],
          ),
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                icon: "assets/img/home_tab.png",
                selectIcon: "assets/img/home_tab_select.png",
                isActive: selectTab == 0,
                onTap: () {
                  setState(() {
                    selectTab = 0;
                    currentTab = const HomeView();
                  });
                },
              ),
              TabButton(
                icon: "assets/img/activity_tab.png",
                selectIcon: "assets/img/activity_tab_select.png",
                isActive: selectTab == 1,
                onTap: () {
                  setState(() {
                    selectTab = 1;
                    currentTab =  const TaskPage();
                  });
                },
              ),
              const SizedBox(width: 40),
              TabButton(
                icon: "assets/img/camera_tab.png",
                selectIcon: "assets/img/camera_tab_select.png",
                isActive: selectTab == 2,
                onTap: () {
                  setState(() {
                    selectTab = 2;
                    currentTab = const TaskPage();
                  });
                },
              ),
              TabButton(
                icon: "assets/img/profile_tab.png",
                selectIcon: "assets/img/profile_tab_select.png",
                isActive: selectTab == 3,
                onTap: () {
                  setState(() {
                    selectTab = 3;
                    currentTab = const TaskPage();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
