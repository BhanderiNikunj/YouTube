import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video/Screen/Home/provider/HomeProvider.dart';
import 'package:video/Screen/Video/provider/VideoProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProvidertrue;
  HomeProvider? homeProviderfalse;
  VideoProvider? videoprovider;

  @override
  Widget build(BuildContext context) {
    homeProviderfalse = Provider.of<HomeProvider>(context, listen: false);
    homeProvidertrue = Provider.of<HomeProvider>(context, listen: true);
    videoprovider = Provider.of<VideoProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "Assets/Images/UserLogo/YouTube1.png",
                  height: 60,
                ),
                Spacer(),
                Icon(Icons.cast, color: Colors.black),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.notification_add_outlined, color: Colors.black),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.search, color: Colors.black),
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage("Assets/Images/UserLogo/me.png"),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 32,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(Icons.explore_outlined),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "All",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                customBox("News"),
                SizedBox(
                  width: 10,
                ),
                customBox("Music"),
                SizedBox(
                  width: 10,
                ),
                customBox("Mixes"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                height: 300,
                child: ListView.builder(
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Provider.of<VideoProvider>(context, listen: false)
                          .initVideo(videoprovider!.videoPath[index]);
                      Navigator.pushNamed(context, 'video', arguments: index);
                    },
                    child: customVideoBox(index),
                  ),
                  itemCount: homeProviderfalse!.videoImgList.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          items: [
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
      ),
    );
  }

  Widget customBox(String name) {
    return Container(
      height: 30,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.center,
      child: Text(
        "${name}",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget customVideoBox(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child: Image.asset("${homeProviderfalse!.videoImgList[index]}"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage:
                    AssetImage("${homeProviderfalse!.channelLogoList[index]}"),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${homeProviderfalse!.videoNameList1[index]}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  Text("${homeProviderfalse!.videoNameList2[index]}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "${homeProviderfalse!.channelNameList[index]} . ${homeProviderfalse!.videoViewList[index]} . ${homeProviderfalse!.videoTimingList[index]}",
                    style: TextStyle(color: Colors.black38, fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
