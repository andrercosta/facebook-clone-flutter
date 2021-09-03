import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/components/profile_image.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/utils/color_palette.dart';
import 'package:flutter/material.dart';

class StoryArea extends StatelessWidget {
  final User user;
  final List<Story> stories;

  const StoryArea({required this.user, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            Story userStory = Story(user: user, urlImage: user.urlImage);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: CardStory(
                story: userStory,
                addStory: true,
              ),
            );
          }
          Story story = stories[index - 1];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: CardStory(
              story: story,
            ),
          );
        },
      ),
    );
  }
}

class CardStory extends StatelessWidget {
  final Story story;
  final bool addStory;
  CardStory({required this.story, this.addStory = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: story.urlImage,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: ColorPalette.degradeStory,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: addStory
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.add,
                      color: ColorPalette.azulFacebook,
                    ),
                    onPressed: () {},
                  ),
                )
              : ProfileImage(
                  urlImage: story.user.urlImage,
                  visualized: story.visualized,
                ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(addStory?"Criar Story": story.user.name,
            style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ) ,
            maxLines: 2 ,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
