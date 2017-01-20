//
//  Monumento.h
//  MapGameApp
//
//  Created by dedam on 20/1/17.
//  Copyright © 2017 dedam. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Monumento : NSObject

@property NSString *nombre;
@property NSString *ciudad;
@property CGFloat lat;
@property CGFloat lng;
@property CGFloat distancia;
@property CGFloat pitch;
@property CGFloat heading;

@end
