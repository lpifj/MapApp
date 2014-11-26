//
//  mapTouch.m
//  ARMetaioMap
//
//  Created by 池田昂平 on 2014/11/26.
//  Copyright (c) 2014年 池田昂平. All rights reserved.
//

#import "mapTouch.h"

@implementation mapTouch

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        
    }
    return self;
}

- (void)showBasicMap {
    //basic map
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:34.7070318
                                                            longitude:137.615537
                                                                 zoom:10];
    self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.mapView.myLocationEnabled = YES;
    //self = self.mapView;
}

- (void)showStreetView {
    CLLocationCoordinate2D panoramaNear = {34.70, 137.61};
    self.panoramaView = [GMSPanoramaView panoramaWithFrame:CGRectZero nearCoordinate:panoramaNear];
    //self =  self.panoramaView;
}


@end
