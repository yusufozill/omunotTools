// Copyright 2020 Sarbagya Dhaubanjar. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:developer';
import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '/omunotexam/youtubepanel/enumVidoList.dart';
import '/omunotexam/youtubepanel/youtubeListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


// import 'anchored_adaptive_example.dart';
// import 'fluid_example.dart';
// import 'inline_adaptive_example.dart';
import '../../adfiles/reusable_inline_example.dart';

//
//const String testDevice = 'YOUR_DEVICE_ID';
const int maxFailedLoadAttempts = 3;
class YoutubePlayerWidget extends StatefulWidget {
  YoutubeListesi youtubelistesi;
  String title;
  YoutubePlayerWidget(Key key, this.youtubelistesi, {required this.title});
  @override
  _YoutubePlayerWidgetState createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {
  late YoutubePlayerController _controller;
  late List<String> liste;
  late String selectedid;
  bool yeniyuklendibelirteci =true;
  bool disposefunk = false;
  

     static final AdRequest request = AdRequest(
 
    nonPersonalizedAds: true,
  );

  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;

  RewardedAd? _rewardedAd;
  int _numRewardedLoadAttempts = 0;

  RewardedInterstitialAd? _rewardedInterstitialAd;
  int _numRewardedInterstitialLoadAttempts = 0;

  @override
  void initState() {
    liste = Liste(widget.youtubelistesi).toList;
    selectedid = liste.first;
    _controller = YoutubePlayerController(
      initialVideoId: selectedid.toString(),
      params: YoutubePlayerParams(
        playlist: liste,
        showControls: true,
        showFullscreenButton: true,
        desktopMode: false,
        privacyEnhanced: true,
        useHybridComposition: true,
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      log('Entered Fullscreen');
    };
    _controller.onExitFullscreen = () {
      log('Exited Fullscreen');
    };

    _controller.listen((event) {
      if (event.playerState == PlayerState.unknown) {}
    });
    unvalidVideoDuzeltici();
      //  _createInterstitialAd();
        liste.insert(2, "add");
    // _createRewardedAd();
    // _createRewardedInterstitialAd();
    super.initState();
  }
   
   unvalidVideoDuzeltici(){
     Future.delayed(Duration(seconds: 5)).then((value) {
       if(!disposefunk) 
      { _controller.load(selectedid);}
     });
   }





  // void _createInterstitialAd() {
  //   InterstitialAd.load(
  //       adUnitId: Platform.isAndroid
  //           ? 'ca-app-pub-6009163526412412/6772399080'
  //           : 'ca-app-pub-3940256099942544/4411468910',
  //       request: request,
  //       adLoadCallback: InterstitialAdLoadCallback(
  //         onAdLoaded: (InterstitialAd ad) {
  //           print('$ad loaded');
  //           _interstitialAd = ad;
  //           _numInterstitialLoadAttempts = 0;
  //           _interstitialAd!.setImmersiveMode(true);
  //         },
  //         onAdFailedToLoad: (LoadAdError error) {
  //           print('InterstitialAd failed to load: $error.');
  //           _numInterstitialLoadAttempts += 1;
  //           _interstitialAd = null;
  //           if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
  //             _createInterstitialAd();
  //           }
  //         },
  //       ));
  // }

  // void _showInterstitialAd() {
  //   if (_interstitialAd == null) {
  //     print('Warning: attempt to show interstitial before loaded.');
  //     return;
  //   }
  //   _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
  //     onAdShowedFullScreenContent: (InterstitialAd ad) =>
  //         print('ad onAdShowedFullScreenContent.'),
  //     onAdDismissedFullScreenContent: (InterstitialAd ad) {
  //       print('$ad onAdDismissedFullScreenContent.');
  //       ad.dispose();
  //       _createInterstitialAd();
  //     },
  //     onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
  //       print('$ad onAdFailedToShowFullScreenContent: $error');
  //       ad.dispose();
  //       _createInterstitialAd();
  //     },
  //   );
  //   _interstitialAd!.show();
  //   _interstitialAd = null;
  // }

  // void _createRewardedAd() {
  //   RewardedAd.load(
  //       adUnitId: Platform.isAndroid
  //           ? 'ca-app-pub-6009163526412412/6212806518'
  //           : 'ca-app-pub-3940256099942544/1712485313',
  //       request: request,
  //       rewardedAdLoadCallback: RewardedAdLoadCallback(
  //         onAdLoaded: (RewardedAd ad) {
  //           print('$ad loaded.');
  //           _rewardedAd = ad;
  //           _numRewardedLoadAttempts = 0;
  //         },
  //         onAdFailedToLoad: (LoadAdError error) {
  //           print('RewardedAd failed to load: $error');
  //           _rewardedAd = null;
  //           _numRewardedLoadAttempts += 1;
  //           if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
  //             _createRewardedAd();
  //           }
  //         },
  //       ));
  // }

  // void _showRewardedAd() {
  //   if (_rewardedAd == null) {
  //     print('Warning: attempt to show rewarded before loaded.');
  //     return;
  //   }
  //   _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
  //     onAdShowedFullScreenContent: (RewardedAd ad) =>
  //         print('ad onAdShowedFullScreenContent.'),
  //     onAdDismissedFullScreenContent: (RewardedAd ad) {
  //       print('$ad onAdDismissedFullScreenContent.');
  //       ad.dispose();
  //       _createRewardedAd();
  //     },
  //     onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
  //       print('$ad onAdFailedToShowFullScreenContent: $error');
  //       ad.dispose();
  //       _createRewardedAd();
  //     },
  //   );

  //   _rewardedAd!.setImmersiveMode(true);
  //   _rewardedAd!.show(
  //       onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
  //     print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
  //   });
  //   _rewardedAd = null;
  // }

  // void _createRewardedInterstitialAd() {
  //   RewardedInterstitialAd.load(
  //       adUnitId: Platform.isAndroid
  //           ? 'ca-app-pub-6009163526412412/1600194964'
  //           : 'ca-app-pub-3940256099942544/6978759866',
  //       request: request,
  //       rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
  //         onAdLoaded: (RewardedInterstitialAd ad) {
  //           print('$ad loaded.');
  //           _rewardedInterstitialAd = ad;
  //           _numRewardedInterstitialLoadAttempts = 0;
  //         },
  //         onAdFailedToLoad: (LoadAdError error) {
  //           print('RewardedInterstitialAd failed to load: $error');
  //           _rewardedInterstitialAd = null;
  //           _numRewardedInterstitialLoadAttempts += 1;
  //           if (_numRewardedInterstitialLoadAttempts < maxFailedLoadAttempts) {
  //             _createRewardedInterstitialAd();
  //           }
  //         },
  //       ));
  // }

  // void _showRewardedInterstitialAd() {
  //   if (_rewardedInterstitialAd == null) {
  //     print('Warning: attempt to show rewarded interstitial before loaded.');
  //     return;
  //   }
  //   _rewardedInterstitialAd!.fullScreenContentCallback =
  //       FullScreenContentCallback(
  //     onAdShowedFullScreenContent: (RewardedInterstitialAd ad) =>
  //         print('$ad onAdShowedFullScreenContent.'),
  //     onAdDismissedFullScreenContent: (RewardedInterstitialAd ad) {
  //       print('$ad onAdDismissedFullScreenContent.');
  //       ad.dispose();
  //       _createRewardedInterstitialAd();
  //     },
  //     onAdFailedToShowFullScreenContent:
  //         (RewardedInterstitialAd ad, AdError error) {
  //       print('$ad onAdFailedToShowFullScreenContent: $error');
  //       ad.dispose();
  //       _createRewardedInterstitialAd();
  //     },
  //   );

  //   _rewardedInterstitialAd!.setImmersiveMode(true);
  //   _rewardedInterstitialAd!.show(
  //       onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
  //     print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
  //   });
  //   _rewardedInterstitialAd = null;
  // }





   @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
  
    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.
      controller: _controller,
      child: Scaffold(
        backgroundColor: Color(0xff212121),
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color(0xff212121),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Stack(
                    children: [
                      player,
                      Positioned.fill(
                        child: YoutubeValueBuilder(
                          controller: _controller,
                          builder: (context, value) {
                            print("Bu ne zaman çalışıoyo");
                            return AnimatedCrossFade(
                              firstChild: const SizedBox.shrink(),
                              secondChild: Material(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        YoutubePlayerController.getThumbnail(
                                          videoId:
                                              _controller.params.playlist.first,
                                          quality: ThumbnailQuality.medium,
                                        ),
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                              crossFadeState: value.isReady
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                              duration: const Duration(milliseconds: 300),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  
                    TextButton(
                        onPressed: () {
                          print(_controller);
                          print(_controller);
                          _controller.load(selectedid);
                        },
                        child: Text("açılmadı mı?")),
                        Expanded(child: Text(""),),
                    TextButton(
                        onPressed: () {
                          _controller.setPlaybackRate(1);
                        },
                        child: Text("x1 hız")),
                         TextButton(
                        onPressed: () {
                          _controller.setPlaybackRate(2);
                        },
                        child: Text("x2 hız")),
                  ],
                ),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          child: Column(children: [
                          
                            for (var i in liste) ...[
                              i=="add"? AdAddition(type: AdTypes.inlineAds,):
                              YoutubeListTile(
                                id: i,
                                next: next,
                                selected: selectedid == i,
                              )
                            ]
                          ]),
                        ))),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
     disposefunk=true;
    _controller.close();
    liste.removeAt(2);

     
    //_interstitialAd?.dispose();

    super.dispose();
  }

  next(String id) {
    _controller.load(id);
    setState(() {
      selectedid = id;
    });
  }
}
