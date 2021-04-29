import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocs/tabs/all.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonTab extends StatelessWidget {
  static const green = const Color(0xFF7b7517);
  Function onTap;
  String text;
  Widget child;
  Color color;
  Color textColor;
  double elevation;
  EdgeInsetsGeometry padding;
  EdgeInsetsGeometry margin;
  int index;
  ButtonTab({
    this.onTap,
    this.text,
    this.child,
    this.color,
    this.elevation = 0,
    this.textColor,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0),
    this.margin = const EdgeInsets.all(6.0),
    this.index,
    bool isSelected,
  }) : assert(index != null);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsBloc, TabsState>(
      builder: (context, tabsState) {
        return Container(
          margin: margin,
          child: PhysicalModel(
            elevation: elevation,
            color: color ?? Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  // onTap: onTap ?? () {},5
                  onTap: () => context
                      .read<TabsBloc>()
                      .add(TabsChangeEvent(index: index)),
                  child: Container(
                    padding: padding,
                    decoration: BoxDecoration(
                      color: tabsState.index == this.index
                          ? green
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      text,
                      style: TextStyle(
                          color: textColor ?? Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
