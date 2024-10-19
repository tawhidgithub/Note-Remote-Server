import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../Controller/colorController.dart';
import '../Controller/home_controller.dart';
import '../res/Colors/colors.dart';
import '../res/component/Btn.dart';
import '../res/component/homeContainer.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  HomeController homeController = Get.put(HomeController());
  ColorController colorController = Get.put(ColorController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff252525),
      appBar: AppBar(
        backgroundColor: const Color(0xff252525),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: HomeContainer(
            icon: Icons.arrow_back_ios_new,
            onTap: () {
              GoRouter.of(context).go('/home');
            },
          ),
        ),
        actions: [
          HomeContainer(icon: Icons.remove_red_eye, onTap: () {}),
          const SizedBox(
            width: 20,
          ),
          HomeContainer(
              icon: Icons.note_alt_outlined,
              onTap: () {
                showDiologeSave(
                    context,
                    height,
                    width,
                    homeController.titleController.text.toString(),
                    homeController.descriptionController.text.toString(),
                    homeController,
                    colorController);
              }),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: homeController.titleController,
                minLines: 1,
                maxLines: 4,


                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white, fontSize: 30),
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(width: 0.5,color: AppColors.primaryColorOrangeTwo)
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 0.5,color: AppColors.primaryColorOrangeTwo)
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 0.5,color: AppColors.primaryColorOrangeTwo)
                    ),
                    hintText: "Title",
                    hintStyle: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff9A9A9A))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: homeController.descriptionController,
                minLines: 1,
                maxLines: 20,
                style: const TextStyle(color: Colors.white, fontSize: 21),
                decoration: const InputDecoration(
                    hintText: "Type somthing...",
                    hintStyle: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff9A9A9A)),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

showDiologeSave(
    BuildContext context,
    height,
    width,
    String title,
    String discription,
    HomeController homeController,
    ColorController colorController) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0xff3B3B3B),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            height: height * 0.3,
            width: width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.info,
                  color: Color(0xff606060),
                  size: 35,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Save Changes ?",
                  style: TextStyle(color: Color.fromARGB(255, 167, 165, 165)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BtnB(onTap: () {
                        homeController.titleController.text="";
                        homeController.descriptionController.text="";
                        GoRouter.of(context).go('/home');
                      }, text: "Discard"),
                      BtnB(
                        onTap: () {
                          homeController.uploadData(context);


                        },
                        text: "Save",
                        color: const Color(0xff30BE71),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}
