import '../utils/images.dart';

class ShareApp {
  String appImage;
  String appName;
  ShareApp({required this.appImage, required this.appName});
}

List<ShareApp> sharingApp = [
  ShareApp(appImage: Images.instagram, appName: "Instagram"),
  ShareApp(appImage: Images.twitter, appName: "Twitter"),
  ShareApp(appImage: Images.linkedlin, appName: "LinkedIn"),
  ShareApp(appImage: Images.facebook, appName: "Facebook"),
  ShareApp(appImage: Images.youtube, appName: "Youtube"),
];
