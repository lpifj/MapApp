//
//  ViewController.m
//  ARMetaioTest
//
//  Created by 池田昂平 on 2014/10/20.
//  Copyright (c) 2014年 池田昂平. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    //glView生成 (metaio AR)
    self.glView = [[EAGLView alloc] initWithFrame:self.view.bounds];
    //ARView (metaio AR)
    self.capatrack = [[CapaTrack alloc] initWithFrame:self.view.bounds];
    
    [super viewDidLoad];
    
    [self loadSound]; //サウンド設定
    
    [self showMap]; //地図表示
    
    [self loadConfig]; //マーカー設定ファイル (AR)
    
    [self.view addSubview:self.capatrack];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//サウンド設定
- (void)loadSound {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"recog" ofType:@"wav"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.recogSound = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
}

//認識イベント (ARマーカー)
- (void)onTrackingEvent:(const metaio::stlcompat::Vector<metaio::TrackingValues> &)poses{
    
    self.capatrack.capaRecog = NO;
    
    for(int i = 0; i < poses.size(); i++){
        NSLog(@"onTrackingEvent: quality:%f", poses[i].quality);
        
        if(poses[0].quality >= 0.5){
            self.capatrack.armarkerRecog = YES;
            
            [self showMap]; //地図表示
            
            /*
            //座標／角度
            NSString *markerName = [NSString stringWithCString:poses[i].cosName.c_str() encoding:[NSString defaultCStringEncoding]];
            [self recogARID:markerName];
            
            [self.arview setNeedsDisplay];
            [self.recogSound play];
            
            metaio::Vector3d transComp = poses[i].translation;
            NSLog(@"x座標: %f", transComp.x);
            NSLog(@"y座標: %f", transComp.y);
            NSLog(@"cosName: %s", poses[i].cosName.c_str());
             */
        }else{
            self.capatrack.armarkerRecog = NO;
        }
    }
    NSLog(@"poses.size() = %lu", poses.size());
}

//マーカー設定ファイル読み込み (AR)
- (void)loadConfig {
    NSString *trackingid01 = [[NSBundle mainBundle] pathForResource:@"idmarkerConfig" ofType:@"zip"];
    if(trackingid01){
        bool success = m_metaioSDK->setTrackingConfiguration([trackingid01 UTF8String]);
        if(!success){
            NSLog(@"No success loading the trackingconfiguration");
        }
    }else{
        NSLog(@"No success loading the trackingconfiguration");
    }
}

//ID認識 (ARマーカー)
- (void)recogARID:(NSString *)markerName{
    
    if([markerName isEqualToString:@"ID marker 1"]){
        self.capatrack.aridNum = 1;
    }else if([markerName isEqualToString:@"ID marker 2"]){
        self.capatrack.aridNum = 2;
    }else{
        self.capatrack.aridNum = 0;
        NSLog(@"maker name is %@", markerName);
    }
}

//地図の表示
- (void)showMap {
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:34.7070318
                                                            longitude:137.615537
                                                                 zoom:10];
    self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.mapView.myLocationEnabled = YES;
    self.view = self.mapView;
}

@end
