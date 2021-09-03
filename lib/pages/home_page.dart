import 'package:facebook_clone/components/circle_button.dart';
import 'package:facebook_clone/components/create_area_post.dart';
import 'package:facebook_clone/components/story_area.dart';
import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/utils/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            //expandedHeight: 250,
            centerTitle: false,
            floating: true,
            title: Text(
              'Facebook',
              style: TextStyle(
                  color: ColorPalette.azulFacebook,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  letterSpacing: -1.2),
            ),
            actions: [
              CircleButton(
                icon: Icons.search,
                sizeIcon: 30,
                onPressed: () {},
              ),
              CircleButton(
                icon: LineIcons.facebookMessenger,
                sizeIcon: 30,
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: CreateArePost(
              user: usuarioAtual,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: StoryArea(
                user: usuarioAtual,
                stories: estorias,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
