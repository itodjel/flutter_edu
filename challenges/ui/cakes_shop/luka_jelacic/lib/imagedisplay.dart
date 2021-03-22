import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malomalo/blocs/all.dart';

class ImageDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //AssetImage assetImage = AssetImage("images/final.png");
    //Image image = Image(image: assetImage, width: 220, height: 220);
    return BlocBuilder<ButtonBloc, ButtonState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(left: 70),
          child: Image.asset(
            //getImageUrl(state.index),
            state.imageUrl,
            width: 220,
            height: 220,
          ),
        );
      },
    );
  }

  String getImageUrl(int index) {
    String imageUrl;
    if (index == 0) {
      imageUrl = "images/final.png";
    } else if (index == 1) {
      imageUrl = "images/cake.png";
    } else if (index == 2) {
      imageUrl = "images/torta.png";
    } else {
      imageUrl = "images/final.png";
    }
    return imageUrl;
  }
}
