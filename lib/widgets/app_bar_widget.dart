import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool isStart;
  const AppBarWidget({
    required this.title,
    required this.isStart,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _padding = 16.0;
    final _width = MediaQuery.of(context).size.width - _padding * 2;
    final _height = 70.0;
    final _theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: _padding * 2),
        child: Container(
          width: _width,
          height: _height,
          padding: EdgeInsets.symmetric(horizontal: _padding),
          decoration: BoxDecoration(
            color: _theme.cardColor,
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                color: _theme.shadowColor,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.ice_skating)),
              Text(
                title,
                style: _theme.textTheme.headline2?.copyWith(
                  color: _theme.shadowColor,
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.ice_skating)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
