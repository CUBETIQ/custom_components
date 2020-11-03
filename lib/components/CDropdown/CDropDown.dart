//
//  THE THIS [Deprecated]
//  SHOULD NOT BE USE IN OTHER PROJECT
//  THIS WOULD BE CHANGE IN THE FUTURE
//
import 'package:flutter/cupertino.dart';

class CDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Deprecated packages");
  }
}

// import 'package:carzone_app/models/category.dart';
// import 'package:carzone_app/providers/filter_query_providers.dart';
// import 'package:carzone_app/utils/console.dart';
// import 'package:carzone_app/widgets/CText/custom_text_component.dart';
// import 'package:custom_components/components/CText/CText.dart';
// import "package:flutter/material.dart";
// import 'package:provider/provider.dart';
//
// class CDropdowns extends StatefulWidget {
//   final List<FilterQueryModel> listData;
//   final String dropdownTitle;
//   final String setValue;
//   final dynamic fetchFunction;
//   final bool fetchValue;
//
//   CDropdowns(
//       {this.listData = const [],
//         this.dropdownTitle,
//         this.fetchFunction,
//         this.setValue,
//         this.fetchValue = false});
//
//   @override
//   _CDropdownsState createState() => _CDropdownsState();
// }
//
// class _CDropdownsState extends State<CDropdowns> {
//   FilterQueryModel displayDropdownLabel;
//
//   @override
//   Widget build(BuildContext context) {
//     List<FilterQueryModel> dataWithNONE = widget.listData == null
//         ? [FilterQueryModel(icon: "NONE", id: "NONE", name: "NONE")]
//         : [
//       FilterQueryModel(icon: "NONE", id: "NONE", name: "NONE"),
//       ...widget.listData
//     ];
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 5,
//               right: 5,
//               top: 10,
//               bottom: 10,
//             ),
//             child: Row(
//               children: [
//                 Text(
//                   "${widget.dropdownTitle}"
//                       "",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.only(left: 10, right: 10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(6.0),
//               border: Border.all(
//                 color: Colors.grey[300],
//                 width: 1,
//               ),
//             ),
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<FilterQueryModel>(
//                 hint: displayDropdownLabel == null
//                     ? CText('Choose ${widget.dropdownTitle}...')
//                     : CText(
//                   displayDropdownLabel.name,
//                   style: TextStyle(color: Colors.blue),
//                 ),
//                 items: widget.listData == null
//                     ? null
//                     : dataWithNONE.map((FilterQueryModel value) {
//                   return DropdownMenuItem<FilterQueryModel>(
//                     value: value,
//                     child: CText(value.name),
//                   );
//                 }).toList(),
//                 onChanged: (FilterQueryModel newValue) {
//                   Console.log("Onselect ${newValue.id}", newValue.name);
//                   Provider.of<FilterQueryProvider>(
//                     context,
//                     listen: false,
//                   ).setId(
//                     type: widget.setValue,
//                     getId: widget.fetchValue ? newValue.name : newValue.id,
//                   );
//                   setState(() {
//                     displayDropdownLabel = newValue;
//                   });
//                   // ignore: unnecessary_statements
//                   widget.fetchFunction;
//                 },
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
