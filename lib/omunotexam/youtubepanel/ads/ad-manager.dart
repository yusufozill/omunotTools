import 'dart:io';

class AdManager {

  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-6009163526412412~9211761259";
    } else if (Platform.isIOS) {
      return "ca-app-pub-6009163526412412~7639334255";
    } else {
      throw UnsupportedError("Desteklenmiyor");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-6009163526412412/6887181949";
    } else if (Platform.isIOS) {
      return "ca-app-pub-6009163526412412/5148902288";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-6009163526412412/5612754959";
    } else if (Platform.isIOS) {
      return "ca-app-pub-6009163526412412/7583493934";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  // static String get rewardedAdUnitId {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-3940256099942544/8673189370";
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/7552160883";
  //   } else {
  //     throw new UnsupportedError("Unsupported platform");
  //   }
  // }
}