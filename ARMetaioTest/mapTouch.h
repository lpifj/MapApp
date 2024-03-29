//
//  mapTouch.h
//  ARMetaioMap
//
//  Created by 池田昂平 on 2014/11/26.
//  Copyright (c) 2014年 池田昂平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface mapTouch : UIView

@property (nonatomic, strong) GMSMapView *mapView;
@property (nonatomic, strong) GMSPanoramaView *panoramaView;

@end
