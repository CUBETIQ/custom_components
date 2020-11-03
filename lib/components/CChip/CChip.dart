import "package:flutter/material.dart";

class CChips extends StatefulWidget {
  final List data;
  final dynamic clickColor;
  CChips({this.data, this.clickColor});

  @override
  _CChipsState createState() => _CChipsState();
}

class _CChipsState extends State<CChips> {
  int selectIndex;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6.0,
      children: List<Widget>.generate(widget.data.length, (int index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectIndex = index;
            });
          },
          child: Chip(
            backgroundColor:
                selectIndex == index ? widget.clickColor : Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey[300],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            avatar: widget.data[index].icon != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(
                      widget.data[index].icon,
                    ),
                  )
                : SizedBox.shrink(),
            label: Text(widget.data[index].name),
          ),
        );
      }),
    );
  }
}
