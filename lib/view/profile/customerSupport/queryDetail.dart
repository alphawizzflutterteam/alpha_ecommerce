import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/view/profile/customerSupport/customerSupportModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/customerSupport/supportChatModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/commonBackground.dart';
import 'package:alpha_ecommerce_18oct/viewModel/profileViewModel.dart';
import 'package:alpha_ecommerce_18oct/widgets/CommonAppbarWidget/commonappbar.dart';
import 'package:alpha_ecommerce_18oct/widgets/dateFormatter.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class QueryDetailScreen extends StatefulWidget {
  const QueryDetailScreen({super.key, required this.queryDetails});
  final SupportData queryDetails;
  @override
  State<QueryDetailScreen> createState() => _QueryDetailScreenState();
}

class _QueryDetailScreenState extends State<QueryDetailScreen> {
  late ProfileViewModel profileP;

  @override
  void initState() {
    profileP = Provider.of<ProfileViewModel>(context, listen: false);
    profileP.getSupportQueryChats(
        TicketId: widget.queryDetails.id.toString(), ctx: context);
    super.initState();
  }

  String getMessage(ChatData data) {
    if (data.customerMessage == "" && data.adminMessage == "") {
      return data.vendorMessage.toString();
    } else if (data.customerMessage == "" && data.vendorMessage == "") {
      return data.adminId.toString();
    } else if (data.adminMessage == "" && data.vendorMessage == "") {
      return data.customerMessage.toString();
    } else
      return '';
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController chat = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.transparent
          : Colors.white,
      appBar: CommanAppbar(appbarTitle: "Query Detail"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.queryDetails.subject.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                      ),
                      Text(
                        widget.queryDetails.customerEmail.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: colors.greyText),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF9ECAC),
                    ),
                    child: Text(
                      widget.queryDetails.status.toString().toUpperCase(),
                      style: TextStyle(color: Color(0xFFD89C01)),
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.transparent),
              Text(
                "Date & Time",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black),
              ),
              Text(
                CustomDateFormat.formatDaate(
                    widget.queryDetails.createdAt.toString()),
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: colors.greyText),
              ),
              Divider(color: Colors.transparent),
              Divider(color: colors.greyText),
              Text(
                "Description",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: colors.greyText),
              ),
              Text(
                widget.queryDetails.description.toString(),
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black),
              ),
              const Divider(color: Colors.transparent),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).brightness == Brightness.dark
                        ? colors.textFieldColor
                        : colors.greyText),
                height: MediaQuery.of(context).size.height * .475,
                child: Consumer<ProfileViewModel>(builder: (context, val, _) {
                  return SingleChildScrollView(
                    reverse: true,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.transparent,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: profileP.supportChats.length,
                      itemBuilder: (context, index) {
                        return BubbleSpecialOne(
                          color: colors.buttonColor,
                          isSender:
                              profileP.supportChats[index].vendorMessage != ""
                                  ? true
                                  : false,
                          text: getMessage(profileP.supportChats[index]),
                          textStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
              const Divider(color: Colors.transparent),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * .9,
                child: TextField(
                  controller: chat,
                  decoration: InputDecoration()
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(
                          // prefixIcon: GestureDetector(
                          //   onTap: () {},
                          //   child: Icon(
                          //     Icons.camera_alt_rounded,
                          //     color: colors.greyText,
                          //   ),
                          // ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              // setState(() {
                              //   profileP.postSupportQueryChats(
                              //       TicketId: widget.queryDetails.id.toString(),
                              //       chat: chat.text.toString().trim());
                              // });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: colors.buttonColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: ImageIcon(
                                AssetImage(Images.shareApp),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          hintText: "Type Message",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: colors.greyText,
                            fontWeight: FontWeight.w500,
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
