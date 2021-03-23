import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malomalo/blocs/all.dart';

class ImageDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonBloc, ButtonState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return LoadingAnimation();
        } else {
          return Container(
            margin: EdgeInsets.only(left: 70),
            child: Image.asset(
              state.imageUrl,
              width: 220,
              height: 220,
            ),
          );
        }
      },
    );
  }
}

class LoadingAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
