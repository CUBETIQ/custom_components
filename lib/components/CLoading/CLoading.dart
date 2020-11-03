import "package:flutter/material.dart";

class CLoading extends StatelessWidget {
  final bool centerTab;
  final Widget customLoadingObj;
  CLoading(
      {this.centerTab = false,
      this.customLoadingObj = const CircularProgressIndicator()});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - 300;
    return centerTab
        ? Container(
            width: width,
            height: height,
            child: Center(
              child: customLoadingObj,
            ),
          )
        : Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Center(
                child: customLoadingObj,
              ),
            ),
          );
  }
}
