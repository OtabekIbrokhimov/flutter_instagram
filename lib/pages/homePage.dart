import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/feedPage.dart';
import 'package:flutter_instagram/pages/likesPage.dart';
import 'profilePage.dart';
import 'searchPage.dart';
import 'uploadPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
static const String id = "/HomePage";
  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
 PageController pageController = PageController();
 int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(centerTitle: true,
      // backgroundColor: Colors.white,
      // elevation: 0,
      // title: Text('Instagram',style: ThemeService.appBarStyle,),
      //   actions: [
      //     IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt,color: Colors.black,))
      //   ],
      // ),
      body: PageView(
        controller: pageController,
        children:  [
          FeedPage(pageController: pageController,),
          SearchPage(),
          UploadPage(),
          Likes(),
          ProfilePage(),
        ],
        onPageChanged: (index){
          setState(() {
            currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: currentIndex,
        onTap: (index){
         pageController.jumpToPage(index);
          },
        activeColor: Colors.purple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.add_box)),
          BottomNavigationBarItem(icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined)),

        ],
      ),
    );
  }
}
