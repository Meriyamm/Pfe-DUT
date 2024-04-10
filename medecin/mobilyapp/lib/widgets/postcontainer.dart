import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobilyapp/palette.dart';
import 'package:mobilyapp/widgets/profileavatar.dart';
import '../Models/post_models.dart';

class postcontainer extends StatelessWidget {
  final Post post;
  const postcontainer({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      height: 160.0,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  postheader(post: post),
                  SizedBox(height: 4.0),
                  Text(post.caption),
                  post.imageUrl != null
                      ? SizedBox.shrink()
                      : SizedBox(height: 6.0),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Poststates(post: post),
          ),
        ],
      ),
    );
  }
}

class postheader extends StatelessWidget {
  final Post post;
  const postheader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.imageUrl),
        SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.user),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(onPressed: () => print('More'), icon: Icon(Icons.more_horiz))
      ],
    );
  }
}

class PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const PostButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Poststates extends StatelessWidget {
  final Post post;
  const Poststates({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 134, 206, 228),
                  shape: BoxShape.circle),
              child: Icon(
                Icons.thumb_up,
                size: 7.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                '${post.likes} ',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            PostButton(
                icon: Icon(
                  MdiIcons.thumbUpOutline,
                  color: Color.fromARGB(255, 166, 236, 245),
                  size: 15.0,
                ),
                label: 'Like',
                onTap: () => print('like')),
            SizedBox(
              width: 5,
            ),
            PostButton(
                icon: Icon(
                  MdiIcons.commentOutline,
                  color: Color.fromARGB(255, 166, 236, 245),
                  size: 15.0,
                ),
                label: 'Comment',
                onTap: () => print('Comment')),
          ],
        )
      ],
    );
  }
}
