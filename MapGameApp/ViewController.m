//
//  ViewController.m
//  MapGameApp
//
//  Created by dedam on 19/1/17.
//  Copyright © 2017 dedam. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
  _mapaMonumento = [[MKMapView alloc] initWithFrame:self.mapMonuView.bounds];
  _mapaMundo = [[MKMapView alloc] initWithFrame:self.MapMunView.bounds];
    
  [_mapaMonumento setMapType:MKMapTypeSatelliteFlyover];
  [_mapaMundo setMapType:MKMapTypeStandard];
    
    [_mapaMonumento setShowsBuildings:YES];
    [_mapaMonumento setShowsPointsOfInterest:YES];
    [_mapaMonumento setPitchEnabled:YES];
    [_mapaMonumento setZoomEnabled:NO];
    [_mapaMonumento setScrollEnabled:NO];
    [_mapaMonumento setRotateEnabled:YES];
    
    [_mapaMundo setShowsBuildings:YES];
    [_mapaMundo setShowsPointsOfInterest:YES];
    [_mapaMundo setPitchEnabled:YES];
    [_mapaMundo setZoomEnabled:NO];
    [_mapaMundo setScrollEnabled:YES];
    [_mapaMundo setRotateEnabled:YES];
    
    [self initJuego];
    [self.mapMonuView addSubview:_mapaMonumento];
    [self.MapMunView addSubview:_mapaMundo];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initJuego {
    _KilometersIntTotal=0;
    _distancelbl.text = [NSString stringWithFormat: @"0"];
    [self initMonumentos];
    [self selectRandomMonumento];
    [self mostrarMonumento];
    _lpgr = [[UILongPressGestureRecognizer alloc]
             initWithTarget:self action:@selector(handleLongPress:)];
    _lpgr.minimumPressDuration = 2.0;
    
    [self.mapaMundo addGestureRecognizer:_lpgr];
    
}

- (void) mostrarMonumento {
    MKMapCamera* currentCameraMonu  = _mapaMonumento.camera;
    MKMapCamera* currentCameraMun  = _mapaMundo.camera;
    
    [currentCameraMonu setCenterCoordinate:CLLocationCoordinate2DMake(_Monumento.lat,_Monumento.lng)];
    [currentCameraMonu setPitch:_Monumento.pitch];
    [currentCameraMonu setAltitude:200.0f];
    [currentCameraMonu setHeading:_Monumento.heading];
    [_mapaMonumento setCamera:currentCameraMonu animated:NO];
    [_mapaMundo setCamera:currentCameraMun animated:NO];
    
}

- (void) selectRandomMonumento {
    NSUInteger randomIndex = arc4random() % [_monumentos count];
    NSLog(@"%lu", (unsigned long)randomIndex);
    _Monumento = _monumentos[randomIndex];
    [_monumentos removeObjectAtIndex:randomIndex];

}

-(void) initMonumentos {
    Monumento *monumento1 = [[Monumento alloc] init];
    
    monumento1.nombre = @"La Sagrada Familia";
    monumento1.ciudad = @"BARCELONA";
    monumento1.lat = 41.4028931;
    monumento1.lng = 2.1719068;
    monumento1.distancia = 450;
    monumento1.pitch = 80;
    monumento1.heading = 70;
    
    Monumento *monumento2 = [[Monumento alloc] init];
    
    monumento2.nombre = @"La Puerta de Alcalá";
    monumento2.ciudad = @"MADRID";
    monumento2.lat = 40.420788;
    monumento2.lng = -3.688876;
    monumento2.distancia = 200;
    monumento2.pitch = 25;
    monumento2.heading = 230;
    
    Monumento *monumento3 = [[Monumento alloc] init];
    monumento3.nombre = @"Empire State";
    monumento3.ciudad = @"NEW YORK";
    monumento3.lat = 40.748327;
    monumento3.lng = -73.985471;
    monumento3.distancia = 925;
    monumento3.pitch = 45;
    monumento3.heading = 170;
    
    Monumento *monumento4 = [[Monumento alloc] init];
    monumento4.nombre = @"La Torre Eiffel";
    monumento4.ciudad = @"PARÍS";
    monumento4.lat = 48.8583701;
    monumento4.lng = 2.2922926;
    monumento4.distancia = 1200;
    monumento4.pitch = 60;
    monumento4.heading = 60;
    
    Monumento *monumento5 = [[Monumento alloc] init];
    monumento5.nombre = @"El Coliseo";
    monumento5.ciudad = @"ROMA";
    monumento5.lat = 41.8902102;
    monumento5.lng = 12.4900422;
    monumento5.distancia = 250;
    monumento5.pitch = 80;
    monumento5.heading = 75;
    
    Monumento *monumento6 = [[Monumento alloc] init];
    monumento6.nombre = @"La Casa Blanca";
    monumento6.ciudad = @"WASHINGTON";
    monumento6.lat = 38.8976815;
    monumento6.lng = -77.0368423;
    monumento6.distancia = 500;
    monumento6.pitch = 45;
    monumento6.heading = 0;
    
    Monumento *monumento7 = [[Monumento alloc] init];
    monumento7.nombre = @"El Big Ben";
    monumento7.ciudad = @"LONDRES";
    monumento7.lat = 51.5007292;
    monumento7.lng = -0.1268141;
    monumento7.distancia = 550;
    monumento7.pitch = 80;
    monumento7.heading = 260;
    
    Monumento *monumento8 = [[Monumento alloc] init];
    monumento8.nombre = @"El Kremlin";
    monumento8.ciudad = @"MOSCÚ";
    monumento8.lat = 55.751382;
    monumento8.lng = 37.618446;
    monumento8.distancia = 600;
    monumento8.pitch = 30;
    monumento8.heading = 280;
    
    Monumento *monumento9 = [[Monumento alloc] init];
    monumento9.nombre = @"Tokyo Tower";
    monumento9.ciudad = @"TOKYO";
    monumento9.lat = 35.6585805;
    monumento9.lng = 139.7448857;
    monumento9.distancia = 900;
    monumento9.pitch = 45;
    monumento9.heading = 0;
    
    Monumento *monumento10 = [[Monumento alloc] init];
    monumento10.nombre = @"La Opera";
    monumento10.ciudad = @"SIDNEY";
    monumento10.lat = -33.857033;
    monumento10.lng = 151.215191;
    monumento10.distancia = 500;
    monumento10.pitch = 45;
    monumento10.heading = 110;
    
    Monumento *monumento11 = [[Monumento alloc] init];
    monumento11.nombre = @"El Partenón";
    monumento11.ciudad = @"ATENES";
    monumento11.lat = 37.971402;
    monumento11.lng = 23.726591;
    monumento11.distancia = 500;
    monumento11.pitch = 65;
    monumento11.heading = 0;
    
    Monumento *monumento12 = [[Monumento alloc] init];
    monumento12.nombre = @"Plaza de la Constitución";
    monumento12.ciudad = @"MEXICO DF";
    monumento12.lat = 19.4319642;
    monumento12.lng = -99.1333981;
    monumento12.distancia = 500;
    monumento12.pitch = 45;
    monumento12.heading = 0;
    
    Monumento *monumento13 = [[Monumento alloc] init];
    monumento13.nombre = @"Santa Sofía";
    monumento13.ciudad = @"ISTANBUL";
    monumento13.lat = 41.005270;
    monumento13.lng = 28.976960;
    monumento13.distancia = 500;
    monumento13.pitch = 45;
    monumento13.heading = 0;
    
    Monumento *monumento14 = [[Monumento alloc] init];
    monumento14.nombre = @"La Puerta de Brandenburgo";
    monumento14.ciudad = @"BERLÍN";
    monumento14.lat = 52.5162746;
    monumento14.lng = 13.3755153;
    monumento14.distancia = 400;
    monumento14.pitch = 75;
    monumento14.heading = 260;
    
    Monumento *monumento15 = [[Monumento alloc] init];
    monumento15.nombre = @"La Plaza de Mayo";
    monumento15.ciudad = @"BUENOS AIRES";
    monumento15.lat = -34.6080556;
    monumento15.lng = -58.3724665;
    monumento15.distancia = 500;
    monumento15.pitch = 45;
    monumento15.heading = 75;
    
   _monumentos = [NSMutableArray arrayWithObjects:monumento1, monumento2, monumento3, monumento4, monumento5, monumento6, monumento7, monumento8, monumento9, monumento10, monumento11, monumento12, monumento13, monumento14, monumento15, nil];


}
-(void) playSound {
    
    if (_KilometersInt < 300) {
        [[SoundManager sharedManager] prepareToPlayWithSound:@"applause-moderate-03.wav"];
        [[SoundManager sharedManager] playSound:@"applause-moderate-03.wav" looping:NO];
    }
    
    if (_KilometersInt >= 300 || _KilometersInt<= 1000) {
        [[SoundManager sharedManager] prepareToPlayWithSound:@"applause-light-02.wav"];
        [[SoundManager sharedManager] playSound:@"applause-light-02.wav" looping:NO];
    }
    
    if (_KilometersInt > 1000) {
        [[SoundManager sharedManager] prepareToPlayWithSound:@"boo-01.wav"];
        [[SoundManager sharedManager] playSound:@"boo-01.wav" looping:NO];
    }
    
}

- (IBAction)okBtn:(UIButton *)sender {
    CLLocationCoordinate2D MonuCoords = CLLocationCoordinate2DMake(_Monumento.lat, _Monumento.lng);
    MKAnnotationClass *annot = [[MKAnnotationClass alloc] init];
    annot.coordinate = MonuCoords;
    [self.mapaMundo addAnnotation:annot];
    
    _monumentolbl.text = [NSString stringWithFormat: @"%@\r\r%@", _Monumento.nombre, _Monumento.ciudad];
    _distancelbl.text = [NSString stringWithFormat: @"%d", _KilometersIntTotal];
    
    [self playSound];
    [self dibujarLinea];
    [self.mapaMundo removeGestureRecognizer:_lpgr];
}


- (IBAction)nextBtn:(UIButton *)sender {
    [self selectRandomMonumento];
    [self mostrarMonumento];
    [self.mapaMundo addGestureRecognizer:_lpgr];
    _monumentolbl.text = [NSString stringWithFormat: @"Situa el monumento en el mapa"];
    [_mapaMundo removeAnnotations:_mapaMundo.annotations];
    
    
    if (_monumentos == nil || [_monumentos count] == 0) {
        [self initJuego];
    }
    
}

- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
        return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapaMundo];
    CLLocationCoordinate2D touchMapCoordinate =
    [self.mapaMundo convertPoint:touchPoint toCoordinateFromView:self.mapaMundo];
    
    MKAnnotationClass *annot = [[MKAnnotationClass alloc] init];
    annot.coordinate = touchMapCoordinate;
    [self.mapaMundo addAnnotation:annot];
    
    _ini = [[CLLocation alloc] initWithLatitude:_Monumento.lat longitude:_Monumento.lng];
    _fin = [[CLLocation alloc] initWithLatitude: touchMapCoordinate.latitude longitude:touchMapCoordinate.longitude];
    CLLocationDistance kilometers = [_fin distanceFromLocation:_ini] / 1000;
    _KilometersInt = (int) kilometers;
    _KilometersIntTotal+=_KilometersInt;
    [self.mapaMundo removeGestureRecognizer:_lpgr];
    
}

- (MKOverlayRenderer *) mapView:(MKMapView *)mapView
             rendererForOverlay:(id<MKOverlay>)overlay {
    
    MKPolylineRenderer *polylineRender  = [[MKPolylineRenderer alloc]
                                           initWithOverlay:overlay];
    UIColor *lineColor = [UIColor redColor];
    
    if([overlay isKindOfClass:[MKGeodesicPolyline class]]) {
        lineColor = [UIColor blackColor];
    }
    [polylineRender setStrokeColor:lineColor];
    [polylineRender setLineWidth:3.0f];
    
    return polylineRender;
}

- (void) dibujarLinea {
    
    
    [_mapaMundo showAnnotations:@[_ini, _fin] animated:NO];
    CLLocationCoordinate2D points[2];
    
    points[0] = _ini.coordinate;
    points[1] = _fin.coordinate;
    
    MKGeodesicPolyline *overlayPolyline =
    [MKGeodesicPolyline polylineWithCoordinates:points count:2];
    
    MKGeodesicPolyline *geodesicPolyline =
    [MKGeodesicPolyline polylineWithCoordinates:points count:2];
    
    [_mapaMundo addOverlay:overlayPolyline];
    [_mapaMundo addOverlay:geodesicPolyline];
    
        
    

}

@end
