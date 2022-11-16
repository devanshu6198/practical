import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practical/res.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController textController = TextEditingController();
  TextEditingController googleController = TextEditingController();
  TextEditingController faceBookController = TextEditingController();
  TextEditingController linkedInController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController twitterController = TextEditingController();

  List<File> images = [];

  List<Tab> tabs = [
    Tab(
        child: Container(
            alignment: Alignment.center,
            // decoration: BoxDecoration(border: Border.all()),
            width: 60,
            child: const Text("Original"))),
    Tab(
      child: Container(
        alignment: Alignment.center,
        width: 60,
        // decoration: BoxDecoration(border: Border.all()),
        child: SvgPicture.asset(
          AppImages.facebook,
          height: 20,
          width: 20,
        ),
      ),
    ),
    Tab(
      child: Container(
        alignment: Alignment.center,
        width: 60,
        // decoration: BoxDecoration(border: Border.all()),
        child: SvgPicture.asset(
          AppImages.twitter,
          height: 20,
          width: 20,
        ),
      ),
    ),
    Tab(
      child: Container(
        alignment: Alignment.center,
        width: 60,
        // decoration: BoxDecoration(border: Border.all()),
        child: SvgPicture.asset(
          AppImages.instagram,
          height: 20,
          width: 20,
        ),
      ),
    ),
    Tab(
      child: Container(
        alignment: Alignment.center,
        width: 60,
        // decoration: BoxDecoration(border: Border.all()),
        child: SvgPicture.asset(
          AppImages.google,
          height: 20,
          width: 20,
        ),
      ),
    ),
    Tab(
      child: Container(
        alignment: Alignment.center,
        width: 60,
        // decoration: BoxDecoration(border: Border.all()),
        child: SvgPicture.asset(
          AppImages.linkedIn,
          height: 20,
          width: 20,
        ),
      ),
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();

    images = [
      File(""),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Recurring Post"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Write a Post",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black38,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                        ),
                        child: TabBar(
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.tab,
                          controller: _tabController,
                          indicatorColor: Colors.white,
                          labelColor: Colors.blue,
                          unselectedLabelColor: Colors.black,
                          tabs: tabs,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          TextFormField(
                            controller: textController,
                            maxLines: null,
                            minLines: 11,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: "Write Something here.."),
                          ),
                          TextFormField(
                            controller: faceBookController,
                            maxLines: null,
                            minLines: 11,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: "Write Something here.."),
                          ),
                          TextFormField(
                            controller: twitterController,
                            maxLines: null,
                            minLines: 11,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: "Write Something here.."),
                          ),
                          TextFormField(
                            controller: instagramController,
                            maxLines: null,
                            minLines: 11,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: "Write Something here.."),
                          ),
                          TextFormField(
                            controller: googleController,
                            maxLines: null,
                            minLines: 11,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: "Write Something here.."),
                          ),
                          TextFormField(
                            controller: linkedInController,
                            maxLines: null,
                            minLines: 11,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: "Write Something here.."),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Images",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return index == 0
                      ? SizedBox(
                          height: 100,
                          width: 100,
                          child: InkWell(
                            onTap: () {
                              pickImage();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Icon(Icons.add),
                                )),
                          ),
                        )
                      : Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                images[index],
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 5,
                              child: InkWell(
                                onTap: () {
                                  onTapRemove(index);
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.redAccent.withOpacity(0.5),
                                  ),
                                  child: const Icon(Icons.delete,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        );
                },
                shrinkWrap: true,
                itemCount: images.length,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final pickImage = await ImagePicker().pickMultiImage();

    if (pickImage.isNotEmpty || images.length < 11) {
      for (var element in pickImage) {
        setState(() {
          images.add(
            File(element.path),
          );
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("You have Select more than 10 images")));
    }
  }

  void onTapRemove(int index) {
    setState(() {
      images.removeAt(index);
    });
  }
}

class DynamicTabs {
  String? name;
  String? image;

  DynamicTabs({this.name, this.image});
}
