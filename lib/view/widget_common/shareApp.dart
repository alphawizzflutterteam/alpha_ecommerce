// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../../utils/color.dart';
import '../../utils/routes.dart';
import '../../model/sharingApp.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> share(context, String referralCode) async {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          child: Container(
            color: colors.overlayBG,
            height: 200,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Share",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 0; i < sharingApp.length; i++)
                            Column(
                              children: [
                                InkWell(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      //Routes.navigateToPreviousScreen(context);
                                      if (i == 0) {
                                        _launchInstagram(referralCode);
                                      }
                                    },
                                    child: Image.asset(
                                      sharingApp[i].appImage,
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.fill,
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  sharingApp[i].appName,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                )
                              ],
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ));
    },
  );
}

_launchInstagram(String msg) async {
  // Replace 'your_caption' with the desired caption for the share.
  String caption = Uri.encodeComponent('Referral code $msg');

  // Replace 'your_image_url' with the URL of the image you want to share.
  String imageUrl = 'https://i.postimg.cc/sg02JgFb/playstore-icon.png';

  // Instagram URL scheme for sharing an image with a caption.
  String url =
      'instagram://library?AssetPath=$imageUrl&InstagramCaption=$caption';

  String content = '$caption $imageUrl';

  // Open the system share dialog.
  Share.share(content, subject: 'Check out this post on Instagram');
}
