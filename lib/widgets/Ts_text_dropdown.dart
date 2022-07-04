// import 'package:flutter/material.dart';

// class TsTextDropDown extends StatefulWidget {
//   TsTextDropDown({Key? key}) : super(key: key);

//   String? hintText;

//   @override
//   State<TsTextDropDown> createState() => _TsTextDropDownState();
// }

// class _TsTextDropDownState extends State<TsTextDropDown> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FormField(builder: (FormFieldState<String> state) {
//         return InputDecorator(
//           decoration: InputDecoration(
//             hintText: widget.hintText,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(3),
//               borderSide: const BorderSide(
//                   width: 1, color: Color.fromRGBO(211, 211, 211, 1)),
//             ),
//           ),
//           isEmpty: false,
//           child: DropdownButtonHideUnderline(
//               child: DropdownButton(items: [], onChanged: (value) {})),
//         );
//       }),
//     );
//   }
// }
