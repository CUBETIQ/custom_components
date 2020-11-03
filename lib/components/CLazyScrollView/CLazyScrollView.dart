import "package:flutter/material.dart";
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CLazyScrollView extends StatefulWidget {
  final bool isDefaultMode;
  final bool getAllCar;
  final String categoryId;
  final Future<void> Function(int pageNumber) callbackFetchData;
  final String uuidKey;
  final bool overrideDataStateWithFilter;
  final Widget componentWidget;
  final List<dynamic> fetchData;
  CLazyScrollView({
    @required this.callbackFetchData,
    this.overrideDataStateWithFilter = false,
    this.getAllCar,
    this.isDefaultMode,
    this.categoryId,
    this.uuidKey,
    this.fetchData,
    this.componentWidget,
  });

  @override
  _CLazyScrollViewState createState() => _CLazyScrollViewState();
}

class _CLazyScrollViewState extends State<CLazyScrollView> {
  static const _pageSize = 20;
  int _pageable = 0;
  String localKey;
  final PagingController<int, dynamic> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    setState(() {
      _pagingController.addPageRequestListener((pageKey) {
        _fetchPage(pageKey);
      });
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant CLazyScrollView oldWidget) {
    if (oldWidget.uuidKey != null) {
      setState(() {
        _pageable = 0;
      });
    }
    _pagingController.refresh();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      await widget.callbackFetchData(_pageable);
      setState(() {
        _pageable = _pageable + 1;
      });

      final newItems = widget.fetchData;

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: PagedListView<int, dynamic>(
          shrinkWrap: false,
          // physics: NeverScrollableScrollPhysics(),
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<dynamic>(
            itemBuilder: (context, item, index) {
              return widget.componentWidget;
            },
          ),
        ),
      ),
    );
  }
}
