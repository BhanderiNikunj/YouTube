import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video/Screen/Home/provider/HomeProvider.dart';
import 'package:chewie/chewie.dart';
import 'package:video/Screen/Video/provider/VideoProvider.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    int i = ModalRoute.of(context)!.settings.arguments as int;

    VideoProvider videoProvider =
        Provider.of<VideoProvider>(context, listen: false);
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: "Home",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.electric_bolt,
                  color: Colors.black,
                ),
                label: "Shorts"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.black,
                ),
                label: "Add"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.video_settings,
                  color: Colors.black,
                ),
                label: "Subscription"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.video_collection,
                  color: Colors.black,
                ),
                label: "Library"),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.black,
              height: 200,
              width: double.infinity,
              alignment: Alignment.center,
              child: Chewie(
                controller: videoProvider.chewieController!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 492,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Text(
                      "${homeProvider.videoNameList1[i]}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: 1),
                    ),
                    Text(
                      "${homeProvider.videoNameList2[i]}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: 1),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "${homeProvider.videoViewList[i]} . ${homeProvider.videoTimingList[i]}",
                      style: const TextStyle(color: Colors.black38, fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundImage: AssetImage(
                                "${homeProvider.channelLogoList[i]}"),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${homeProvider.channelNameList[i]}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 35,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            child: const Text("Subscribe",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 35,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.notification_add_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 35,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.thumb_up_alt_rounded,
                                color: Colors.black,
                              ),
                              Text("12M",
                                  style: TextStyle(color: Colors.black)),
                              Icon(
                                Icons.thumb_down_alt_outlined,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.share,
                                color: Colors.black,
                              ),
                              Text("Share",
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.electric_bolt_outlined,
                                color: Colors.black,
                              ),
                              Text("Remix",
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Comments  46K",
                            style: TextStyle(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(""),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 35,
                                width: 270,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey.shade300,
                                ),
                                padding: const EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                child: const Text("Add a comment........",
                                    style: TextStyle(color: Colors.grey)),
                                // Text("Add a comment . . .",style: GoogleFonts.poppins(color: Colors.grey)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    comment(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget comment() {
    return Container(
      height: 85,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("Assets/Images/UserLogo/me.png"),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Nikunj Bhanderi",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              const Text("Nice App Dude ! Keep it Up. . .",
                  style: TextStyle(color: Colors.black, fontSize: 12)),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: const [
                  Icon(Icons.thumb_up_off_alt_rounded, size: 15),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.thumb_down_alt_outlined, size: 15),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.favorite, size: 15),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Reply",
                      style: TextStyle(color: Colors.black, fontSize: 9)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Provider.of<VideoProvider>(context, listen: false).stopVideo();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    Provider.of<VideoProvider>(context, listen: false).stopVideo();
  }
}
