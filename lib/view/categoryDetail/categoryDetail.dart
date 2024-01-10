// import 'package:flutter/material.dart';
// import '../../utils/color.dart';
// import '../../utils/images.dart';
// import '../../utils/routes.dart';
// import '../widget_common/commonBackground.dart';
// import '../widget_common/common_header.dart';
// import '../widget_common/filterShuffle.dart';
// import '../widget_common/sortShuffle.dart';
// import '../profile/common_header.dart';
// import 'categoryDetailCard.dart';

// class CategoryDetail extends StatefulWidget {
//   const CategoryDetail({Key? key}) : super(key: key);

//   @override
//   State<CategoryDetail> createState() => _CategoryDetailState();
// }

// class _CategoryDetailState extends State<CategoryDetail> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         const LightBackGround(),
//         Scaffold(
//           resizeToAvoidBottomInset: false,
//           key: _scaffoldKey,
//           extendBody: true,
//           backgroundColor: Colors.transparent,
//           body: Column(
//             children: [
//               const Stack(
//                 children: [
//                   ProfileHeader(),
//                   InternalDetailPageHeader(
//                     text: 'Tea & Coffee',
//                   )
//                 ],
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 20),
//                       Container(
//                           alignment: Alignment.center,
//                           width: MediaQuery.of(context).size.width * 0.95,
//                           height: MediaQuery.of(context).size.height * 0.35 * 5,
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 10),
//                           child: GridView.builder(
//                             shrinkWrap: true,
//                             padding: const EdgeInsets.symmetric(vertical: 20),
//                             physics: const NeverScrollableScrollPhysics(),
//                             gridDelegate:
//                                 const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               crossAxisSpacing: 10,
//                               mainAxisSpacing: 20,
//                               childAspectRatio: 0.7,
//                             ),
//                             itemCount: 10,
//                             itemBuilder: (context, j) {
//                               return categoryDetailCard(context: context);
//                             },
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   height: 50,
//                   decoration: const BoxDecoration(
//                     color: colors.textFieldBG,
//                     image: DecorationImage(
//                       image: AssetImage(Images.bgTab),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Center(
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           height: 50,
//                           width: MediaQuery.of(context).size.width * 0.5,
//                           child: InkWell(
                      // highlightColor: Colors.transparent,
                      // splashColor: Colors.transparent,
//                             onTap: () {
//                               // homeFilter(context);
//                             },
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   Images.filter,
//                                   width: 20,
//                                   height: 20,
//                                 ),
//                                 const SizedBox(
//                                   width: 5,
//                                 ),
//                                 const Text(
//                                   'Filter',
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 16),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: 50,
//                           width: MediaQuery.of(context).size.width * 0.5,
//                           decoration: const BoxDecoration(
//                             border: Border(
//                               left: BorderSide(
//                                 color: colors.midBorder,
//                               ),
//                             ),
//                           ),
//                           child: InkWell(
                      // highlightColor: Colors.transparent,
                      // splashColor: Colors.transparent,
//                             onTap: () {
//                               homeSort(context, searchProvider);
//                             },
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   Images.sort,
//                                   width: 20,
//                                   height: 20,
//                                 ),
//                                 const SizedBox(
//                                   width: 5,
//                                 ),
//                                 const Text(
//                                   'Sort',
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 16),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
