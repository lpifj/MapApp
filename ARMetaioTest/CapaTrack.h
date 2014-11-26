//
//  CapaTrack.h
//  ARMetaioTest
//
//  Created by 池田昂平 on 2014/11/18.
//  Copyright (c) 2014年 池田昂平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <GoogleMaps/GoogleMaps.h>
#import "StreetViewController.h"

@interface CapaTrack : UIView{
    CGPoint center;
}

@property AVAudioPlayer *capaRecogSound; //認識音

@property BOOL armarkerRecog; //認識状態 (AR)
@property int aridNum; //ID (AR)

@property BOOL capaRecog; //認識状態 (静電マーカー)
@property int capaidNum; //ID (静電マーカー)

@property NSArray *touchObjects; //タッチオブジェクト (4点)
@property BOOL calcReset;

@property (nonatomic, strong) GMSMapView *mapView;
@property (nonatomic, strong) GMSPanoramaView *panoramaView;

@end
