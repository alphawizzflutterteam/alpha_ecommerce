// import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
// import 'package:alpha_ecommerce_18oct/viewModel/profileViewModel.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

// class QueryListScreen extends StatefulWidget {
//   const QueryListScreen({super.key});

//   @override
//   State<QueryListScreen> createState() => _QueryListScreenState();
// }

// class _QueryListScreenState extends State<QueryListScreen> {
//   late ProfileViewModel profileP;
//   String formatDaate(String dateString) {
//     // Parse the date string
//     DateTime dateTime = DateTime.parse(dateString);

//     // Format the date
//     String formattedDate = DateFormat('dd MMM yyyy, h:mm a').format(dateTime);
//     return formattedDate;
//   }

//   @override
//   void initState() {
//     profileP = Provider.of<ProfileViewModel>(context, listen: false);
//     profileP.getSupportQuerys();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     profileP = Provider.of<ProfileViewModel>(context);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: CommanAppbar(appbarTitle: "Customer Support"),
//       body: profileP.isLoading
//           ? appLoader()
//           : Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ListView.builder(
//                 itemCount: profileP.queries.length,
//                 itemBuilder: (context, index) => GestureDetector(
//                   onTap: () => Navigator.push(
//                     context,
//                     PageTransition(
//                         child: QueryDetailScreen(),
//                         type: PageTransitionType.rightToLeft),
//                   ),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: colors.lightGrey,
//                         borderRadius: BorderRadius.circular(10)),
//                     padding: const EdgeInsets.all(16),
//                     margin: const EdgeInsets.only(bottom: 16),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Image.network(
//                               profileP.queries[index].customerImage.toString(),
//                               errorBuilder: (context, error, stackTrace) =>
//                                   ErrorImageWidget(height: 60),
//                               height: 60,
//                               width: 60,
//                             ),
//                             VerticalDivider(color: Colors.transparent),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   profileP.queries[index].subject.toString(),
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 Text(
//                                   profileP.queries[index].customerEmail
//                                       .toString(),
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w400,
//                                       color: colors.greyText),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Date & Time",
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w400,
//                                       color: colors.greyText),
//                                 ),
//                                 Text(
//                                   formatDaate(profileP.queries[index].createdAt
//                                       .toString()),
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 5, horizontal: 16),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Color(0xFFF9ECAC),
//                               ),
//                               child: Text(
//                                 profileP.queries[index].status
//                                     .toString()
//                                     .toUpperCase(),
//                                 style: TextStyle(color: Color(0xFFD89C01)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//     );
//   }
// }
