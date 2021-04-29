import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  // const FavoriteIcon({
  //   this.color = const Color(0xFFFFE306),
  // });

  // final Color color;

  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon:
            (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
        color: Colors.white,
        onPressed: _toggleFavorite,
      ),
    );
  }
}
