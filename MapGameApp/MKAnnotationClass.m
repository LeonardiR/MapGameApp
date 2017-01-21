//
//  MKAnnotationClass.m
//  MapGameApp
//
//  Created by dedam on 21/1/17.
//  Copyright © 2017 dedam. All rights reserved.
//

#import "MKAnnotationClass.h"


@implementation MKAnnotationClass

- (instancetype) initWithCoordinates:(CLLocationCoordinate2D)paramCoordinates
                               title:(NSString*)paramTitle
                            subtitle:(NSString*)paramSubtitle {
    self = [super init];
    
    if(self != nil) {
        _coordinate = paramCoordinates;
        _title = paramTitle;
        _subtitle = paramSubtitle;
    }
    
    return self;
}
    @end

