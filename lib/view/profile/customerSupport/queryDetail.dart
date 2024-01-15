// import 'package:alpha_ecommerce_18oct/utils/color.dart';
// import 'package:alpha_ecommerce_18oct/utils/images.dart';
// import 'package:alpha_ecommerce_18oct/view/widget_common/commonBackground.dart';
// import 'package:alpha_ecommerce_18oct/viewModel/profileViewModel.dart';
// import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

// class QueryDetailScreen extends StatefulWidget {
//   const QueryDetailScreen({super.key});

//   @override
//   State<QueryDetailScreen> createState() => _QueryDetailScreenState();
// }

// class _QueryDetailScreenState extends State<QueryDetailScreen> {
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
//     // profileP.getSupportQuerys();
//     super.initState();
//   }

//   List<Map<String, dynamic>> chatList = [
//     {
//       'chat': "Hi",
//       'isSender': true,
//     },
//     {
//       'chat': "Hello",
//       'isSender': false,
//     },
//     {
//       'chat': "How can i help you?",
//       'isSender': false,
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     profileP = Provider.of<ProfileViewModel>(context);
//     final TextEditingController chat = TextEditingController();
//     return Stack(
//       children: [
//         const LightBackGround(),
//         Scaffold(
//           backgroundColor: Colors.white,
//           appBar: CommanAppbar(appbarTitle: "Query Detail"),
//           body: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Website Problem (Type)",
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w500),
//                           ),
//                           Text(
//                             "sawan@mailinator.com",
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: colors.greyText),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 5, horizontal: 16),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Color(0xFFF9ECAC),
//                         ),
//                         child: Text(
//                           profileP.queries[0].status.toString().toUpperCase(),
//                           style: TextStyle(color: Color(0xFFD89C01)),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Divider(color: Colors.transparent),
//                   Text(
//                     "Date & Time",
//                     style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: colors.greyText),
//                   ),
//                   Text(
//                     "02 Jan 2023, 11:59 AM",
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                   ),
//                   Divider(color: Colors.transparent),
//                   Divider(color: colors.greyText),
//                   Text(
//                     "Description",
//                     style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: colors.greyText),
//                   ),
//                   Text(
//                     "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const Divider(color: Colors.transparent),
//                   Container(
//                     padding: const EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: colors.lightGrey,
//                     ),
//                     height: MediaQuery.of(context).size.height * .45,
//                     child: SingleChildScrollView(
//                       reverse: true,
//                       child: ListView.separated(
//                         separatorBuilder: (context, index) => Divider(
//                           color: Colors.transparent,
//                         ),
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: chatList.length,
//                         itemBuilder: (context, index) {
//                           return BubbleSpecialOne(
//                             color: colors.buttonColor,
//                             isSender: chatList[index]['isSender'],
//                             text: chatList[index]['chat'].toString(),
//                             textStyle: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   const Divider(color: Colors.transparent),
//                   SizedBox(
//                     height: 50,
//                     width: MediaQuery.of(context).size.width * .9,
//                     child: TextField(
//                       controller: chat,
//                       decoration: InputDecoration()
//                           .applyDefaults(Theme.of(context).inputDecorationTheme)
//                           .copyWith(
//                               // prefixIcon: GestureDetector(
//                               //   onTap: () {},
//                               //   child: Icon(
//                               //     Icons.camera_alt_rounded,
//                               //     color: colors.greyText,
//                               //   ),
//                               // ),
//                               suffixIcon: GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     chatList.add({
//                                       'chat': chat.text.toString(),
//                                       'isSender': true,
//                                     });
//                                     chat.clear();
//                                   });
//                                 },
//                                 child: Container(
//                                   padding: const EdgeInsets.all(8),
//                                   margin: const EdgeInsets.all(5),
//                                   decoration: BoxDecoration(
//                                       color: colors.buttonColor,
//                                       borderRadius: BorderRadius.circular(5)),
//                                   child: ImageIcon(
//                                     AssetImage(Images.shareApp),
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                               hintText: "Type Message",
//                               hintStyle: TextStyle(
//                                 fontSize: 14,
//                                 color: colors.greyText,
//                                 fontWeight: FontWeight.w500,
//                               )),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
