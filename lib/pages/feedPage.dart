import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/postmodel.dart';
import 'package:flutter_instagram/views/appBar_widget.dart';
import 'package:flutter_instagram/views/feef%20widget.dart';

class FeedPage extends StatefulWidget {
  PageController? pageController;

  FeedPage({Key? key, this.pageController}) : super(key: key);
  static const String id = "/ feedPage";

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Post> items = [];

  @override
  void initState() {
    super.initState();
    items.addAll([

    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          title: "Instagram",
          icon: Icon(
            Icons.camera_alt,
            color: Colors.black,
          ),
          onPressed: () {
            widget.pageController!.jumpToPage(2);
          }),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => FeedWidget(post: items[index]),
      ),
    );
  }
}
