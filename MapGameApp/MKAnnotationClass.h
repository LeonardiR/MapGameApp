//
//  MKAnnotationClass.h
//  MapGameApp
//
//  Created by dedam on 21/1/17.
//  Copyright © 2017 dedam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MKAnnotationClass : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

- (instancetype) initWithCoordinates:(CLLocationCoordinate2D)paramCoordinates
                               title:(NSString*)paramTitle
                            subtitle:(NSString*)paramSubtitle;

@end
