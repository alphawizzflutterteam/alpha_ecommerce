// import 'package:alpha_work/Utils/color.dart';
// import 'package:alpha_work/Widget/CommonAppbarWidget/commonappbar.dart';
// import 'package:flutter/material.dart';

// class CustomerSupportScreen extends StatefulWidget {
//   const CustomerSupportScreen({super.key});

//   @override
//   State<CustomerSupportScreen> createState() => _CustomerSupportScreenState();
// }

// class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: CommanAppbar(
//         appbarTitle: "Customer Support",
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Customer Care number",
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: colors.greyText,
//                   ),
//                 ),
//                 Text(
//                   "Lorem Ipsum is simply dummy text of the printing",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Divider(height: 5),
//                 Text(
//                   "000-222-11-11",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: colors.buttonColor,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Divider(color: colors.lightBorder, height: 1),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(10),
//               child: Form(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Divider(color: Colors.transparent),
//                       TextFormField(
//                         decoration: (const InputDecoration())
//                             .applyDefaults(
//                                 Theme.of(context).inputDecorationTheme)
//                             .copyWith(
//                               labelText: "Select Type",
//                             ),
//                       ),
//                       Divider(color: Colors.transparent),
//                       TextFormField(
//                         decoration: (const InputDecoration())
//                             .applyDefaults(
//                                 Theme.of(context).inputDecorationTheme)
//                             .copyWith(
//                               labelText: "Email",
//                             ),
//                       ),
//                       Divider(color: Colors.transparent),
//                       TextFormField(
//                         decoration: (const InputDecoration())
//                             .applyDefaults(
//                                 Theme.of(context).inputDecorationTheme)
//                             .copyWith(
//                               labelText: "Subject",
//                             ),
//                       ),
//                       Divider(color: Colors.transparent),
//                       ConstrainedBox(
//                         constraints: BoxConstraints(
//                           minHeight: 100,
//                         ),
//                         child: TextFormField(
//                           maxLines: 5,
//                           decoration: (const InputDecoration())
//                               .applyDefaults(
//                                   Theme.of(context).inputDecorationTheme)
//                               .copyWith(
//                                 labelText: "Description",
//                               ),
//                         ),
//                       ),
//                       Divider(color: Colors.transparent, height: 10),
//                       ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                               fixedSize: Size(150, 40)),
//                           child: Text(
//                             "SEND",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
