import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:like_button/like_button.dart';

class CLike extends HookWidget {
  final bool isLikeFromServer;
  final String itemsId;
  final Widget Function(bool likeValue) builder;

  CLike({this.isLikeFromServer = false, this.itemsId, this.builder});

  @override
  Widget build(BuildContext context) {
    final isLike = useState();

    // ignore: missing_return
    useEffect(() {
      // ignore: missing_return
      isLike.value = isLikeFromServer;
    }, [isLikeFromServer]);

    return Container(
      child: LikeButton(
        isLiked: isLike.value,
        likeBuilder: builder,
      ),
    );
  }
}
