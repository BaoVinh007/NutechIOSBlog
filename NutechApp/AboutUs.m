//
//  AboutUs.m
//  NutechApp
//
//  Created by Nutech Systems on 5/1/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice]systemVersion]floatValue]>=8.0)
#import "AboutUs.h"

@interface AboutUs ()

@end
//Nutech coordinate
#define NUTECH_LAT 33.863391;
#define NUTECH_LONG -84.465493;

//span
#define THE_SPAN 0.1f;
@implementation AboutUs

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    
//    MKCoordinateRegion myRegion;
//    
//    CLLocationCoordinate2D myCenter;
//    myCenter.latitude = NUTECH_LAT;
//    myCenter.longitude = NUTECH_LONG;
//    
//    MKCoordinateSpan mySpan;
//    mySpan.latitudeDelta = THE_SPAN;
//    mySpan.longitudeDelta = THE_SPAN;
//    
//    myRegion.center = myCenter;
//    myRegion.span = mySpan;
    
    _myCLLocation = [[CLLocationManager alloc]init];
    _myCLLocation.delegate = self;
    
    #ifdef __IPHONE_8_0
    if(IS_OS_8_OR_LATER){
        [_myCLLocation requestAlwaysAuthorization];
    }
    #endif
    
//    [_myCLLocation startUpdatingLocation];
//    _myMapView.delegate = self;
//    _myMapView.mapType = MKMapTypeStandard;
//    _myMapView.showsUserLocation = YES;
    
    
    //CLPlacemark *myPlaceMark = [[CLPlacemark alloc]init];
    /*
     MKPointAnnotation *pa = [[MKPointAnnotation alloc] init];
     pa.coordinate = placemark.location.coordinate;
     pa.title = ABCreateStringWithAddressDictionary(placemark.addressDictionary, YES);
     [mapView addAnnotation:pa];
     
     */
    //[self addAnnotation:myPlaceMark];
    
    //[_myMapView setRegion:myRegion animated:YES];
    [self showAddress];
}

-(void)showAddress
{
    NSString *location = @"2675 Paces Ferry Rd. Atlanta Georgia 30339";
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:location
                 completionHandler:^(NSArray* placemarks, NSError* error){
                     if (placemarks && placemarks.count > 0) {
                         CLPlacemark *topResult = [placemarks objectAtIndex:0];
                         MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:topResult];
                         
                         MKCoordinateRegion region = self.myMapView.region;
                         region.center = placemark.region.center;
                         region.span.longitudeDelta /= 8.0;
                         region.span.latitudeDelta /= 8.0;
                         
                         [self.myMapView setRegion:region animated:YES];
                         [self.myMapView addAnnotation:placemark];
                     }
                 }
     ];
}
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[_myMapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinView"];
    if(!pinView)
    {
        //If an existing pin view was not available, create one.
        pinView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"CustomPinView"];
        pinView.canShowCallout = YES;
    }
    
    return pinView;
}
-(void)addAnnotation:(CLPlacemark*)placeMark{
    MKPointAnnotation *pa = [[MKPointAnnotation alloc] init];
    pa.coordinate = placeMark.location.coordinate;
    pa.title = [placeMark.addressDictionary objectForKey:@"Street"];
    pa.subtitle = [placeMark.addressDictionary objectForKey:@"City"];
    [_myMapView addAnnotation:pa];


}
-(void)viewWillDisappear:(BOOL)animated{

    self.navigationController.navigationBarHidden = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
