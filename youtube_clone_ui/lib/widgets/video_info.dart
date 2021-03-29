import 'package:flutter/material.dart';
import 'package:youtube_clone_ui/data.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoInfo extends StatelessWidget {
  final Video video;

  const VideoInfo({Key? key, required this.video}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.title,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.0),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            "${video.viewCount} viwes * ${timeago.format(video.timestamp)}",
            style:
                Theme.of(context).textTheme.caption!.copyWith(fontSize: 14.0),
          ),
          const Divider(),
          _ActionRow(
            video: video,
          ),
          const Divider(),
          _AuthorInfo(
            user: video.author,
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  final Video video;

  const _ActionRow({Key? key, required this.video}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildAction(context, Icons.thumb_up_outlined, video.likes),
        _buildAction(context, Icons.thumb_down_outlined, video.dislikes),
        _buildAction(context, Icons.replay_outlined, "Share"),
        _buildAction(context, Icons.download_outlined, "Download"),
        _buildAction(context, Icons.library_add_outlined, "Save"),
      ],
    );
  }

  Widget _buildAction(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          SizedBox(
            height: 0.5,
          ),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class _AuthorInfo extends StatelessWidget {
  final User user;

  const _AuthorInfo({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(user.profileImageUrl),
          ),
          const SizedBox(
            width: 6,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    user.username,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${user.subscribers} Subscribers",
                    style: Theme.of(context).textTheme.caption!.copyWith(),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "SUBSCRIBES",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.red, fontSize: 16),
              ))
        ],
      ),
    );
  }
}
