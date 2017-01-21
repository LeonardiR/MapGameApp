//
//  ViewController.h
//  MapGameApp
//
//  Created by dedam on 19/1/17.
//  Copyright © 2017 dedam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Monumento.h"
#import "MKAnnotationClass.h"

@interface ViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *mapMonuView;
@property (weak, nonatomic) IBOutlet UIView *MapMunView;
@property (strong, nonatomic) MKMapView *mapaMonumento;
@property (strong, nonatomic) MKMapView *mapaMundo;
@property (strong, nonatomic) Monumento *Monumento;
@property(nonatomic,retain) NSMutableArray *monumentos;
@property (weak, nonatomic) IBOutlet UILabel *monumentolbl;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIButton *okBtn;
- (IBAction)okBtn:(UIButton *)sender;
- (IBAction)nextBtn:(UIButton *)sender;
@end

